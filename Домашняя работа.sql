--Таблица "Жанр"
CREATE TABLE IF NOT EXISTS Genres(
	Genres_id serial PRIMARY KEY,
	Name_genres VARCHAR(60) UNIQUE NOT NULL
);
--Таблица "Исполнители"
CREATE TABLE IF NOT EXISTS Performers(
	Performers_id serial PRIMARY KEY,
	Nickname VARCHAR(60) NOT NULL
);
--Таблица "Альбом"
CREATE TABLE IF NOT EXISTS Album(
	Album_id serial PRIMARY KEY,
	Name_album VARCHAR(60) UNIQUE NOT NULL,
	Released DATA NOT NULL
);
--отношения многие ко многим "Испонители"-"Жанры"
CREATE TABLE IF NOT EXISTS PerformersGenres (
	Performers_id INTEGER NOT NULL REFERENCES Performers(Performers_id),
	Genres_id INTEGER NOT NULL REFERENCES Genres(Genres_id),
	CONSTRAINT pk PRIMARY KEY (Performers_id, Genres_id)
);
--отношения многие ко многим "Испонители"-"Альбомы"
CREATE TABLE IF NOT EXISTS PerformersAlbum (
	Performers_id INTEGER NOT NULL REFERENCES Performers(Performers_id),
	Album_id INTEGER NOT NULL REFERENCES Album(Album_id),
	CONSTRAINT pk1 PRIMARY KEY (Performers_id, Album_id)
);
--Таблица "Трек"
CREATE TABLE IF NOT EXISTS Tracks (
	Tracks_id SERIAL PRIMARY KEY,
	Name_Tracks VARCHAR(60) UNIQUE NOT NULL,
	Duration VARCHAR(60) UNIQUE NOT NULL,
	Album_id INTEGER NOT NULL REFERENCES Album(Album_id)
);
--Таблица "Сборник"
CREATE TABLE IF NOT EXISTS Collection (
	Collection_id SERIAL PRIMARY KEY,
	Name_Collection VARCHAR(60) UNIQUE NOT NULL,
	Release_year DATA UNIQUE NOT NULL
);
--отношения многие ко многим "Сбоники"-"Треки"
CREATE TABLE IF NOT EXISTS CollectionTracks (
	Collection_id INTEGER NOT NULL REFERENCES Collection(Collection_id),
	Tracks_id INTEGER NOT NULL REFERENCES Tracks(Tracks_id),
	CONSTRAINT pk2 PRIMARY KEY (Collection_id, Tracks_id)
);