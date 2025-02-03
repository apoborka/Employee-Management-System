-- View all departments

SELECT id, "name" FROM department;


-- View all Roles

SELECT role.id, role.title, role.salary, department.name AS department 
FROM role 
JOIN department ON role.department_id = department.id;


-- View all Employees

SELECT employee.id, employee.first_name, employee.last_name, role.title AS job_title, department.name AS department, role.salary, 
       CONCAT(manager.first_name, ' ', manager.last_name) AS manager 
FROM employee 
JOIN role ON employee.role_id = role.id 
JOIN department ON role.department_id = department.id 
LEFT JOIN employee AS manager ON employee.manager_id = manager.id;


-- THE FOLLOWING QUERIES USE USER INPUTS
-- PREVENT SQL INJECTION BY USING PARAMETERIZED QUERIES

-- Add a Department

INSERT INTO department (name)
VALUES ($1);


-- Add a Role

INSERT INTO role (title, salary, department_id)
VALUES ($1, $2, $3);


-- Add an Employee

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ($1, $2, $3, $4);


-- Update an Employee Role

UPDATE employee
SET role_id = $1
WHERE id = $2;


