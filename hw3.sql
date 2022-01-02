--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select * 
from employees
join
employee_salary 
on employee_id = employees.id
join 
salary
on salary_id = salary.id;

	

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select * from employees 
join employee_salary 
	on employee_id = employees.id 
join salary 
	on salary_id = salary.id and monthly_salary <= 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select * from employee_salary
	where not exists (select * 
	from employees 
	where employees.id = employee_id);
	

select * from employee_salary ;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select * from employee_salary
join salary on salary_id = salary.id and monthly_salary > 2000
	where not exists (select *
	from employees 
	where employees.id = employee_id);

-- 5. Найти всех работников кому не начислена ЗП.
select * from employees
	where not exists (select * 
from employee_salary
where employee_id = employees.id) ;

-- 6. Вывести всех работников с названиями их должности.
select * from employees e 
join roles_employee re on re.employee_id = e.id 
join roles r on re.role_id = r.id ;

-- 7. Вывести имена и должность только Java разработчиков.
--select * from employees e 
--join roles_employee re on re.employee_id = e.id 
--join roles r on re.employee_id = r.id and role_name like '%Java%'
--where r.role_name not like '%Script%';
--!!! поменял empolyees и salary местами, вывел всех разработчиков, доэтого только 3
select * from roles r  
join roles_employee re on re.role_id = r.id
join employees e on re.employee_id = e.id and r.role_name like '%Java%';
where r.role_name not like '%Script%';

-- 8. Вывести имена и должность только Python разработчиков.select * from employees e 

select * from roles r 
join roles_employee re on re.employee_id = e.id
join roles r on re.employee_id = r.id and r.role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select * from roles r  
join roles_employee re on re.role_id = r.id
join employees e on re.employee_id = e.id and r.role_name like '%QA%';
-- 10. Вывести имена и должность ручных QA инженеров.
select * from roles r
join roles_employee re on re.role_id = r.id 
join employees e on re.employee_id = e.id and role_name like '%Manual QA%';

-- 11. Вывести имена и должность автоматизаторов QA
select * from roles r
join roles_employee re on re.role_id =r.id 
join employees e on e.id = re.employee_id 
where role_name like '%Automation QA%';


-- 12. Вывести имена и зарплаты Junior специалистов

select e.employee_name, s.monthly_salary 
	from employees e left join roles_employee re on e.id = re.employee_id
		left join roles r on re.role_id = r.id
		left join employee_salary es on es.employee_id = re.employee_id
		left join salary s on s.id = es.salary_id 
			where role_name like '%Junior%' and s.monthly_salary is not null
		 ;

-- 13. Вывести имена и зарплаты Middle специалистов
select e.employee_name, s.monthly_salary
	from employees e left join roles_employee re on e.id =re.employee_id 
		left join roles r on re.role_id = r.id 
		left join employee_salary es on es.employee_id = re.employee_id 
		left join salary s on s.id =es.salary_id 
			where role_name like '%Middle%' and s.monthly_salary is not null ;
		
-- 14. Вывести имена и зарплаты Senior специалистов
select e.employee_name, s.monthly_salary
	from employees e left join roles_employee re on e.id =re.employee_id 
		left join roles r on re.role_id = r.id 
		left join employee_salary es on es.employee_id = re.employee_id 
		left join salary s on s.id = es.salary_id 
			where role_name like '%Senior%' and s.monthly_salary is not null;
		
-- 15. Вывести зарплаты Java разработчиков
		
select s.monthly_salary 
	from salary s join employee_salary es on s.id  = es.salary_id 
	join roles_employee re on es.employee_id = re.employee_id 
	join roles r on re.role_id = r.id 
		where r.role_name like '%Java developer%';
	
-- 16. Вывести зарплаты Python разработчиков
select s.monthly_salary
	from salary s join employee_salary es on s.id = es.salary_id 
	join roles_employee re on es.employee_id = re.employee_id 
	join roles r on re.role_id = r.id 
		where r.role_name like '%Python developer%';
-- 17. Вывести имена и зарплаты Junior Python разработчиков
select s.monthly_salary
	from salary s join employee_salary es on s.id = es.salary_id 
	join roles_employee re on es.employee_id = re.employee_id 
	join roles r on re.role_id = r.id 	
		where r.role_name like '%Junior Python developer%';
-- 18. Вывести имена и зарплаты Middle JS разработчиков
select s.monthly_salary
	from salary s join employee_salary es on s.id = es.salary_id 
	join roles_employee re on es.employee_id = re.employee_id 
	join roles r on re.role_id = r.id 	
		where r.role_name like '%Middle JavaScript developer%';	
--не получает зарплату, тк. нет в таблице emloyee_salary
--insert into employee_salary(employee_id, salary_id )
--values (56, 3);	

	-- 19. Вывести имена и зарплаты Senior Java разработчиков
select s.monthly_salary
	from salary s join employee_salary es on s.id = es.salary_id 
	join roles_employee re on es.employee_id = re.employee_id 
	join roles r on re.role_id = r.id 	
		where r.role_name like '%Senior Java developer%';
-- 20. Вывести зарплаты Junior QA инженеров
select s.monthly_salary, re.employee_id 
	from salary s join employee_salary es on s.id = es.salary_id 
	join roles_employee re on es.employee_id = re.employee_id 
	join roles r on re.role_id = r.id 	
		where r.role_name like '%Junior Manual QA engineer' and r.role_name like '%Junior Automation QA engineer%';
insert into employee_salary(employee_id, salary_id )
values (18, 7);	
-- 21. Вывести среднюю зарплату всех Junior специалистов
-- 22. Вывести сумму зарплат JS разработчиков
-- 23. Вывести минимальную ЗП QA инженеров
-- 24. Вывести максимальную ЗП QA инженеров
-- 25. Вывести количество QA инженеров
-- 26. Вывести количество Middle специалистов.
-- 27. Вывести количество разработчиков
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000