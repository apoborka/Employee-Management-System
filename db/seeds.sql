INSERT INTO department (id, "name")
VALUES (1, 'Sales'),
    (2, 'Operations'),
    (3, 'Engineering'),
    (4, 'Human Resources'),
    (5, 'Finance'),
    (6, 'Marketing');

INSERT INTO "role" (title, salary, department_id)
VALUES ('CSO', 90000, 1), -- role_id = 1
    ('COO', 90000, 2), -- role_id = 2
    ('CTO', 90000, 3), -- role_id = 3
    ('HRCO', 90000, 4), -- role_id = 4
    ('CFO', 90000, 5), -- role_id = 5
    ('CMO', 90000, 6), -- role_id = 6
    ('Project Lead', 80000, 3), -- role_id = 7
    ('Group Lead', 70000, 1), -- role_id = 8
    ('Specialist', 68000, 3), -- role_id = 9
    ('Sales Representative', 52300, 1), -- role_id = 10
    ('Account Representative', 58000, 1), -- role_id = 11
    ('Operations Analyst', 60000, 2), -- role_id = 12
    ('Operations Assistant', 50000, 2), -- role_id = 13
    ('Strategic Planning Analyst', 52000, 2), -- role_id = 14
    ('Quality Assurance Analyst', 48000, 2), -- role_id = 15
    ('Junior Developer', 50000, 3), -- role_id = 16
    ('Developer', 62000, 3), -- role_id = 17
    ('Lead Developer', 70000, 3), -- role_id = 18
    ('Software Quality Assurance Analyst', 50000, 3), -- role_id = 19
    ('Coordinator', 48000, 6), -- role_id = 20
    ('Marketing Specialist', 56000, 6), -- role_id = 21
    ('SEO Specialist', 56000, 6); -- role_id = 22

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES 
('Cyrus', 'Johns', 1, NULL), -- Sales department manager, employee_id = 1
('Allison', 'Morton', 2, NULL), -- Operations department manager, employee_id = 2
('Wesley', 'Pierce', 3, NULL), -- Engineering department manager, employee_id = 3
('Camilo', 'Alvarez', 4, NULL), -- Human Resources department manager, employee_id = 4
('Mariam', 'Hardy', 5, NULL), -- Finance department manager, employee_id = 5
('Zachary', 'Richardson', 6, NULL), -- Marketing department manager, employee_id = 6
('Luisa', 'Acevedo', 7, 3), -- Project Lead, Engineering
('Dakari', 'Lawrence', 8, 1), -- Group Lead, Sales
('Lauren', 'Lyons', 9, 3), -- Specialist, Engineering
('Giovanna', 'Simmons', 10, 1), -- Sales Representative, Sales
('Harrison', 'Herrera', 11, 1), -- Account Representative, Sales
('Ximena', 'Moran', 12, 2), -- Operations Analyst, Operations
('Tate', 'Carlson', 13, 2), -- Operations Assistant, Operations
('Kali', 'Jarvis', 14, 2), -- Strategic Planning Analyst, Operations
('Marlon', 'Boone', 15, 2), -- Quality Assurance Analyst, Operations
('Jayceon', 'David', 16, 3), -- Junior Developer, Engineering
('Haylee', 'Ross', 17, 3), -- Developer, Engineering
('Arabella', 'Stevens', 18, 3), -- Lead Developer, Engineering
('Roland', 'David', 19, 3), -- Software Quality Assurance Analyst, Engineering
('Haylee', 'Everett', 20, 6), -- Coordinator, Marketing
('Leilani', 'Contreras', 21, 6), -- Marketing Specialist, Marketing
('Emilio', 'Norris', 22, 6), -- SEO Specialist, Marketing
('Arielle', 'Hendrix', 10, 1), -- Sales Representative, Sales
('Korbyn', 'Stewart', 11, 1), -- Account Representative, Sales
('Maya', 'Arroyo', 12, 2), -- Operations Analyst, Operations
('Alberto', 'Rosales', 13, 2), -- Operations Assistant, Operations
('Kinley', 'Booker', 14, 2), -- Strategic Planning Analyst, Operations
('Dominik', 'Potts', 15, 2), -- Quality Assurance Analyst, Operations
('Ellison', 'Wall', 16, 3), -- Junior Developer, Engineering
('Issac', 'Gregory', 17, 3), -- Developer, Engineering
('Alaya', 'Fernandez', 18, 3), -- Lead Developer, Engineering
('Bentley', 'Ochoa', 19, 3), -- Software Quality Assurance Analyst, Engineering
('Luciana', 'Rivers', 20, 6), -- Coordinator, Marketing
('Bear', 'Dillon', 21, 6), -- Marketing Specialist, Marketing
('Laurel', 'Brennan', 22, 6), -- SEO Specialist, Marketing
('Curtis', 'Hardy', 10, 1), -- Sales Representative, Sales
('Jessica', 'Jordan', 11, 1), -- Account Representative, Sales
('Sawyer', 'Cochran', 12, 2), -- Operations Analyst, Operations
('Alma', 'Dodson', 13, 2), -- Operations Assistant, Operations
('Seven', 'Wright', 14, 2), -- Strategic Planning Analyst, Operations
('Lily', 'Velazquez', 15, 2), -- Quality Assurance Analyst, Operations
('Drew', 'Esquivel', 16, 3), -- Junior Developer, Engineering
('Jaylee', 'Hodges', 17, 3), -- Developer, Engineering
('Alonzo', 'Flores', 18, 3), -- Lead Developer, Engineering
('Emilia', 'Williamson', 19, 3), -- Software Quality Assurance Analyst, Engineering
('Emerson', 'Guerrero', 20, 6), -- Coordinator, Marketing
('Margot', 'Evans', 21, 6), -- Marketing Specialist, Marketing
('Elias', 'Acosta', 22, 6); -- SEO Specialist, Marketing