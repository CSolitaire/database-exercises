show databases;
USE albums_db;
select database();
show tables;
describe albums;

# Question 4a
select name
from albums
Where artist = 'Pink Floyd';

select * from albums;

#Question 4b
select release_date
from albums
Where name like 'Sgt%';

select * from albums;

#Question 4c
select genre
from albums
Where name = 'Nevermind';

select * from albums;

#Question 4d
select name
from albums
where release_date Between 1990 and 1999
order by name;

select * from albums;

#Question 4e
select name
from albums
where sales < 20.0
Order by name;

select * from albums;

#Question 4f
select genre, name 'Album_Name'
from albums
where genre = 'Rock';
#Does not include 'hard rock' or 'progressive rock' because the search is specific to string literal 'rock'. To include other 'rock' like genre must use like operator

select genre 'Music_Genre', name 'Album_Name'
from albums
where genre like '%Rock%';
