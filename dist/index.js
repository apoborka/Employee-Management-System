"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const inquirer_1 = __importDefault(require("inquirer"));
const connection_1 = require("./connection");
// Main menu function to display options to the user
const mainMenu = () => {
    const questions = [
        {
            type: 'list',
            name: 'action',
            message: 'What would you like to do?',
            choices: [
                'View All Departments',
                'View All Roles',
                'View All Employees',
                'Add Department',
                'Add Role',
                'Add Employee',
                'Update Employee Role',
                'Exit'
            ]
        }
    ];
    // Prompt the user with the main menu options
    inquirer_1.default.prompt(questions).then(answer => {
        switch (answer.action) {
            case 'View All Departments':
                viewAllDepartments();
                break;
            case 'View All Roles':
                viewAllRoles();
                break;
            case 'View All Employees':
                viewAllEmployees();
                break;
            case 'Add Department':
                addDepartment();
                break;
            case 'Add Role':
                addRole();
                break;
            case 'Add Employee':
                addEmployee();
                break;
            case 'Update Employee Role':
                updateEmployeeRole();
                break;
            case 'Exit':
                connection_1.pool.end();
                process.exit();
        }
    });
};
// Function to view all departments
const viewAllDepartments = () => {
    connection_1.pool.query('SELECT id, "name" FROM department', (err, res) => {
        if (err)
            throw err;
        console.table(res.rows);
        mainMenu();
    });
};
// Function to view all roles
const viewAllRoles = () => {
    connection_1.pool.query('SELECT role.id, role.title, role.salary, department.name AS department FROM role JOIN department ON role.department_id = department.id', (err, res) => {
        if (err)
            throw err;
        console.table(res.rows);
        mainMenu();
    });
};
// Function to view all employees
const viewAllEmployees = () => {
    connection_1.pool.query(`
    SELECT employee.id, employee.first_name, employee.last_name, role.title, department.name AS department, role.salary, 
    CONCAT(manager.first_name, ' ', manager.last_name) AS manager 
    FROM employee 
    JOIN role ON employee.role_id = role.id 
    JOIN department ON role.department_id = department.id 
    LEFT JOIN employee AS manager ON employee.manager_id = manager.id
    ORDER BY employee.id ASC
  `, (err, res) => {
        if (err)
            throw err;
        console.table(res.rows);
        mainMenu();
    });
};
// Function to add a new department
const addDepartment = () => {
    const questions = [
        { type: 'input', name: 'name', message: 'Department Name:' }
    ];
    inquirer_1.default.prompt(questions).then(answer => {
        connection_1.pool.query('INSERT INTO department (name) VALUES ($1)', [answer.name], (err, res) => {
            if (err)
                throw err;
            console.log('Department added successfully');
            mainMenu();
        });
    });
};
// Function to add a new role
const addRole = () => {
    const questions = [
        { type: 'input', name: 'title', message: 'Role Title:' },
        { type: 'input', name: 'salary', message: 'Role Salary:' },
        { type: 'input', name: 'department_id', message: 'Department ID:' }
    ];
    inquirer_1.default.prompt(questions).then(answers => {
        connection_1.pool.query('INSERT INTO role (title, salary, department_id) VALUES ($1, $2, $3)', [answers.title, answers.salary, answers.department_id], (err, res) => {
            if (err)
                throw err;
            console.log('Role added successfully');
            mainMenu();
        });
    });
};
// Function to add a new employee
const addEmployee = () => {
    const questions = [
        { type: 'input', name: 'first_name', message: 'First Name:' },
        { type: 'input', name: 'last_name', message: 'Last Name:' },
        { type: 'input', name: 'role_id', message: 'Role ID:' },
        { type: 'input', name: 'manager_id', message: 'Manager ID:' }
    ];
    inquirer_1.default.prompt(questions).then(answers => {
        connection_1.pool.query('INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ($1, $2, $3, $4)', [answers.first_name, answers.last_name, answers.role_id, answers.manager_id], (err, res) => {
            if (err)
                throw err;
            console.log('Employee added successfully');
            mainMenu();
        });
    });
};
// Function to update an employee's role
const updateEmployeeRole = () => {
    const questions = [
        { type: 'input', name: 'employee_id', message: 'Employee ID:' },
        { type: 'input', name: 'role_id', message: 'New Role ID:' }
    ];
    inquirer_1.default.prompt(questions).then(answers => {
        connection_1.pool.query('UPDATE employee SET role_id = $1 WHERE id = $2', [answers.role_id, answers.employee_id], (err, res) => {
            if (err)
                throw err;
            console.log('Employee role updated successfully');
            mainMenu();
        });
    });
};
// Start the application by displaying the main menu
mainMenu();
