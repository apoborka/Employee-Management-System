-- Create Database "employee_management_system"

DROP DATABASE IF EXISTS employee_management_system;
CREATE DATABASE employee_management_system;

-- Select "employee_management_system" as the active db

\c employee_management_system

-- Create required tables: department, role, employee
-- Create required columns:
--     department table (id, "name") - PK department.id REF FK role.department_id
--     role table (id, title, salary, department) - PK role.id REF FK employee.role_id
--     employee (id, first_name, last_name, role_id, manager_id) - PK employee.id REF FK employee.manager_id

CREATE TABLE department (
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE role (
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) UNIQUE NOT NULL,
    salary DECIMAL NOT NULL,
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INTEGER NOT NULL,
    manager_id INTEGER,
    FOREIGN KEY (role_id) REFERENCES role(id),
    FOREIGN KEY (manager_id) REFERENCES employee(id)
);