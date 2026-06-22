namespace MusicStoreApp;

public class SongRecord
{
    public int Index { get; set; }
    public string Title { get; set; }
    public string Artist { get; set; }
    public string Album { get; set; }
    public string Genre { get; set; }
    public int Likes { get; set; }
    public string CoverSvg { get; set; }
    public string MidiBase64 { get; set; }
    public List<string> Reviews { get; set; } = new();
}
