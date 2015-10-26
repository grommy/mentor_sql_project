-- version 2.00

create schema qalight;

use qalight;

create table subjects(
    id int not null,
    name nchar(32),
    hours int,
    semester smallint,
 constraint pk_subjects primary key (id)
);

create table universities(
    id int not null,
    name nvarchar(150),
    rating int,
    city nvarchar(32),
 constraint pk_universities primary key (id)
);

create table exam_marks(
    id int not null auto_increment,
    student_id int,
    subj_id int,
    mark decimal(5,3),
    exam_date datetime,
 constraint pk_exam_marks primary key (id)
);

create table subj_lect(
    lecturer_id int not null,
    subj_id int not null,
 constraint pk_subj_lect primary key (lecturer_id, subj_id)
);

create table lecturers(
    id int not null,
    surname nvarchar(50),
    name nvarchar(30),
    city nvarchar(50),
    univ_id int,
 constraint pk_lecturers primary key (id)
);

create table students(
    id int not null,
    surname nvarchar(50) not null,
    name nvarchar(30),
    gender nchar(1),
    stipend decimal(18, 2),
    course smallint,
    city nvarchar(50),
    birthday datetime,
    univ_id int,
 constraint pk_students primary key (id)
);

create table students_archive(
    id int,
    surname nvarchar(50),
    name nvarchar(30),
    gender nchar(1),
    stipend decimal(18, 2),
    course smallint,
    city nvarchar(50),
    birthday datetime,
    univ_id int
);

alter table exam_marks add constraint fk_exam_marks_student foreign key(student_id) references students (id);

alter table exam_marks add constraint fk_exam_marks_subject foreign key(subj_id) references subjects (id);

alter table subj_lect add constraint fk_subj_lect_lecturer foreign key(lecturer_id) references lecturers (id);

alter table subj_lect add constraint fk_subj_lect_subject foreign key(subj_id) references subjects (id);

alter table lecturers add constraint fk_lecturers_univ foreign key(univ_id) references universities (id);

alter table students add constraint fk_students_univ foreign key(univ_id) references universities (id);
