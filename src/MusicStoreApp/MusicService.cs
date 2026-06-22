using Bogus;
using Melanchall.DryWetMidi.Common;
using Melanchall.DryWetMidi.Composing;
using Melanchall.DryWetMidi.Core;
using Melanchall.DryWetMidi.Interaction;

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
        var r = new Random(seed);
        var c1 = $"rgb({r.Next(256)},{r.Next(256)},{r.Next(256)})";
        var c2 = $"rgb({r.Next(256)},{r.Next(256)},{r.Next(256)})";
        var shapeType = r.Next(1, 3);
        var shape = "";
        if (shapeType == 1)
        {
            shape = $"<circle cx='{r.Next(50, 150)}' cy='{r.Next(50, 150)}' r='{r.Next(20, 80)}' fill='rgba(255,255,255,0.3)' />";
        }
        else
        {
            shape = $"<rect x='{r.Next(10, 100)}' y='{r.Next(10, 100)}' width='{r.Next(50, 150)}' height='{r.Next(50, 150)}' fill='rgba(255,255,255,0.3)' />";
        }

        return $@"<svg width='200' height='200' xmlns='http://www.w3.org/2000/svg'>
<defs><linearGradient id='grad{seed}' x1='0%' y1='0%' x2='100%' y2='100%'><stop offset='0%' style='stop-color:{c1};stop-opacity:1' /><stop offset='100%' style='stop-color:{c2};stop-opacity:1' /></linearGradient></defs>
<rect width='200' height='200' fill='url(#grad{seed})' />
{shape}
<text x='10' y='90' fill='white' font-family='sans-serif' font-size='16' font-weight='bold'>{title}</text>
<text x='10' y='110' fill='white' font-family='sans-serif' font-size='12'>{artist}</text>
</svg>";
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
