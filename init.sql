CREATE TABLE LocalizationWords (
    Id SERIAL PRIMARY KEY,
    LanguageCode VARCHAR(10) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Word VARCHAR(255) NOT NULL
);

INSERT INTO LocalizationWords (LanguageCode, Category, Word) VALUES
('en-US', 'ArtistFirst', 'John'), ('en-US', 'ArtistFirst', 'James'), ('en-US', 'ArtistFirst', 'Mary'), ('en-US', 'ArtistFirst', 'Sarah'), ('en-US', 'ArtistFirst', 'The'), ('en-US', 'ArtistFirst', 'Crazy'), ('en-US', 'ArtistFirst', 'Neon'), ('en-US', 'ArtistFirst', 'Silent'),
('en-US', 'ArtistLast', 'Smith'), ('en-US', 'ArtistLast', 'Johnson'), ('en-US', 'ArtistLast', 'Williams'), ('en-US', 'ArtistLast', 'Jones'), ('en-US', 'ArtistLast', 'Band'), ('en-US', 'ArtistLast', 'Boys'), ('en-US', 'ArtistLast', 'Shadows'), ('en-US', 'ArtistLast', 'Riders'),
('en-US', 'SongAdjective', 'Dark'), ('en-US', 'SongAdjective', 'Bright'), ('en-US', 'SongAdjective', 'Fast'), ('en-US', 'SongAdjective', 'Slow'), ('en-US', 'SongAdjective', 'Happy'), ('en-US', 'SongAdjective', 'Sad'), ('en-US', 'SongAdjective', 'Lost'), ('en-US', 'SongAdjective', 'Found'),
('en-US', 'SongNoun', 'Love'), ('en-US', 'SongNoun', 'Heart'), ('en-US', 'SongNoun', 'World'), ('en-US', 'SongNoun', 'Night'), ('en-US', 'SongNoun', 'Day'), ('en-US', 'SongNoun', 'Life'), ('en-US', 'SongNoun', 'Dream'), ('en-US', 'SongNoun', 'Fire'),
('en-US', 'Genre', 'Rock'), ('en-US', 'Genre', 'Pop'), ('en-US', 'Genre', 'Jazz'), ('en-US', 'Genre', 'Blues'), ('en-US', 'Genre', 'Electronic'), ('en-US', 'Genre', 'Classical'), ('en-US', 'Genre', 'Country'), ('en-US', 'Genre', 'Hip-Hop'),
('en-US', 'Review', 'Great song!'), ('en-US', 'Review', 'I love this.'), ('en-US', 'Review', 'Not bad.'), ('en-US', 'Review', 'Amazing vocals.'), ('en-US', 'Review', 'Terrible.'), ('en-US', 'Review', 'A true masterpiece.'), ('en-US', 'Review', 'Listened to it 10 times.'), ('en-US', 'Review', 'Boring.'),

('de-DE', 'ArtistFirst', 'Hans'), ('de-DE', 'ArtistFirst', 'Klaus'), ('de-DE', 'ArtistFirst', 'Anna'), ('de-DE', 'ArtistFirst', 'Julia'), ('de-DE', 'ArtistFirst', 'Die'), ('de-DE', 'ArtistFirst', 'Verrückte'), ('de-DE', 'ArtistFirst', 'Rote'), ('de-DE', 'ArtistFirst', 'Stille'),
('de-DE', 'ArtistLast', 'Müller'), ('de-DE', 'ArtistLast', 'Schmidt'), ('de-DE', 'ArtistLast', 'Schneider'), ('de-DE', 'ArtistLast', 'Fischer'), ('de-DE', 'ArtistLast', 'Jungen'), ('de-DE', 'ArtistLast', 'Hunde'), ('de-DE', 'ArtistLast', 'Schatten'), ('de-DE', 'ArtistLast', 'Reiter'),
('de-DE', 'SongAdjective', 'Dunkel'), ('de-DE', 'SongAdjective', 'Hell'), ('de-DE', 'SongAdjective', 'Schnell'), ('de-DE', 'SongAdjective', 'Langsam'), ('de-DE', 'SongAdjective', 'Glücklich'), ('de-DE', 'SongAdjective', 'Traurig'), ('de-DE', 'SongAdjective', 'Verloren'), ('de-DE', 'SongAdjective', 'Gefunden'),
('de-DE', 'SongNoun', 'Liebe'), ('de-DE', 'SongNoun', 'Herz'), ('de-DE', 'SongNoun', 'Welt'), ('de-DE', 'SongNoun', 'Nacht'), ('de-DE', 'SongNoun', 'Tag'), ('de-DE', 'SongNoun', 'Leben'), ('de-DE', 'SongNoun', 'Traum'), ('de-DE', 'SongNoun', 'Feuer'),
('de-DE', 'Genre', 'Rock'), ('de-DE', 'Genre', 'Pop'), ('de-DE', 'Genre', 'Jazz'), ('de-DE', 'Genre', 'Schlager'), ('de-DE', 'Genre', 'Elektronisch'), ('de-DE', 'Genre', 'Klassik'), ('de-DE', 'Genre', 'Volksmusik'), ('de-DE', 'Genre', 'Hip-Hop'),
('de-DE', 'Review', 'Tolles Lied!'), ('de-DE', 'Review', 'Ich liebe das.'), ('de-DE', 'Review', 'Nicht schlecht.'), ('de-DE', 'Review', 'Erstaunlicher Gesang.'), ('de-DE', 'Review', 'Schrecklich.'), ('de-DE', 'Review', 'Ein wahres Meisterwerk.'), ('de-DE', 'Review', 'Habe es 10 Mal gehört.'), ('de-DE', 'Review', 'Langweilig.'),

