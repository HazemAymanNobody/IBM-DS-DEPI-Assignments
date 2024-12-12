-- إنشاء جدول departments
CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    dname TEXT NOT NULL
);

-- إدراج بيانات في جدول departments
INSERT INTO departments (department_id, dname) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing');

-- إنشاء جدول employees
CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- إدراج بيانات في جدول employees
INSERT INTO employees (employee_id, fname, lname, department_id) VALUES
(101, 'Alice', 'Smith', 1),
(102, 'Bob', 'Johnson', 2),
(103, 'Charlie', 'Brown', 3),
(104, 'Diana', 'Williams', 4),
(105, 'Eve', 'Jones', 1);

-- إنشاء جدول work_hours
CREATE TABLE work_hours (
    employee_id INTEGER,
    project_id INTEGER,
    hours INTEGER,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- إدراج بيانات في جدول work_hours
INSERT INTO work_hours (employee_id, project_id, hours) VALUES
(101, 1, 10),
(102, 2, 15),
(103, 3, 20),
(104, 4, 25),
(105, 5, 30);

-- إنشاء جدول projects
CREATE TABLE projects (
    project_id INTEGER PRIMARY KEY,
    pname TEXT NOT NULL
);

-- إدراج بيانات في جدول projects
INSERT INTO projects (project_id, pname) VALUES
(1, 'Project A'),
(2, 'Project B'),
(3, 'Project C'),
(4, 'Project D'),
(5, 'Project E');

-- إنشاء جدول suppliers
CREATE TABLE suppliers (
    supplier_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    status INTEGER NOT NULL
);

-- إدراج بيانات في جدول suppliers
INSERT INTO suppliers (supplier_id, name, status) VALUES
(1, 'Supplier X', 10),
(2, 'Supplier Y', 20),
(3, 'Supplier Z', 25);


-- Task 1: Creating a Simple View
CREATE VIEW vw_employee_details AS
SELECT e.fname, e.lname, d.dname
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;


-- Task 2: Modifying a View
CREATE OR REPLACE VIEW vw_work_hrs AS
SELECT e.fname, e.lname, p.pname, w.hours
FROM employees e
JOIN work_hours w ON e.employee_id = w.employee_id
JOIN projects p ON w.project_id = p.project_id
WHERE e.department_id = 5;


-- Task 3: Creating Views with Check Option
CREATE VIEW vw_high_status_suppliers AS
SELECT *
FROM suppliers
WHERE status > 15
WITH CHECK OPTION;

