--ЗАДАЧА 1__________________________________________________________________________________________________________________
INSERT INTO singers (alias)
VALUES ('Sia');
INSERT INTO singers (alias)
VALUES ('Imagine Dragons');
INSERT INTO singers (alias)
VALUES ('Rihanna');
INSERT INTO singers (alias)
VALUES ('Green Day');
DELETE FROM singers 
WHERE singer_id = 4;
DELETE FROM singers 
WHERE singer_id = 5;
INSERT INTO singers (alias)
VALUES ('Green Day');
DELETE FROM singers 
WHERE singer_id = 6;
INSERT INTO singers
VALUES (4, 'Green Day');

ALTER TABLE tracks DROP COLUMN times;
ALTER TABLE tracks ADD COLUMN duration integer;

INSERT INTO tracks 
VALUES (1, 'Cheap Thrills');
INSERT INTO tracks 
VALUES (2, 'Elastic Heart');
INSERT INTO tracks 
VALUES (3, 'Chandelier');

INSERT INTO tracks 
VALUES (4, 'Follow you');
INSERT INTO tracks 
VALUES (5, 'Thunder');
INSERT INTO tracks 
VALUES (6, 'Whatever it takes');

INSERT INTO tracks 
VALUES (7, 'Te amo');
INSERT INTO tracks 
VALUES (8, 'Diamonds');
INSERT INTO tracks 
VALUES (9, 'Umbrella');

INSERT INTO tracks 
VALUES (10, '21 guns');
INSERT INTO tracks 
VALUES (11, 'Boulevar of broken dreams');
INSERT INTO tracks 
VALUES (12, 'She');

INSERT INTO genres  
VALUES (1, 'pop punk');
INSERT INTO genres  
VALUES (2, 'pop');
INSERT INTO genres  
VALUES (3, 'indie rock');
INSERT INTO genres  
VALUES (4, 'R & B');

UPDATE tracks
SET duration = 224
WHERE tracks_id = 1;
UPDATE tracks
SET duration = 257
WHERE tracks_id = 2;
UPDATE tracks
SET duration = 216
WHERE tracks_id = 3;
UPDATE tracks
SET duration = 175
WHERE tracks_id = 4;
UPDATE tracks
SET duration = 187
WHERE tracks_id = 5;
UPDATE tracks
SET duration = 201
WHERE tracks_id = 6;
UPDATE tracks
SET duration = 225
WHERE tracks_id = 7;
UPDATE tracks
SET duration = 208
WHERE tracks_id = 8;
UPDATE tracks
SET duration = 251
WHERE tracks_id = 9;
UPDATE tracks
SET duration = 322
WHERE tracks_id = 10;
UPDATE tracks
SET duration = 261
WHERE tracks_id = 11;
UPDATE tracks
SET duration = 134
WHERE tracks_id = 12;

INSERT INTO albums  
VALUES (1, 'This is acting', 2016);
INSERT INTO albums  
VALUES (2, 'Voices', 2014);
INSERT INTO albums  
VALUES (3, 'Evolve', 2017);
INSERT INTO albums  
VALUES (4, 'Mercury-Act 1', 2021);
INSERT INTO albums  
VALUES (5, 'Unapologetic', 2012);
INSERT INTO albums  
VALUES (6, 'Good girl gone bad', 2007);
INSERT INTO albums  
VALUES (7, 'Rated R', 2009);
INSERT INTO albums  
VALUES (8, 'Boulevard of broken dreams', 1989);
INSERT INTO albums  
VALUES (9, 'Greatest hits', 2017);

INSERT INTO collection  
VALUES (1, 'Fun', 2023);
INSERT INTO collection  
VALUES (2, 'Slow', 2023);
INSERT INTO collection  
VALUES (3, 'Active', 2023);
INSERT INTO collection  
VALUES (4, 'For trip', 2023);

UPDATE tracks 
SET albums_id  = 1
WHERE tracks_id = 1;
UPDATE tracks 
SET albums_id  = 1
WHERE tracks_id = 2;
UPDATE tracks 
SET albums_id  = 2
WHERE tracks_id = 3;
UPDATE tracks 
SET albums_id  = 4
WHERE tracks_id = 4;
UPDATE tracks 
SET albums_id  = 3
WHERE tracks_id = 5;
UPDATE tracks 
SET albums_id  = 3
WHERE tracks_id = 6;
UPDATE tracks 
SET albums_id  = 7
WHERE tracks_id = 7;
UPDATE tracks 
SET albums_id  = 5
WHERE tracks_id = 8;
UPDATE tracks 
SET albums_id  = 6
WHERE tracks_id = 9;
UPDATE tracks 
SET albums_id  = 9
WHERE tracks_id = 10;
UPDATE tracks 
SET albums_id  = 8
WHERE tracks_id = 11;
UPDATE tracks 
SET albums_id  = 9
WHERE tracks_id = 12;

