/*SQL HM_3 */

select * from employees;
select * from salary;
select * from roles;
select * from roles_employee;
select * from employee_salary;

select employee_name , monthly_salary
from employee_salary 
join employees on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id = salary.id;


select employee_name , monthly_salary
from employee_salary 
join employees on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2000;

select monthly_salary, employee_name  from 
employee_salary 
right join salary on employee_salary.salary_id = salary.id 
left join employees on employee_salary.employee_id = employees.id 
where employee_name is null;

select monthly_salary, employee_name  from 
employee_salary 
right join salary on employee_salary.salary_id = salary.id 
left join employees on employee_salary.employee_id = employees.id 
where employee_name is null and monthly_salary < 2000;

select employee_name, monthly_salary  from 
employee_salary
right join employees on employee_salary.employee_id = employees.id
full join salary on employee_salary.salary_id = salary.id  
where monthly_salary is null;

select employee_name, role_name from 
roles_employee 
join employees on roles_employee.role_id = employees.id
join roles on roles_employee.role_id = roles.id;

select employee_name, role_name from 
roles_employee 
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Java%';

select employee_name, role_name from 
roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Python%';

select employee_name, role_name from 
roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%QA%';

select employee_name, role_name from 
roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Manual%'

select employee_name, role_name from 
roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Automation%'

select employee_name, role_name, monthly_salary from 
employees 
full join roles_employee on roles_employee.id = employees.id 
join roles on employees.id = roles.id 
full join employee_salary on employee_salary.id = employees.id 
join salary on employees.id = salary.id 
where role_name like '%Junior%';

select employee_name, role_name, monthly_salary from 
employees 
full join roles_employee on roles_employee.id = employees.id 
full join employee_salary on employee_salary.id = employees.id
join roles on roles.id = employees.id 
join salary on salary.id = employees.id 
where role_name like '%Middle%';

select employee_name, role_name, monthly_salary from 
employees
full join roles_employee on roles_employee.id = employees.id 
full join employee_salary on employee_salary.id = employees.id 
join roles on roles.id = employees.id 
join salary on salary.id = employees.id 
where role_name like '%Senior%';

select monthly_salary , role_name from
employees 
full join employee_salary on employee_salary.id = employees.id 
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%Java %';

select monthly_salary,role_name from 
employees 
full join employee_salary on employee_salary.id = employees.id 
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%Python%';

select employee_name,monthly_salary,role_name from 
employees
join employee_salary on employee_salary.id = employees.id
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%Junior Python%';

select employee_name,monthly_salary,role_name from 
employees
join employee_salary on employee_salary.id  = employees.id 
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%Middle JavaScript%';

select employee_name,monthly_salary,role_name from 
employees 
join employee_salary on employee_salary.id = employees.id 
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%Senior Java %';

select monthly_salary,role_name from 
employees 
join employee_salary on employee_salary.id = employees.id 
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%QA%' and role_name like '%Junior%';

select AVG(monthly_salary) from 
employees
join roles on roles.id = employees.id 
join salary on salary.id = employees.id 
where role_name like '%Junior%';

select SUM(monthly_salary) from 
employees
join roles on roles.id = employees.id 
join salary on salary.id = employees.id 
where role_name like '%JavaScript%';

select min(monthly_salary) from 
employees
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%QA%';

select max(monthly_salary) from 
employees 
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%QA%';

select COUNT(role_name) from 
employees 
join roles on roles.id = employees.id 
where role_name like '%QA%';

select count(role_name) from 
employees
join roles on roles.id = employees.id 
where role_name like '%Middle%';

select  count(employee_name) from 
employees 
join roles on roles.id = employees.id;

select sum(monthly_salary) from 
employees 
join salary on salary.id = employees.id;

select employee_name,role_name, monthly_salary from 
employees
join roles on roles.id = employees.id 
join salary on salary.id = employees.id 
order by monthly_salary asc;

select * from 
employees 
join roles on roles.id = employees.id 
join salary on salary.id = employees.id 
where monthly_salary > 1600 and monthly_salary <2400

select employee_name,role_name,monthly_salary from 
employees 
join roles on roles.id = employees.id 
join salary on salary.id = employees.id
where monthly_salary < 2400
order by monthly_salary asc

select * from 
employees 
join roles on roles.id = employees.id 
join salary on salary.id = employees.id
where monthly_salary in (1100,1500,2000)







