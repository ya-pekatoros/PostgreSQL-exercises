/* Показать работников у которых нет почты или почта не в корпоративном домене (домен dualbootpartners.com) */

SELECT name, lastname from employees WHERE email NOT LIKE '%dualbootpartners.com' OR email IS NULL;

/* Получить список работников нанятых в последние 30 дней */

SELECT name, lastname from employees WHERE (CURRENT_DATE - hire_date) <= 30;

/* Найти максимальную и минимальную зарплату по каждому департаменту */

SELECT d.name, MAX(e.salary), MIN(e.salary)
FROM employees as e INNER JOIN departments as d
ON e.department_id = d.id
GROUP BY e.department_id;

/* Посчитать количество работников в каждом регионе */

SELECT COUNT(e.id), l.region_id
FROM employees AS e
JOIN departments AS d ON e.department_id = d.id
JOIN locations AS l ON d.location_id = l.id
GROUP BY l.region_id;

/* Показать сотрудников у которых фамилия длиннее 10 символов */

SELECT name, lastname from employees WHERE length(lastname) > 10;

/* Показать сотрудников с зарплатой выше средней по всей компании */

SELECT name, lastname, salary from employees WHERE salary > (SELECT AVG(salary) FROM employees);
