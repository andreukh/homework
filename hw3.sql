--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select e.employee_name,  s.monthly_salary from employees e
join employee_salary on employee_id = e.id
join salary s on salary_id = s.id;

	

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select e.employee_name, s.monthly_salary from employees e
join employee_salary on employee_id = e.id 
join salary s on salary_id = s.id and monthly_salary <= 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
insert into salary 
values 	(17, 123456),
		(18, 523641);

select s.id, s.monthly_salary from salary s
	where s.id not in (select distinct salary_id from employee_salary es) ;
 

select s.id, s.monthly_salary from salary s
	left join employee_salary es on es.salary_id = s.id 
	where es.employee_id is null; 


-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.id, s.monthly_salary from salary s
left join employee_salary es on salary_id = s.id 
	where es.employee_id is null and s.monthly_salary < 2000;
--	where not exists (select *
--	from employees 
--	where employees.id = employee_id);

-- 5. Найти всех работников кому не начислена ЗП.
select e.employee_name from employees e
	left join employee_salary es on e.id = es.employee_id 
	where es.salary_id is null;
			
-- 6. Вывести всех работников с названиями их должности.
select e.employee_name, r.role_name from employees e 
join roles_employee re on re.employee_id = e.id 
join roles r on re.role_id = r.id 
	where r.role_name is not null;

-- 7. Вывести имена и должность только Java разработчиков.

select e.employee_name, r.role_name from roles r  
join roles_employee re on re.role_id = r.id
join employees e on re.employee_id = e.id  
where r.role_name like '%Java%' and r.role_name not like '%Script%';

-- 8. Вывести имена и должность только Python разработчиков.

select e.employee_name, r.role_name from roles r
join roles_employee re on re.employee_id = r.id
join employees e on re.employee_id = e.id 
Where r.role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select e.employee_name, r.role_name from roles r  
join roles_employee re on re.role_id = r.id
join employees e on re.employee_id = e.id and r.role_name like '%QA%';
-- 10. Вывести имена и должность ручных QA инженеров.
select e.employee_name, r.role_name from roles r
join roles_employee re on re.role_id = r.id 
join employees e on re.employee_id = e.id and role_name like '%Manual QA%';

-- 11. Вывести имена и должность автоматизаторов QA
select e.employee_name, r.role_name from roles r
join roles_employee re on re.role_id =r.id 
join employees e on e.id = re.employee_id 
where role_name like '%Automation QA%';


-- 12. Вывести имена и зарплаты Junior специалистов

select e.employee_name, s.monthly_salary 
	from employees e left join roles_employee re on e.id = re.employee_id
		left join roles r on re.role_id = r.id
		left join employee_salary es on es.employee_id = re.employee_id
		left join salary s on s.id = es.salary_id 
			where role_name like '%Junior%' 	 ;
--		and s.monthly_salary is not null

-- 13. Вывести имена и зарплаты Middle специалистов
select e.employee_name, s.monthly_salary
	from employees e left join roles_employee re on e.id =re.employee_id 
		left join roles r on re.role_id = r.id 
		left join employee_salary es on es.employee_id = re.employee_id 
		left join salary s on s.id =es.salary_id 
			where role_name like '%Middle%'  ;
--		and s.monthly_salary is not null
		
-- 14. Вывести имена и зарплаты Senior специалистов
select e.employee_name, s.monthly_salary
	from employees e left join roles_employee re on e.id =re.employee_id 
		left join roles r on re.role_id = r.id 
		left join employee_salary es on es.employee_id = re.employee_id 
		left join salary s on s.id = es.salary_id 
			where role_name like '%Senior%';
--		 and s.monthly_salary is not null
		
-- 15. Вывести зарплаты Java разработчиков
		
select  e.employee_name, r.role_name, s.monthly_salary
	from employees e left join roles_employee re on e.id = re.employee_id 
	left join roles r on re.role_id = r.id 
	left join employee_salary es on re.employee_id = es.employee_id 
	left join salary s on es.salary_id = s.id 
		where r.role_name like '%Java developer%';
-- если только зарплаты то select s.monthly_salary from...
-- 16. Вывести зарплаты Python разработчиков
select s.monthly_salary, e.employee_name, r.role_name 
	from employees e left join roles_employee re on e.id = re.employee_id 
	left join roles r on re.role_id = r.id 
	left join employee_salary es on re.employee_id = es.employee_id 
	left join salary s on es.salary_id = s.id 
		where r.role_name like '%Python developer%';
--если только зарплаты, то select s.monthly_salary from...
-- 17. Вывести имена и зарплаты Junior Python разработчиков
select  e.employee_name, s.monthly_salary, r.role_name 
	from employees e left join roles_employee re on e.id = re.employee_id 
	left join roles r on re.role_id = r.id 
	left join employee_salary es on re.employee_id = es.employee_id 
	left join salary s on es.salary_id = s.id 	
		where r.role_name like '%Junior Python developer%';
