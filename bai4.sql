use `SQL`;
create table subjects(
                         subjectsID int(4) primary key auto_increment,
                         subjectsName varchar(50)
);
create table classes(
                        classID int(4) primary key auto_increment,
                        className varchar(50)
);
create table students(
                         studentID int(4) auto_increment primary key ,
                         studentsName varchar(50),
                         studentsAge int(4),
                         studentsEmail varchar(100),
                         constraint age  check ( studentsAge between 15 and 30)
);
create table classStudents(
                              studentsID int not null ,
                              foreign key (studentsID) references students (studentID),
                              classID int not null ,
                              foreign key (classID) references  classes(classID)
);
create table marks(
                      mark int,
                      studentsID int not null ,
                      foreign key (studentsID) references students (studentID),
                      subjectsID int not null ,
                      foreign key (subjectsID) references subjects (subjectsID)
);
insert into students (studentsName,studentsAge,studentsEmail) value
    ('Nguyen Quang An',18,'an@yahoo.com'),
    ('Nguyen Cong Vinh',20,'vinh@gmail.com'),
    ('Nguyen Van Quyen',19,'quyen@gmail.com'),
    ('Pham Thanh Binh',25,'binh@com'),
    ('Nguyen Van Tai Em',30,'taiem@sport.vn');
insert into classes (className) VALUE
    ('C0706L'),
    ('C0708G');
insert into classStudents (studentsID, classID) VALUE
    (1,1),
(2,2),
(3,2),
(4,1),
(5,2);
insert into subjects (subjectsName) value ('SQL'),('Java'),('C'),('Visual Basic');
insert into marks (mark, studentsID, subjectsID) VALUE
    (8,1,1),
    (4,2,1),
    (9,1,1),
    (7,1,3),
    (3,1,4),
    (5,2,4),
    (8,3,2),
    (1,3,4),
    (3,2,3);


select studentsID from classStudents where classID=1;
select studentID,studentsName,studentsEmail,studentsAge from students;
select subjectsName from subjects;
select avg(mark) from marks;
select mark from marks order by mark DESC;
alter table subjects
    modify column subjectsName nvarchar(255);
select 'day la mon hoc' ,subjectsName from subjects;
# constraint age  check ( studentsAge between 15 and 30)
alter table classStudents drop constraint classstudents_ibfk_1;