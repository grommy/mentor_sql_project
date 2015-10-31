---Должна быть возможность выбрать Имя и Фамилию студента, все экзамены которые он сдавал
--- и все отметки которые он получил по этим экзаменам

select students.NAME, students.SURNAME, exam_marks.MARK, subjects.NAME
from students
join exam_marks
on students.ID=exam_marks.STUDENT_ID
join subjects
on exam_marks.SUBJ_ID=subjects.ID
order by students.NAME;

select count(*)
from students
join exam_marks
on students.ID=exam_marks.STUDENT_ID
join subjects
on exam_marks.SUBJ_ID=subjects.ID
order by students.NAME;

-- проверка:
begin transaction;

select *
from students;

select *
from exam_marks;

insert into students
values (46,'Алеша','Панасюк','m', 900.00,1,'Харьков',NULL,8);

insert into exam_marks
values(46,5,5,getdate());

delete from students
where ID=46;

delete from exam_marks
where ID=123;

rollback;

--Должна быть возможность выбрать Имя и Фамилию преподователя и предметы которые он ведет

select lecturers.NAME, lecturers.SURNAME, subjects.NAME
from lecturers
join subj_lect
on subj_lect.LECTURER_ID=lecturers.ID
join subjects
on subj_lect.SUBJ_ID=subjects.ID;

--проверка
begin transaction;

select *
from lecturers;

select *
from subj_lect;

select *
from subjects;

insert into lecturers
values (26,'Кухарь','ВЛ','Харьков', 2);

insert into subj_lect
values(26,6);

delete from subj_lect
where LECTURER_ID=26;

delete from lecturers
where ID=26;

rollback;

---Должна быть возможность выбрать имя и фамилию студента, город его прописки,
--- город и название универститета в котором он обучается

select students.NAME, students.SURNAME, students.CITY as Native, universities.CITY as University, universities.NAME
from students
left join universities
on students.UNIV_ID=universities.ID;

--проверка
begin transaction;

select *
from universities;

select *
from students;

insert into students
values (46,'Алеша','Панасюк','m', 900.00,1,'Харьков',NULL,8);

delete from students
where ID=46;

rollback;

---Должна быть возможность выбрать имя и фамилию студента, его пол,
--- дату его рождения и курс на котором он учится

select students.NAME, students.SURNAME, students.GENDER, students.BIRTHDAY, students.COURSE
from students;

---проверка
begin transaction;

select *
from students;

insert into students
values (46,'Алеша','Панасюк','m', 900.00,1,'Харьков',NULL,8);

delete from students
where ID=46;

rollback;

---Должна быть возможность выбрать имя и фамилию преподователя, город где он проживает,
--- университет и город в котором он преподает

select lecturers.NAME, lecturers.SURNAME, lecturers.CITY, universities.CITY, universities.NAME
from lecturers
join universities
on lecturers.UNIV_ID=universities.ID;

--проверка
begin transaction;

select *
from lecturers;

select *
from universities;


insert into lecturers
values (26,'Кухарь','ВЛ','Харьков', 2);

delete from lecturers
where ID=26;

rollback;

---Должна быть возможность выбрать имя и фамилию студента, все предметы которые он изучает,
--- количество часов данного предмета и семестр в котором изучается этот предмет

select students.NAME, students.SURNAME, subjects.NAME, subjects.HOURS, subjects.SEMESTER
from students
join exam_marks
on students.ID=exam_marks.STUDENT_ID
join subjects
on exam_marks.SUBJ_ID=subjects.ID;

---проверка
begin transaction;

select *
from students;

select *
from exam_marks;

select *
from subjects;

insert into students
values (46,'Алеша','Панасюк','m', 900.00,1,'Харьков',NULL,8);

insert into exam_marks
values(46,5,5,getdate());

delete from students
where ID=46;

delete from exam_marks
where ID=123;

rollback;