-- 18. Вывести имена и зарплаты Middle JS разработчиков
select e.employee_name, s.monthly_salary 
	from employees e left join roles_employee re on e.id = re.employee_id 
	left join roles r on re.role_id = r.id 
	left join employee_salary es on re.employee_id = es.employee_id 
	left join salary s on es.salary_id = s.id 	
		where r.role_name like '%Middle JavaScript developer%';	
--не получает зарплату, тк. нет в таблице emloyee_salary


	-- 19. Вывести имена и зарплаты Senior Java разработчиков
select e.employee_name, s.monthly_salary
	from employees e left join roles_employee re on e.id = re.employee_id 
	left join roles r on re.role_id = r.id 
	left join employee_salary es on re.employee_id = es.employee_id 
	left join salary s on es.salary_id = s.id 
		where r.role_name like '%Senior Java developer%';
	
-- 20. Вывести зарплаты Junior QA инженеров
 
 select s.monthly_salary, e.employee_name, r.role_name 
 	from employees e left join roles_employee re on e.id = re.employee_id 
 	left join roles r on re.role_id = r.id 
 	left join employee_salary es on re.employee_id = es.employee_id 
 	left join salary s on es.salary_id = s.id 
 		where r.role_name like 'Junior Automation QA engineer' or r.role_name like 'Junior Manual QA engineer'; 
-- and s.monthly_salary is not null;
-- 21. Вывести среднюю зарплату всех Junior специалистов
 	select avg(s.monthly_salary) 
 		from salary s left join employee_salary es on s.id = es.salary_id 
 		left join roles_employee re on es.employee_id = re.employee_id 
 		left join roles r on re.role_id = r.id
 			where r.role_name like 'Junior%';
 		
-- 22. Вывести сумму зарплат JS разработчиков
 		select sum(s.monthly_salary)
 			from salary s left join employee_salary es on s.id = es.salary_id 
 			left join roles_employee re on es.employee_id = re.employee_id 
 			left join roles r on re.role_id =r.id 
 				where r.role_name like '%JavaScript%';
-- 23. Вывести минимальную ЗП QA инженеров
 select min(s.monthly_salary)
 	from salary s left join employee_salary es on s.id = es.salary_id 
 	left join roles_employee re on es.employee_id  =re.employee_id 
 	left join roles r on re.role_id = r.id 
 		where r.role_name like '%QA%';
-- 24. Вывести максимальную ЗП QA инженеров
 select max(s.monthly_salary)
 	from salary s left join employee_salary es on s.id = es.salary_id 
 	left join roles_employee re on es.employee_id  =re.employee_id 
 	left join roles r on re.role_id = r.id 
 		where r.role_name like '%QA%';
-- 25. Вывести количество QA инженеров
 select count(r.role_name) from roles r
 	join roles_employee re on r.id = re.role_id 
 	join employees e on re.employee_id = e.id 
 		 where r.role_name like '%QA%';
 	
-- 26. Вывести количество Middle специалистов.
 select count(r.role_name) from roles r 
 	join roles_employee re on re.role_id =r.id 
 	join employees e on re.employee_id = e.id 
 		where r.role_name like '%Middle%';
 		
-- 27. Вывести количество разработчиков
 select count(r.role_name) from roles r 
 	join roles_employee re on re.role_id =r.id 
 	join employees e on re.employee_id = e.id 
 		where r.role_name like '%developer%';
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
 select sum(s.monthly_salary) from salary s 
 	join employee_salary es on s.id = es.salary_id 
 	join roles_employee re on es.employee_id = re.role_id 
 	join roles r on re.role_id = r.id 
 		where r.role_name like '%developer%';
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
 select e.employee_name, r.role_name, s.monthly_salary 
 	from salary s left join employee_salary es on s.id = es.salary_id 
 	left join employees e on es.employee_id = e.id 
 	left join roles_employee re on re.employee_id =e.id 
 	left join roles r on re.role_id =r.id 
 	order by s.monthly_salary desc ;
--  выдвет null в role_name!!!!
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
 select e.employee_name, r.role_name, s.monthly_salary from employees e 
 	left join roles_employee re ON e.id = re.employee_id 
 	left join roles r on re.role_id = r.id 
 	left join employee_salary es on e.id = es.employee_id
 	left join salary s on es.salary_id = s.id 
 		where s.monthly_salary between 1700 and 2300;
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
 	select e.employee_name, r.role_name, s.monthly_salary from employees e 
 	left join roles_employee re on e.id =re.employee_id 
 	left join roles r on r.id = re.role_id 
 	left join employee_salary es on es.employee_id = e.id 
 	left join salary s on s.id = es.salary_id 
 		where s.monthly_salary < 2300
 		order by s.monthly_salary desc; 
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
 select e.employee_name, r.role_name, s.monthly_salary from employees e 
 	left join roles_employee re on e.id =re.employee_id 
 	left join roles r on r.id = re.role_id 
 	left join employee_salary es on es.employee_id = e.id 
 	left join salary s on s.id = es.salary_id 
 		where s.monthly_salary = 1100 or s.monthly_salary = 1500 or s.monthly_salary = 2000
 		order by s.monthly_salary desc 
 		