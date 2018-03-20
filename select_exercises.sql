use codeup_test_db;

-- select name as AlbumNames from albums
-- where artist = 'pink floyd';
--
-- select name, Release_date from albums
-- WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';
--
-- select genre from albums
-- WHERE name = 'nevermind';
--
-- select * from albums
-- where release_date BETWEEN 1990 and 1999;

select * from albums
where genre like '%rock%'
ORDER BY 4;