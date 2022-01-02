--1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select * 
from employees
join
employee_salary 
on employee_id = employees.id
join 
salary
on salary_id = salary.id;

	

-- 2. ������� ���� ���������� � ������� �� ������ 2000.

select * from employees 
join employee_salary 
	on employee_id = employees.id 
join salary 
	on salary_id = salary.id and monthly_salary <= 2000;

-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select * from employee_salary
	where not exists (select * 
	from employees 
	where employees.id = employee_id);
	

select * from employee_salary ;

-- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select * from employee_salary
join salary on salary_id = salary.id and monthly_salary > 2000
	where not exists (select *
	from employees 
	where employees.id = employee_id);

-- 5. ����� ���� ���������� ���� �� ��������� ��.
select * from employees
	where not exists (select * 
from employee_salary
where employee_id = employees.id) ;

-- 6. ������� ���� ���������� � ���������� �� ���������.
select * from employees e 
join roles_employee re on re.employee_id = e.id 
join roles r on re.role_id = r.id ;

-- 7. ������� ����� � ��������� ������ Java �������������.
--select * from employees e 
--join roles_employee re on re.employee_id = e.id 
--join roles r on re.employee_id = r.id and role_name like '%Java%'
--where r.role_name not like '%Script%';
--!!! ������� empolyees � salary �������, ����� ���� �������������, ������� ������ 3
select * from roles r  
join roles_employee re on re.role_id = r.id
join employees e on re.employee_id = e.id and r.role_name like '%Java%';
where r.role_name not like '%Script%';

-- 8. ������� ����� � ��������� ������ Python �������������.select * from employees e 

select * from roles r 
join roles_employee re on re.employee_id = e.id
join roles r on re.employee_id = r.id and r.role_name like '%Python%';

-- 9. ������� ����� � ��������� ���� QA ���������.
select * from roles r  
join roles_employee re on re.role_id = r.id
join employees e on re.employee_id = e.id and r.role_name like '%QA%';
-- 10. ������� ����� � ��������� ������ QA ���������.
select * from roles r
join roles_employee re on re.role_id = r.id 
join employees e on re.employee_id = e.id and role_name like '%Manual QA%';

-- 11. ������� ����� � ��������� ��������������� QA
select * from roles r
join roles_employee re on re.role_id =r.id 
join employees e on e.id = re.employee_id 
where role_name like '%Automation QA%';


-- 12. ������� ����� � �������� Junior ������������

select e.employee_name, s.monthly_salary 
	from employees e left join roles_employee re on e.id = re.employee_id
		left join roles r on re.role_id = r.id
		left join employee_salary es on es.employee_id = re.employee_id
		left join salary s on s.id = es.salary_id 
			where role_name like '%Junior%' and s.monthly_salary is not null
		 ;

-- 13. ������� ����� � �������� Middle ������������
select e.employee_name, s.monthly_salary
	from employees e left join roles_employee re on e.id =re.employee_id 
		left join roles r on re.role_id = r.id 
		left join employee_salary es on es.employee_id = re.employee_id 
		left join salary s on s.id =es.salary_id 
			where role_name like '%Middle%' and s.monthly_salary is not null ;
		
-- 14. ������� ����� � �������� Senior ������������
select e.employee_name, s.monthly_salary
	from employees e left join roles_employee re on e.id =re.employee_id 
		left join roles r on re.role_id = r.id 
		left join employee_salary es on es.employee_id = re.employee_id 
		left join salary s on s.id = es.salary_id 
			where role_name like '%Senior%' and s.monthly_salary is not null;
		
-- 15. ������� �������� Java �������������
		
select s.monthly_salary 
	from salary s join employee_salary es on s.id  = es.salary_id 
	join roles_employee re on es.employee_id = re.employee_id 
	join roles r on re.role_id = r.id 
		where r.role_name like '%Java developer%';
	
-- 16. ������� �������� Python �������������
select s.monthly_salary
	from salary s join employee_salary es on s.id = es.salary_id 
	join roles_employee re on es.employee_id = re.employee_id 
	join roles r on re.role_id = r.id 
		where r.role_name like '%Python developer%';
-- 17. ������� ����� � �������� Junior Python �������������
select s.monthly_salary
	from salary s join employee_salary es on s.id = es.salary_id 
	join roles_employee re on es.employee_id = re.employee_id 
	join roles r on re.role_id = r.id 	
		where r.role_name like '%Junior Python developer%';
-- 18. ������� ����� � �������� Middle JS �������������
select s.monthly_salary
	from salary s join employee_salary es on s.id = es.salary_id 
	join roles_employee re on es.employee_id = re.employee_id 
	join roles r on re.role_id = r.id 	
		where r.role_name like '%Middle JavaScript developer%';	
--�� �������� ��������, ��. ��� � ������� emloyee_salary
--insert into employee_salary(employee_id, salary_id )
--values (56, 3);	

	-- 19. ������� ����� � �������� Senior Java �������������
select s.monthly_salary
	from salary s join employee_salary es on s.id = es.salary_id 
	join roles_employee re on es.employee_id = re.employee_id 
	join roles r on re.role_id = r.id 	
		where r.role_name like '%Senior Java developer%';
-- 20. ������� �������� Junior QA ���������
select s.monthly_salary, re.employee_id 
	from salary s join employee_salary es on s.id = es.salary_id 
	join roles_employee re on es.employee_id = re.employee_id 
	join roles r on re.role_id = r.id 	
		where r.role_name like '%Junior Manual QA engineer' and r.role_name like '%Junior Automation QA engineer%';
insert into employee_salary(employee_id, salary_id )
values (18, 7);	
-- 21. ������� ������� �������� ���� Junior ������������
-- 22. ������� ����� ������� JS �������������
-- 23. ������� ����������� �� QA ���������
-- 24. ������� ������������ �� QA ���������
-- 25. ������� ���������� QA ���������
-- 26. ������� ���������� Middle ������������.
-- 27. ������� ���������� �������������
-- 28. ������� ���� (�����) �������� �������������.
-- 29. ������� �����, ��������� � �� ���� ������������ �� �����������
-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
-- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
-- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000