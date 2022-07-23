create database qa_test_students;

create table qa_students
(
id_students serial primary key ,
name varchar(60) not null,
group_number INT not null
);

create table qa_groups
(
group_id serial primary key,
date_start date not null,
date_finish date not null
);

create table homeworks
(
homework_id serial primary key,
score int not null
);

create table hw_progress
( 
hwprogress_id serial primary key,
student_name varchar(60) not null,
hw_number int not null,
status bool not null
);

insert into qa_students (name, group_number)
values
('Ivan Ivanov', 1),
('Petr Pertov', 1),
('Vasiliy Vasiliev', 1),
('Natalia Natalieva', 1),
('Iryna Irynova', 2),
('Olga Olgova', 2),
('Eugenia Eugenieva', 2),
('Vadym Vadymov', 2);

insert into qa_students (name, group_number)
values
('Tetiana Tetianova', 1),
('Anna Annova', 2),
('Galyna Galynova', 3),
('Olena Olenova', 3),
('Svitlana Svitlanova', 3),
('Ruslana Ruslanova', 3),
('Sofia Sofieva', 3),
('Eduard Eduardov', 4),
('Viktor Viktorov', 4);


insert into qa_groups (date_start, date_finish)
values
('2021-01-11', '2021-03-11'),
('2021-03-20', '2021-05-20');

insert into homeworks (score)
values
(50),
(70),
(55),
(90),
(50),
(20),
(40),
(80);

insert into hw_progress (student_name, hw_number, status)
values
('Ivan Ivanov', 1, '0'),
('Ivan Ivanov', 2, '0'),
('Ivan Ivanov', 3, '0'),
('Ivan Ivanov', 4, '0'),
('Ivan Ivanov', 5, '0'),
('Petr Pertov', 5, '1'),
('Petr Pertov', 6, '1'),
('Petr Pertov', 7, '1'),
('Petr Pertov', 4, '1'),
('Petr Pertov', 3, '1'),
('Vasiliy Vasiliev', 5, '1'),
('Vasiliy Vasiliev', 6, '0'),
('Vasiliy Vasiliev', 7, '1'),
('Vasiliy Vasiliev', 2, '0'),
('Vasiliy Vasiliev', 3,'1'),
('Natalia Natalieva', 3, '0'),
('Natalia Natalieva', 4, '0'),
('Natalia Natalieva', 5, '0'),
('Natalia Natalieva', 6, '0'),
('Natalia Natalieva', 7, '0'),
('Iryna Irynova', 1, '1'),
('Iryna Irynova', 2, '1'),
('Iryna Irynova', 3, '1'),
('Iryna Irynova', 4, '1'),
('Iryna Irynova', 5, '1'),
('Olga Olgova', 1, '0'),
('Olga Olgova', 2, '1'),
('Olga Olgova', 3, '0'),
('Olga Olgova', 4, '1'),
('Olga Olgova', 5, '0'),
('Eugenia Eugenieva', 5, '0'),
('Eugenia Eugenieva', 6, '0'),
('Eugenia Eugenieva', 7, '1'),
('Eugenia Eugenieva', 2, '1'),
('Eugenia Eugenieva',3, '1'),
('Vadym Vadymov', 5, '0'),
('Vadym Vadymov', 4, '0'),
('Vadym Vadymov', 3, '0'),
('Vadym Vadymov', 2, '1'),
('Vadym Vadymov', 7, '0'),
('Tetiana Tetianova', 1, '1'),
('Tetiana Tetianova', 2, '1'),
('Tetiana Tetianova', 3, '1'),
('Tetiana Tetianova', 4, '1'),
('Tetiana Tetianova', 5, '1'),
('Anna Annova', 1, '0'),
('Anna Annova', 2, '1'),
('Anna Annova', 5, '0'),
('Anna Annova', 6, '0'),
('Anna Annova', 7, '1'),
('Galyna Galynova', 3, '0'),
('Galyna Galynova', 2, '1'),
('Galyna Galynova', 1, '0'),
('Galyna Galynova', 5, '1'),
('Galyna Galynova', 6, '1'),
('Olena Olenova', 1, '1'),
('Olena Olenova', 2, '0'),
('Olena Olenova', 3, '1'),
('Olena Olenova', 4, '1'),
('Olena Olenova', 5, '0'),
('Svitlana Svitlanova', 5, '1'),
('Svitlana Svitlanova', 4, '0'),
('Svitlana Svitlanova', 3, '1'),
('Svitlana Svitlanova', 2, '1'),
('Svitlana Svitlanova', 1, '1'),
('Ruslana Ruslanova', 1, '0'),
('Ruslana Ruslanova', 2, '0'),
('Ruslana Ruslanova', 5, '0'),
('Ruslana Ruslanova', 6, '0'),
('Ruslana Ruslanova', 7, '1'),
('Sofia Sofieva', 1, '1'),
('Sofia Sofieva', 3, '1'),
('Sofia Sofieva', 5, '0'),
('Sofia Sofieva', 7, '1'),
('Sofia Sofieva', 2, '0'),
('Eduard Eduardov', 1, '0'),
('Eduard Eduardov', 7, '0'),
('Eduard Eduardov', 4, '0'),
('Eduard Eduardov', 5, '1'),
('Eduard Eduardov', 6, '1'),
('Viktor Viktorov', 2, '1'),
('Viktor Viktorov', 3, '1'),
('Viktor Viktorov', 5, '0'),
('Viktor Viktorov', 1, '1'),
('Viktor Viktorov', 6, '0');


ALTER TABLE homeworks
ADD COLUMN obligatory int;

UPDATE homeworks SET obligatory = 1 WHERE ( homework_id = '3'),
UPDATE homeworks SET obligatory = 1 WHERE ( homework_id = '7'),


- всех студентов со всеми заданиями (имя, группа, номер задания, статус, обязательное или нет)

select name, group_number, hw_number, status, obligatory from qa_students
join hw_progress
on qa_students.name = hw_progress.student_name
join homeworks
on hw_progress.hw_number = homeworks.homework_id;

студенты, которые сдали обязательные задания (имя, группа, номер задания)

select name, group_number, hw_number from qa_students
join hw_progress
on qa_students.name = hw_progress.student_name
join homeworks
on hw_progress.hw_number = homeworks.homework_id
where status is TRUE
and obligatory = 1; 

студенты, которые не сдали обязательные задания (имя, группа, номер задания)
select name, group_number, hw_number from qa_students
join hw_progress
on qa_students.name = hw_progress.student_name
join homeworks
on hw_progress.hw_number = homeworks.homework_id
where status is FALSE
and obligatory = 1; 

студенты, которые сдали необязательные задания (имя, группа, номер задания)

select name, group_number, hw_number from qa_students
join hw_progress
on qa_students.name = hw_progress.student_name
join homeworks
on hw_progress.hw_number = homeworks.homework_id
where status is TRUE
and obligatory is NULL; 

студенты, которые не сдали необязательные задания (имя, группа, номер задания)

select name, group_number, hw_number from qa_students
join hw_progress
on qa_students.name = hw_progress.student_name
join homeworks
on hw_progress.hw_number = homeworks.homework_id
where status is FALSE
and obligatory is NULL; 


