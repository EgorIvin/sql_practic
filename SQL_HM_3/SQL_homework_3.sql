/*SQL HM_3 */

select * from employees;
select * from salary;
select * from roles;
select * from roles_employee;
select * from employee_salary;

/*Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами. */

select employee_name , monthly_salary
from employee_salary 
join employees on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id = salary.id;

/* Вывести всех работников у которых ЗП меньше 2000. */
select employee_name , monthly_salary
from employee_salary 
join employees on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2000;

/*  Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.) */

select monthly_salary, employee_name  from 
employee_salary 
right join salary on employee_salary.salary_id = salary.id 
left join employees on employee_salary.employee_id = employees.id 
where employee_name is null;

/* Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.) */

select monthly_salary, employee_name  from 
employee_salary 
right join salary on employee_salary.salary_id = salary.id 
left join employees on employee_salary.employee_id = employees.id 
where employee_name is null and monthly_salary < 2000;


/* Найти всех работников кому не начислена ЗП. */

select employee_name, monthly_salary  from 
employee_salary
right join employees on employee_salary.employee_id = employees.id
full join salary on employee_salary.salary_id = salary.id  
where monthly_salary is null;

/* Вывести всех работников с названиями их должности. */

select employee_name, role_name from 
roles_employee 
join employees on roles_employee.role_id = employees.id
join roles on roles_employee.role_id = roles.id;

/* Вывести имена и должность только Java разработчиков. */

select employee_name, role_name from 
roles_employee 
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Java%';

/*  Вывести имена и должность только Python разработчиков. */

select employee_name, role_name from 
roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Python%';

/* Вывести имена и должность всех QA инженеров. */

select employee_name, role_name from 
roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%QA%';

/* Вывести имена и должность ручных QA инженеров.*/

select employee_name, role_name from 
roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Manual%'

/* Вывести имена и должность автоматизаторов QA */

select employee_name, role_name from 
roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Automation%'

/* Вывести имена и зарплаты Junior специалистов */

select employee_name, role_name, monthly_salary from 
employees 
full join roles_employee on roles_employee.id = employees.id 
join roles on employees.id = roles.id 
full join employee_salary on employee_salary.id = employees.id 
join salary on employees.id = salary.id 
where role_name like '%Junior%';

/* Вывести имена и зарплаты Middle специалистов */

select employee_name, role_name, monthly_salary from 
employees 
full join roles_employee on roles_employee.id = employees.id 
full join employee_salary on employee_salary.id = employees.id
join roles on roles.id = employees.id 
join salary on salary.id = employees.id 
where role_name like '%Middle%';

/* Вывести имена и зарплаты Senior специалистов */

select employee_name, role_name, monthly_salary from 
employees
full join roles_employee on roles_employee.id = employees.id 
full join employee_salary on employee_salary.id = employees.id 
join roles on roles.id = employees.id 
join salary on salary.id = employees.id 
where role_name like '%Senior%';


/* Вывести зарплаты Java разработчиков */
select monthly_salary , role_name from
employees 
full join employee_salary on employee_salary.id = employees.id 
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%Java %';

/* Вывести зарплаты Python разработчиков */
select monthly_salary,role_name from 
employees 
full join employee_salary on employee_salary.id = employees.id 
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%Python%';

/* Вывести имена и зарплаты Junior Python разработчиков */
select employee_name,monthly_salary,role_name from 
employees
join employee_salary on employee_salary.id = employees.id
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%Junior Python%';

/* Вывести имена и зарплаты Middle JS разработчиков */ 
select employee_name,monthly_salary,role_name from 
employees
join employee_salary on employee_salary.id  = employees.id 
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%Middle JavaScript%';

/* Вывести имена и зарплаты Senior Java разработчиков */
select employee_name,monthly_salary,role_name from 
employees 
join employee_salary on employee_salary.id = employees.id 
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%Senior Java %';

/* Вывести зарплаты Junior QA инженеров */ 
select monthly_salary,role_name from 
employees 
join employee_salary on employee_salary.id = employees.id 
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%QA%' and role_name like '%Junior%';

/* Вывести среднюю зарплату всех Junior специалистов */
select AVG(monthly_salary) from 
employees
join roles on roles.id = employees.id 
join salary on salary.id = employees.id 
where role_name like '%Junior%';

/* Вывести сумму зарплат JS разработчиков */
select SUM(monthly_salary) from 
employees
join roles on roles.id = employees.id 
join salary on salary.id = employees.id 
where role_name like '%JavaScript%';

/* Вывести минимальную ЗП QA инженеров */
select min(monthly_salary) from 
employees
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%QA%';

/* Вывести максимальную ЗП QA инженеров */
select max(monthly_salary) from 
employees 
join salary on salary.id = employees.id 
join roles on roles.id = employees.id 
where role_name like '%QA%';

/* Вывести количество QA инженеров */
select COUNT(role_name) from 
employees 
join roles on roles.id = employees.id 
where role_name like '%QA%';

/* Вывести количество Middle специалистов. */
select count(role_name) from 
employees
join roles on roles.id = employees.id 
where role_name like '%Middle%';

/* Вывести количество разработчиков */
select  count(employee_name) from 
employees 
join roles on roles.id = employees.id;

/* Вывести фонд (сумму) зарплаты разработчиков. */
select sum(monthly_salary) from 
employees 
join salary on salary.id = employees.id;

/* Вывести имена, должности и ЗП всех специалистов по возрастанию */ 
select employee_name,role_name, monthly_salary from 
employees
join roles on roles.id = employees.id 
join salary on salary.id = employees.id 
order by monthly_salary asc;

/* Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300 */
select * from 
employees 
join roles on roles.id = employees.id 
join salary on salary.id = employees.id 
where monthly_salary > 1600 and monthly_salary <2400

/* Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300 */
select employee_name,role_name,monthly_salary from 
employees 
join roles on roles.id = employees.id 
join salary on salary.id = employees.id
where monthly_salary < 2400
order by monthly_salary asc

/*Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000 */
select * from 
employees 
join roles on roles.id = employees.id 
join salary on salary.id = employees.id
where monthly_salary in (1100,1500,2000)







