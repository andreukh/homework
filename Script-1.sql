--Create table
create table salary(
	id serial primary key,
	monthly_salary int not null
);

select * from salary;

create table roles(
	id serial primary key,
	role_title varchar(30) unique not null
);

select * from roles;

create table salary_roles (
	id serial primary key,
	id_role int unique not null,
	id_salary int not null,
	foreign key (id_role)
		references roles(id),
	foreign key (id_salary)
		references salary(id)
);

select *from salary_roles
order by(id);

insert into salary(monthly_salary)
values  (1200), 
		(1300),
		(1400),
		(1450),
		(1600),
		(1700),
		(1800),
		(1900),
		(1201),
		(5000);
	
	insert into roles(role_title)
values  ('qa_manual_junior'), 
		('qa_manual_middle'),
		('qa_manual_senior'),
		('qa_automation_junior'),
		('qa_automation_middle'),
		('qa_automation_senior'),
		('developer_Java_senior'),
		('developer_Java_junior'),
		('developer_Java_middle'),
		('developer_Python_senior'),		('developer_Python_junior'),		('developer_Python_middle'),
		('HR'),
		('Designer'),
		('Manager');

insert into salary_roles(id_role, id_salary)
values  (1, 1), 
		(2, 4),
		(3, 2),
		(4, 2),
		(5, 3),
		(6, 6),
		(7, 1),
		(8, 8),
		(9, 7),
		(10, 10);
	
--delete table		
--drop table salary_roles;
	
insert into salary_roles(id_role, id_salary)
values (12, 3);

--redact table
alter table salary_roles 
add column devices varchar(50);

alter table salary_roles 
drop column devices;
--удаление строки по ид
delete from salary_roles 
where id=5;

update salary_roles
set id=5 
where id = 7;

alter table roles 
add column parcing int;
--переименовать столбик
alter table roles 
rename column parcing to taxi int;

alter table roles 
alter column taxi type varchar(40) using taxi::varchar(30);

select * from roles;
