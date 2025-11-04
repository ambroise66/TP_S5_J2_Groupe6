--1.Récuperer tous les albums
SELECT * FROM Category;

--Récupérer tous les albums dont le titre contient "Great" (indice)
SELECT Title FROM albums WHERE Title LIKE '%Great%';;

--Donner le nombre total d'albums contenus dans la base (sans regarder les id bien sûr)
SELECT COUNT(AlbumId) AS TotalAlbums FROM albums;

--Supprimer tous les albums dont le nom contient "music"
DELETE FROM albums WHERE Title LIKE '%music%';

--Récupérer tous les albums écrits par AC/DC
SELECT T1.Title FROM albums T1 INNER JOIN artists T2 ON T1.ArtistId = T2.ArtistId WHERE T2.Name = 'AC/DC';

--Récupérer la liste des titres de l'album "Let There Be Rock"
SELECT T1.Name FROM tracks T1 INNER JOIN albums T2 ON T1.AlbumId = T2.AlbumId WHERE T2.Title = 'Let There Be Rock';

--Afficher le prix de cet album ainsi que sa durée totale
SELECT T2.Title, SUM(T1.UnitPrice) AS PrixTotal, SUM(T1.Milliseconds) AS DureeTotale_ms FROM tracks T1 INNER JOIN albums T2 ON T1.AlbumId = T2.AlbumId WHERE T2.Title = 'Let There Be Rock' GROUP BY T2.Title;

--Afficher le coût de l'intégralité de la discographie de "Deep Purple"
SELECT SUM(T1.UnitPrice) FROM tracks T1 INNER JOIN albums T2 ON T1.AlbumId = T2.AlbumId INNER JOIN artists T3 ON T2.ArtistId = T3.ArtistId WHERE T3.Name = 'Deep Purple';

--Créer l'album de ton artiste favori en base, en renseignant correctement les trois tables albums, artists et tracks 
--(Ceci nécessite trois requêtes distinctes, séparées par un point-virgule, pour s'assurer que l'artiste existe avant l'album, et que l'album existe avant le titre.)
INSERT INTO artists (ArtistId, Name) VALUES (900, 'The Beatles'); INSERT INTO albums (AlbumId, Title, ArtistId) VALUES (900, 'Abbey Road', 900); INSERT INTO tracks (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes, UnitPrice) VALUES (9001, 'Come Together', 900, 1, 1, 260000, 8000000, 0.99);
