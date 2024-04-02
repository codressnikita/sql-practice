/*

Task 1 : Create a DB named record_company and use it for the rest of the exercise

*/
CREATE DATABASE record_company;
USE record_company;

/*

Task 2: Crete a bands table

This table should be called songs and have 2 properties with these exact names.
	id: An integer that is the primary key, and auto increments.
	name: A string that cannot be null.

*/

CREATE TABLE bands (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

/*

Task 3: Crete an albums table

This table should be called albums and have 4 properties with these exact names.
	id: An integer that is the primary key, and auto increments.
	name: A string that cannot be null.
    release_year: An integer that can be null.
    band_id: An integer that is a foreign key referencing the bands table that cannot be null.

*/

CREATE TABLE albums (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  release_year INT,
  band_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (band_id) REFERENCES bands(id)
);

/*

Task 4: Crete an albums table

This table should be called songs and have four properties with these exact names.

	id: An integer that is the primary key, and auto increments.
	name: A string that cannot be null.
	length: A float that represents the length of the song in minutes that cannot be null.
	album_id: An integer that is a foreign key referencing the albums table that cannot be null.

*/

CREATE TABLE songs (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    length FLOAT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (album_id) REFERENCES albums(id)
);

/*

Task 5: Populate Data

    copy the code from <Link: https://pastebin.com/UvuRvQgR> into MySQL Workbench,
    and run it to populate all of the data for the rest of the exercises

    NOTE: Not keeping the code here as it clutters the workspace.

*/

/*

Task 6: Select only the Names of all the Bands

    Change the name of the column the data returns to Band Name

*/

SELECT name as 'BAND NAME' FROM bands;

/*

Task 7: Select the Oldest Album

    Make sure to only return one result from this query,
    and that you are not returning any albums that do not have a release year.

*/

SELECT * FROM albums
WHERE release_year IS NOT NULL
ORDER BY release_year
LIMIT 1;

/*

Task 8: Get all Bands that have Albums

    There are multiple different ways to solve this problem, but they will all involve a join.
	Return the band name as Band Name.

*/

SELECT DISTINCT bands.name as 'Band Name'
FROM bands
JOIN albums ON bands.id = albums.band_id;


/*

Task 9: Get all Bands that have No Albums

    Return the band name as Band Name.

*/

SELECT bands.name as 'Band Name'
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
WHERE albums.id IS null;

/*

Task 10: Get the Longest Album

    Return the album name as Name, the album release year as Release Year, and the album length as Duration.
    HINT: look up the SUM aggregate function.

*/

SELECT a.name as 'Name', a.release_year as 'Release Year', SUM(s.length) as 'Duration'
from songs as s
JOIN albums as a where s.album_id = a.id
GROUP BY a.id
ORDER BY Duration Desc
LIMIT 1;

/*

Task 11: Update the Release Year of the Album with no Release Year

    Set the release year to 1986.

*/

SET SQL_SAFE_UPDATES = 0;

SELECT * from albums
WHERE release_year IS null;


UPDATE albums
SET release_year = 1986
WHERE release_year IS null;

SELECT * from albums
WHERE release_year IS null;


/*

Task 12: Insert a record for your favorite Band and one of their Albums


*/

INSERT INTO bands (name)
VALUES ('Purcupine Tree');

SELECT * from bands;

INSERT INTO albums (name, release_year, band_id)
VALUES ('Fear of a Blank Planet', 2007, 8);

SELECT * from albums;

/*

Task 13: Delete the Band and Album you added in #11

    The order of how you delete the records is important since album has a foreign key to band.

*/

DELETE FROM albums WHERE id = 19;
SELECT * from albums;

DELETE FROM bands WHERE id = 8; 
SELECT * from bands;



/*

Task 14: Get the Average Length of all Songs

    Return the average length as Average Song Duration.

*/

SELECT AVG(songs.length) as 'Average Song Duration' from songs;

/*

Task 15: Select the longest Song of each Album

    Return the album name as Album, the album release year as Release Year, and the longest song length as Duration.

*/

SELECT 
	a.name as 'Album',
    a.release_year as 'Release Year',
    MAX(s.length) as 'Duration'
from albums as a
JOIN songs as s ON s.album_id = a.id
GROUP BY a.id;

/*

Task 16: Get the number of Songs for each Band

	Return the band name as Band, the number of songs as Number of Songs.
    HINT: It will require you to chain together two joins instead of just one.

*/

SELECT b.name AS 'Band', COUNT(s.name) AS 'Number of Songs'
FROM bands AS b
JOIN albums AS a ON b.id = a.band_id
JOIN songs AS s ON a.id = s.album_id
GROUP BY b.id;


