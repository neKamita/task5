CREATE TABLE LocalizationWords (
    Id SERIAL PRIMARY KEY,
    LanguageCode VARCHAR(10) NOT KEY NULL,
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

('uk-UA', 'ArtistFirst', 'Іван'), ('uk-UA', 'ArtistFirst', 'Тарас'), ('uk-UA', 'ArtistFirst', 'Марія'), ('uk-UA', 'ArtistFirst', 'Оксана'), ('uk-UA', 'ArtistFirst', 'Шалені'), ('uk-UA', 'ArtistFirst', 'Дикі'), ('uk-UA', 'ArtistFirst', 'Сліпі'), ('uk-UA', 'ArtistFirst', 'Нічні'),
('uk-UA', 'ArtistLast', 'Шевченко'), ('uk-UA', 'ArtistLast', 'Коваленко'), ('uk-UA', 'ArtistLast', 'Ткаченко'), ('uk-UA', 'ArtistLast', 'Кравченко'), ('uk-UA', 'ArtistLast', 'Хлопці'), ('uk-UA', 'ArtistLast', 'Козаки'), ('uk-UA', 'ArtistLast', 'Тіні'), ('uk-UA', 'ArtistLast', 'Пси'),
('uk-UA', 'SongAdjective', 'Темний'), ('uk-UA', 'SongAdjective', 'Світлий'), ('uk-UA', 'SongAdjective', 'Швидкий'), ('uk-UA', 'SongAdjective', 'Повільний'), ('uk-UA', 'SongAdjective', 'Щасливий'), ('uk-UA', 'SongAdjective', 'Сумний'), ('uk-UA', 'SongAdjective', 'Загублений'), ('uk-UA', 'SongAdjective', 'Знайдений'),
('uk-UA', 'SongNoun', 'Кохання'), ('uk-UA', 'SongNoun', 'Серце'), ('uk-UA', 'SongNoun', 'Світ'), ('uk-UA', 'SongNoun', 'Ніч'), ('uk-UA', 'SongNoun', 'День'), ('uk-UA', 'SongNoun', 'Життя'), ('uk-UA', 'SongNoun', 'Сон'), ('uk-UA', 'SongNoun', 'Вогонь'),
('uk-UA', 'Genre', 'Рок'), ('uk-UA', 'Genre', 'Поп'), ('uk-UA', 'Genre', 'Джаз'), ('uk-UA', 'Genre', 'Фолк'), ('uk-UA', 'Genre', 'Електроніка'), ('uk-UA', 'Genre', 'Класика'), ('uk-UA', 'Genre', 'Кантрі'), ('uk-UA', 'Genre', 'Хіп-Хоп'),
('uk-UA', 'Review', 'Чудова пісня!'), ('uk-UA', 'Review', 'Мені це подобається.'), ('uk-UA', 'Review', 'Непогано.'), ('uk-UA', 'Review', 'Дивовижний вокал.'), ('uk-UA', 'Review', 'Жахливо.'), ('uk-UA', 'Review', 'Справжній шедевр.'), ('uk-UA', 'Review', 'Слухав 10 разів.'), ('uk-UA', 'Review', 'Нудно.');
