create database phasetwo
use  phasetwo

-- creating student database
create table student (ID bigint(10) primary key  ,Name varchar(100),marks int(100))

insert into student values(1,'Max',12)
insert into student values(2,'Maxi',12)
select* from student order by marks desc

-- this table is for storing username and password of both admin and user wiht a role column which indicates user of admin.
create table studentid(Sname varchar(50) , pwd varchar(80),role varchar(10))

insert into studentid values('Max','max123','user')
insert into studentid values('admin','admin01','admin')
select * from studentid

-- this table is for the quiz questions
create table Questions (question varchar(100), choice1 varchar(20) , choice2 varchar(20) , correcta varchar(50))
select * from Questions

-- this table is for quiz number 
create table Quiz(qid int primary key , qno int) 
select * from Quiz