('ru-RU', 'ArtistFirst', 'Иван'), ('ru-RU', 'ArtistFirst', 'Алексей'), ('ru-RU', 'ArtistFirst', 'Мария'), ('ru-RU', 'ArtistFirst', 'Анна'), ('ru-RU', 'ArtistFirst', 'Безумные'), ('ru-RU', 'ArtistFirst', 'Дикие'), ('ru-RU', 'ArtistFirst', 'Слепые'), ('ru-RU', 'ArtistFirst', 'Ночные'),
('ru-RU', 'ArtistLast', 'Иванов'), ('ru-RU', 'ArtistLast', 'Смирнов'), ('ru-RU', 'ArtistLast', 'Петров'), ('ru-RU', 'ArtistLast', 'Соколов'), ('ru-RU', 'ArtistLast', 'Парни'), ('ru-RU', 'ArtistLast', 'Волки'), ('ru-RU', 'ArtistLast', 'Тени'), ('ru-RU', 'ArtistLast', 'Псы'),
('ru-RU', 'SongAdjective', 'Темный'), ('ru-RU', 'SongAdjective', 'Светлый'), ('ru-RU', 'SongAdjective', 'Быстрый'), ('ru-RU', 'SongAdjective', 'Медленный'), ('ru-RU', 'SongAdjective', 'Счастливый'), ('ru-RU', 'SongAdjective', 'Грустный'), ('ru-RU', 'SongAdjective', 'Потерянный'), ('ru-RU', 'SongAdjective', 'Найденный'),
('ru-RU', 'SongNoun', 'Любовь'), ('ru-RU', 'SongNoun', 'Сердце'), ('ru-RU', 'SongNoun', 'Мир'), ('ru-RU', 'SongNoun', 'Ночь'), ('ru-RU', 'SongNoun', 'День'), ('ru-RU', 'SongNoun', 'Жизнь'), ('ru-RU', 'SongNoun', 'Сон'), ('ru-RU', 'SongNoun', 'Огонь'),
('ru-RU', 'Genre', 'Рок'), ('ru-RU', 'Genre', 'Поп'), ('ru-RU', 'Genre', 'Джаз'), ('ru-RU', 'Genre', 'Фолк'), ('ru-RU', 'Genre', 'Электроника'), ('ru-RU', 'Genre', 'Классика'), ('ru-RU', 'Genre', 'Кантри'), ('ru-RU', 'Genre', 'Хип-Хоп'),
('ru-RU', 'Review', 'Отличная песня!'), ('ru-RU', 'Review', 'Мне это нравится.'), ('ru-RU', 'Review', 'Неплохо.'), ('ru-RU', 'Review', 'Удивительный вокал.'), ('ru-RU', 'Review', 'Ужасно.'), ('ru-RU', 'Review', 'Настоящий шедевр.'), ('ru-RU', 'Review', 'Слушал 10 раз.'), ('ru-RU', 'Review', 'Скучно.');
