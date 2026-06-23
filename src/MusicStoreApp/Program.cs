var builder = WebApplication.CreateBuilder(args);

builder.Services.AddScoped<MusicStoreApp.MusicService>();

var app = builder.Build();

try {
    var connStr = Environment.GetEnvironmentVariable("DB_CONNECTION_STRING") ?? "Host=localhost;Database=musicstore;Username=musicuser;Password=musicpassword";
    MusicStoreApp.VocabularyCache.Load(connStr);
} catch {
}

if (!app.Environment.IsDevelopment())
{
    app.UseHsts();
}

app.MapGet("/api/songs", (string region, int seed, int page, double likes, MusicStoreApp.MusicService musicService) =>
{
    var data = musicService.GenerateData(region, seed, page, likes);
    return Results.Json(data);
});

app.UseDefaultFiles();
app.UseStaticFiles();

app.Run();
