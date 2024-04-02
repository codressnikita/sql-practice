# Task list

## Task 1 : Create a DB named record_company and use it for the rest of the exercise

## Task 2: Crete a bands table

### This table should be called songs and have 2 properties with these exact names.

- id: An integer that is the primary key, and auto increments.
- name: A string that cannot be null.

## Task 3: Crete an albums table

### This table should be called albums and have 4 properties with these exact names.

- id: An integer that is the primary key, and auto increments.
- name: A string that cannot be null.
- release_year: An integer that can be null.
- band_id: An integer that is a foreign key referencing the bands table that cannot be null.

## Task 4: Crete an albums table

### This table should be called songs and have four properties with these exact names.

- id: An integer that is the primary key, and auto increments.
- name: A string that cannot be null.
- length: A float that represents the length of the song in minutes that cannot be null.
- album_id: An integer that is a foreign key referencing the albums table that cannot be null.

## Task 5: Populate Data

### copy the code from <Link: https://pastebin.com/UvuRvQgR> into MySQL Workbench, and run it to populate all of the data for the rest of the exercises

NOTE: Not keeping the code here as it clutters the workspace.

## Task 6: Select only the Names of all the Bands

    Change the name of the column the data returns to Band Name

## Task 7: Select the Oldest Album

    Make sure to only return one result from this query,
    and that you are not returning any albums that do not have a release year.

## Task 8: Get all Bands that have Albums

    There are multiple different ways to solve this problem, but they will all involve a join.
    Return the band name as Band Name.

## Task 9: Get all Bands that have No Albums

    Return the band name as Band Name.

## Task 10: Get the Longest Album

    Return the album name as Name, the album release year as Release Year, and the album length as Duration.
    HINT: look up the SUM aggregate function.

## Task 11: Update the Release Year of the Album with no Release Year

    Set the release year to 1986.

## Task 12: Insert a record for your favorite Band and one of their Albums

## Task 13: Delete the Band and Album you added in #11

    The order of how you delete the records is important since album has a foreign key to band.

## Task 14: Get the Average Length of all Songs

    Return the average length as Average Song Duration.

## Task 15: Select the longest Song of each Album

    Return the album name as Album, the album release year as Release Year, and the longest song length as Duration.

## Task 16: Get the number of Songs for each Band

    Return the band name as Band, the number of songs as Number of Songs.
    HINT: It will require you to chain together two joins instead of just one.
