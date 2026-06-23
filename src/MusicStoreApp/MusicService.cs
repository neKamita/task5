using Bogus;
using Melanchall.DryWetMidi.Common;
using Melanchall.DryWetMidi.Composing;
using Melanchall.DryWetMidi.Core;
using Melanchall.DryWetMidi.Interaction;
using Jdenticon;

namespace MusicStoreApp;

public class MusicService
{
    public List<SongRecord> GenerateData(string region, int seed, int page, double likesPerSong)
    {
        var result = new List<SongRecord>();
        int startIndex = (page - 1) * 10 + 1;

        for (int i = 0; i < 10; i++)
        {
            int recordIndex = startIndex + i;
            var recordSeed = seed + recordIndex;
            var recordRandom = new Randomizer(recordSeed);

            var song = new SongRecord();
            song.Index = recordIndex;

            var adjectives = VocabularyCache.Words.GetValueOrDefault(region + "_SongAdjective", new List<string> { "Fast" });
            var nouns = VocabularyCache.Words.GetValueOrDefault(region + "_SongNoun", new List<string> { "Carrot" });
            song.Title = recordRandom.ArrayElement(adjectives.ToArray()) + " " + recordRandom.ArrayElement(nouns.ToArray());

            var firstNames = VocabularyCache.Words.GetValueOrDefault(region + "_ArtistFirst", new List<string> { "John" });
            var lastNames = VocabularyCache.Words.GetValueOrDefault(region + "_ArtistLast", new List<string> { "Doe" });
            song.Artist = recordRandom.ArrayElement(firstNames.ToArray()) + " " + recordRandom.ArrayElement(lastNames.ToArray());

            if (recordRandom.Number(1, 100) > 50)
            {
                song.Album = "Single";
            }
            else
            {
                song.Album = recordRandom.ArrayElement(adjectives.ToArray()) + " " + recordRandom.ArrayElement(nouns.ToArray());
            }

            var genres = VocabularyCache.Words.GetValueOrDefault(region + "_Genre", new List<string> { "Pop" });
            song.Genre = recordRandom.ArrayElement(genres.ToArray());

            int likesBase = (int)Math.Floor(likesPerSong);
            double fraction = likesPerSong - likesBase;
            
            var likesRandom = new Randomizer(recordSeed + 1000000); 
            int extraLike = likesRandom.Double(0, 1) < fraction ? 1 : 0;
            song.Likes = likesBase + extraLike;

            var reviewsList = VocabularyCache.Words.GetValueOrDefault(region + "_Review", new List<string> { "Good" });
            int reviewCount = recordRandom.Number(1, 4);
            var reviewRandom = new Randomizer(recordSeed + 2000000);
            for (int r = 0; r < reviewCount; r++)
            {
                song.Reviews.Add(reviewRandom.ArrayElement(reviewsList.ToArray()));
            }

            song.CoverSvg = GenerateSvg(recordSeed, song.Title, song.Artist);
            song.MidiBase64 = GenerateMidi(recordSeed);

            result.Add(song);
        }

        return result;
    }

    private string GenerateSvg(int seed, string title, string artist)
    {
        var baseSvg = Jdenticon.Identicon.FromValue(seed.ToString(), size: 200).ToSvg();
        
        // Ensure text is XML-safe (basic escape)
        var safeTitle = System.Security.SecurityElement.Escape(title) ?? "";
        var safeArtist = System.Security.SecurityElement.Escape(artist) ?? "";
        
        var textOverlay = $"<rect width='200' height='40' fill='rgba(0,0,0,0.5)' y='0' />" +
                          $"<text x='10' y='25' fill='white' font-size='16' font-weight='bold' font-family='sans-serif'>{safeTitle}</text>" +
                          $"<rect width='200' height='30' fill='rgba(0,0,0,0.5)' y='170' />" +
                          $"<text x='10' y='190' fill='white' font-size='14' font-family='sans-serif'>{safeArtist}</text>";
                          
        return baseSvg.Replace("</svg>", textOverlay + "</svg>");
    }

    private string GenerateMidi(int seed)
    {
        var r = new Randomizer(seed);
        var patternBuilder = new PatternBuilder()
            .SetNoteLength(new MusicalTimeSpan(1, 8));

        var notes = new[] { Melanchall.DryWetMidi.MusicTheory.NoteName.C, Melanchall.DryWetMidi.MusicTheory.NoteName.D, Melanchall.DryWetMidi.MusicTheory.NoteName.E, Melanchall.DryWetMidi.MusicTheory.NoteName.F, Melanchall.DryWetMidi.MusicTheory.NoteName.G, Melanchall.DryWetMidi.MusicTheory.NoteName.A, Melanchall.DryWetMidi.MusicTheory.NoteName.B };

        for (int i = 0; i < 8; i++)
        {
            var note = r.ArrayElement(notes);
            var octave = r.Number(4, 5);
            patternBuilder.Note(Melanchall.DryWetMidi.MusicTheory.Note.Get(note, octave));
        }

        var pattern = patternBuilder.Build();
        var midiFile = pattern.ToFile(TempoMap.Default);
        using var ms = new MemoryStream();
        midiFile.Write(ms);
        return Convert.ToBase64String(ms.ToArray());
    }
}
