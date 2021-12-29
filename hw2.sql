--������� ������� employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null

create table employees(
id serial primary key,
employee_name varchar(50) not null);

--��������� ������� employee 70 ��������.

insert into employees(employee_name)
values ('������'),
		('�������'),
		('�������'),
		('�����'),
		('�����'),
		('�����'),
		('�������'),
		('�����'),
		('��������'),
		('�������'),
		('������'),
		('������'),
		('�����'),
		('������'),
		('�����'),
		('�����'),
		('�������'),
		('�����'),
		('������'),
		('������'),
		('����'),
		('�������'),
		('�������'),
		('������'),
		('�����'),
		('����'),
		('�����'),
		('�����'),
		('�������'),
		('�����'),
		('�������'),
		('����'),
		('������'),
		('��'),
		('�����'),
		('�������'),
		('���������'),
		('���������'),
		('��������'),
		('��������'),
		('������'),
		('������'),
		('������'),
		('����'),
		('�����'),
		('������'),
		('�������'),
		('�������'),
		('�����'),
		('��������'),
		('�����'),
		('�����'),
		('�����'),
		('������'),
		('��������'),
		('�����'),
		('�������'),
		('������'),
		('����������'),
		('��������'),
		('����������'),
		('������'),
		('�������'),
		('���'),
		('�����'),
		('���������'),
		('�������'),
		('������'),
		('����'),
		('��������');
--select * from employees ;

--������� ������� salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null


create table salary(
id serial primary key,
monthly_salary int not null);

--��������� ������� salary 15 ��������:
insert into salary(monthly_salary)
values (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400);
		
select * from salary;

--	������� ������� employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null

	
create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null);

--	��������� ������� employee_salary 40 ��������:
--- � 10 ����� �� 40 �������� �������������� employee_id


insert into employee_salary(employee_id, salary_id )
values (17, 10),
		(14, 2),
		(11, 3),
		(27 , 9),
		(28, 15),
		(9, 15),
		(18, 1),
		(2, 16),
		(7, 5),
		(20, 13),
		(3, 14),
		(10, 10),
		(24, 15),
		(12, 16),
		(5, 14),
		(16, 12),
		(4, 14),
		(25, 9),
		(19, 6),
		(6, 2),
		(13, 4),
		(30, 5),
		(29, 12),
		(26, 6),
		(15, 11),
		(22, 11),
		(1, 16),
		(8, 7),
		(23, 13),
		(21, 11),
		(81, 7),
		(97, 4),
		(99, 8),
		(90, 4),
		(100, 15),
		(78, 7),
		(72, 5),
		(83, 11),
		(71, 6),
		(93, 3);

select * from employee_salary ;

--������� ������� roles
--- id. Serial  primary key,
--- role_name. int, not null, unique


create table roles(
id serial primary key,
role_name int not null unique);

--�������� ��� ������ role_name � int �� varchar(30)

alter table roles alter column role_name type varchar(30);

--��������� ������� roles 20 ��������:
insert into roles(role_name)
values ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');
--		
--select * from roles;

--������� ������� roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (������� ���� ��� ������� employees, ���� id)
--- role_id. Int, not null (������� ���� ��� ������� roles, ���� id)

create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key(employee_id)
references employees(id),
foreign key(role_id)
references roles(id));

--��������� ������� roles_employee 40 ��������:

insert into roles_employee (employee_id, role_id)
values (55, 17),
		(48, 13),
		(35, 14),
		(49, 7),
		(57, 11),
		(3, 19),
		(44, 18),
		(12, 16),
		(42, 15),
		(34, 8),
		(9, 2),
		(36, 6),
		(8, 1),
		(22, 3),
		(14, 9),
		(66, 5),
		(13, 4),
		(50, 20),
		(11, 10),
		(43, 12),
		(2, 15),
		(62, 20),
		(38, 17),
		(30, 17),
		(20, 3),
		(68, 18),
		(6, 6),
		(7, 17),
		(45, 19),
		(56, 8),
		(53, 11),
		(51, 9),
		(1, 20),
		(41, 11),
		(4, 7),
		(31, 11),
		(54, 16),
		(58, 20),
		(40, 13),
		(61, 16);
select * from roles_employee ;