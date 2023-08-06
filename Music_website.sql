CREATE TABLE IF NOT EXISTS Genres (
genre_id SERIAL PRIMARY KEY,
title TEXT
);
CREATE TABLE IF NOT EXISTS Singers (
singer_id SERIAL PRIMARY KEY,
alias TEXT
);
CREATE TABLE IF NOT EXISTS Albums (
albums_id SERIAL PRIMARY KEY, 
title TEXT,
years INTEGER
);
CREATE TABLE IF NOT EXISTS Tracks (
tracks_id SERIAL PRIMARY KEY,
title TEXT,
times TIME,
albums_id INTEGER REFERENCES Albums(albums_id)
);
CREATE TABLE IF NOT EXISTS Collection (
collection_id SERIAL PRIMARY KEY,
title TEXT,
years INTEGER
);
CREATE TABLE IF NOT EXISTS Genre_Singer (
id SERIAL PRIMARY KEY,
genre_id INTEGER REFERENCES Genres(genre_id),
singer_id INTEGER REFERENCES Singers(singer_id)
);
CREATE TABLE IF NOT EXISTS Singer_Album (
id SERIAL PRIMARY KEY,
singer_id INTEGER REFERENCES Singers(singer_id),
album_id INTEGER REFERENCES Albums(albums_id)
);
CREATE TABLE IF NOT EXISTS Track_Collection (
id SERIAL PRIMARY KEY,
track_id INTEGER REFERENCES Tracks(tracks_id),
collection_id INTEGER REFERENCES Collection(collection_id)
);
DROP TABLE Singer_Album;
CREATE TABLE IF NOT EXISTS Singer_Album (
id SERIAL PRIMARY KEY,
singer_id INTEGER REFERENCES Singers(singer_id),
albums_id INTEGER REFERENCES Albums(albums_id)
);
