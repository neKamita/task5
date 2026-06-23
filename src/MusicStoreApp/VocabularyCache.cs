using System.Data;
using Npgsql;

namespace MusicStoreApp;

public static class VocabularyCache
{
    public static Dictionary<string, List<string>> Words = new();

    public static void Load(string connectionString)
    {
        Words.Clear();
        using var conn = new NpgsqlConnection(connectionString);
        conn.Open();

        using var cmd = new NpgsqlCommand("SELECT LanguageCode, Category, Word FROM LocalizationWords ORDER BY LanguageCode, Category, Word", conn);
        using var reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            var lang = reader.GetString(0);
            var category = reader.GetString(1);
            var word = reader.GetString(2);

            var key = $"{lang}_{category}";
            if (!Words.ContainsKey(key))
            {
                Words[key] = new List<string>();
            }
            Words[key].Add(word);
        }
    }
}