INSERT INTO genre_singer  
VALUES (1, 1, 1);
INSERT INTO genre_singer  
VALUES (2, 2, 2);
INSERT INTO genre_singer  
VALUES (3, 4, 3);
INSERT INTO genre_singer  
VALUES (4, 3, 4);

INSERT INTO singer_album
VALUES (1, 1, 1);
INSERT INTO singer_album
VALUES (2, 1, 2);
INSERT INTO singer_album
VALUES (3, 2, 3);
INSERT INTO singer_album
VALUES (4, 2, 4);
INSERT INTO singer_album
VALUES (5, 3, 5);
INSERT INTO singer_album
VALUES (6, 3, 6);
INSERT INTO singer_album
VALUES (7, 3, 7);
INSERT INTO singer_album 
VALUES (8, 4, 8);
INSERT INTO singer_album
VALUES (9, 4, 9);

INSERT INTO track_collection 
VALUES (1, 1, 1);
INSERT INTO track_collection 
VALUES (2, 2, 3);
INSERT INTO track_collection 
VALUES (3, 3, 3);
INSERT INTO track_collection 
VALUES (4, 4, 1);
INSERT INTO track_collection 
VALUES (5, 5, 3);
INSERT INTO track_collection 
VALUES (6, 6, 4);
INSERT INTO track_collection 
VALUES (7, 7, 2);
INSERT INTO track_collection 
VALUES (8, 8, 2);
INSERT INTO track_collection 
VALUES (9, 9, 2);
INSERT INTO track_collection 
VALUES (10, 10, 2);
INSERT INTO track_collection 
VALUES (11, 11, 2);
INSERT INTO track_collection 
VALUES (12, 12, 4);

-- ЗАДАЧА 2__________________________________________________________________________________________________________________
-- 1.Название и продолжительность самого длительного трека
SELECT title, duration FROM tracks
WHERE duration = (SELECT max(duration) FROM tracks);

-- 2.Название треков, продолжительность которых не менее 3,5 минут (201 сек)
SELECT title FROM tracks
WHERE duration >= 210;

-- 3.Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name FROM collection
WHERE 2018 <= years AND years <= 2020;

-- Обновила данные
UPDATE collection 
SET years  = 2020
WHERE collection_id = 1;
UPDATE collection 
SET years  = 2019
WHERE collection_id = 3;
UPDATE collection 
SET years  = 2017
WHERE collection_id = 2;

-- 4.Исполнители, чьё имя состоит из одного слова
SELECT alias FROM singers
WHERE alias NOT LIKE '% %';

-- Обновила данные
UPDATE tracks 
SET title = 'Saved my life'
WHERE tracks_id = 3;
UPDATE tracks 
SET title = 'My life'
WHERE tracks_id = 6;

-- 5.Название треков, которые содержат слово «мой» или «my»
SELECT title FROM tracks
WHERE title LIKE '%My%' OR title LIKE '%my%' OR title LIKE '%Мой%' OR title LIKE '%мой%';

-- ЗАДАЧА 3__________________________________________________________________________________________________________________

-- 1.Количество исполнителей в каждом жанре
SELECT title, count(title) FROM genres g 
LEFT JOIN singers s ON g.genre_id = s.singer_id
GROUP BY g.title;
-- 2.Количество треков, вошедших в альбомы 2019–2020 годов
ALTER TABLE albums
RENAME title TO album_name;
UPDATE albums 
SET album_name = 2019
WHERE albums_id = 9;
UPDATE albums 
SET album_name = 2020
WHERE albums_id = 4;
SELECT album_name, count(title)  FROM albums a 
LEFT JOIN tracks t ON a.albums_id = t.tracks_id 
WHERE a.years >= 2019 AND a.years <= 2020
GROUP BY a.album_name;
-- 3.Средняя продолжительность трэков по каждому альбому
SELECT album_name, avg(duration) FROM albums a 
LEFT JOIN tracks t ON a.albums_id = t.tracks_id 
GROUP BY a.album_name;

-- 4.Все исполнители, которые не выпустили альбомы в 2020 году
SELECT alias FROM singers s 
LEFT JOIN albums a ON s.singer_id = a.albums_id 
WHERE a.years != 2020
GROUP BY alias;
-- 5.Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
ALTER TABLE collection 
RENAME title TO collection_name;

SELECT collection_name FROM collection c 
LEFT JOIN track_collection tc ON c.collection_id = tc.collection_id 
LEFT JOIN tracks t ON t.tracks_id = tc.track_id 
LEFT JOIN singer_album sa ON sa.singer_id = t.albums_id 
LEFT JOIN singers s ON s.singer_id = sa.singer_id 
WHERE s.alias = 'Sia';







