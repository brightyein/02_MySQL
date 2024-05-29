show databases;

create user 'songpa'@'%' identified by 'songpa';

use mysql;

show tables;

select * from user;

create database menudb;

grant all PRIVILEGES on menudb.* to 'songpa'@'%';

show grants for 'songpa'@'%';

use menudb;

show DATABASES;

-----------------------------------------------------

create database KKLP;

grant all PRIVILEGES on KKLP.* to 'songpa'@'%';

use KKLP;

------------------------------------------------------

create database employee;

grant all privileges on employee.* to songpa@'%';

show grants for songpa@'%';