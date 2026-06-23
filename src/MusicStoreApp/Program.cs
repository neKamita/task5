var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddScoped<MusicStoreApp.MusicService>();

var app = builder.Build();

try {
    var connStr = Environment.GetEnvironmentVariable("DB_CONNECTION_STRING") ?? "Host=localhost;Database=musicstore;Username=musicuser;Password=musicpassword";
    MusicStoreApp.VocabularyCache.Load(connStr);
} catch {
    // Ignore db load error for now in Junior style
}

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseRouting();
app.UseAuthorization();

app.MapGet("/api/songs", (string region, int seed, int page, double likes, MusicStoreApp.MusicService musicService) =>
{
    var data = musicService.GenerateData(region, seed, page, likes);
    return Results.Json(data);
});

app.MapStaticAssets();
app.MapRazorPages()
   .WithStaticAssets();

app.Run();
