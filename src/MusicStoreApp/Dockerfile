FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY ["MusicStoreApp.csproj", "."]
RUN dotnet restore "MusicStoreApp.csproj"
COPY . .
RUN dotnet build "MusicStoreApp.csproj" -c Release -o /app/build
RUN dotnet publish "MusicStoreApp.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 8080
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "MusicStoreApp.dll"]
