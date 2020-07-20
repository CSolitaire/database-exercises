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
where release_date Between 1990 and 1999;

select * from albums;

#Question 4e
