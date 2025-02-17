-- Create Database
CREATE DATABASE CompanyDB;

USE CompanyDB;

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Verify Departments Table
SELECT * FROM Departments;

-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    DepartmentID INT,
    JoiningDate DATE NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Verify Employees Table
SELECT * FROM Employees;

-- Insert Data into Departments Table
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales');

-- Verify Inserted Data
SELECT * FROM Departments;

-- Insert Data into Employees Table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Salary, DepartmentID, JoiningDate) VALUES
(1, 'John', 'Doe', 30, 75000, 1, '2022-06-15'),
(2, 'Jane', 'Smith', 45, 90000, 2, '2021-03-10'),
(3, 'Alice', 'Johnson', 29, 65000, 3, '2023-01-20'),
(4, 'Bob', 'Brown', 50, 120000, 1, '2018-11-05'),
(5, 'Charlie', 'Davis', 35, 85000, 2, '2020-07-30'),
(6, 'Daniel', 'Evans', 28, 70000, 3, '2023-09-10'),
(7, 'Emma', 'Wilson', 32, 72000, 1, '2022-04-25'),
(8, 'Frank', 'Miller', 41, 98000, 2, '2019-08-12'),
(9, 'Grace', 'Moore', 26, 68000, 3, '2024-01-05'),
(10, 'Henry', 'Taylor', 38, 88000, 1, '2021-12-18');

-- Verify Inserted Data
SELECT * FROM Employees;

-- Query to display all employees with their department names
SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Query to calculate the average salary of employees in each department
SELECT d.DepartmentName, AVG(e.Salary) AS AvgSalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- Query to display employees who have joined in the last 2 years
SELECT * FROM Employees
WHERE JoiningDate >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- Query to find the department with the highest number of employees
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY EmployeeCount DESC
LIMIT 1;

-- Query to update the salary of employees older than 40 by increasing it by 10%
UPDATE Employees
SET Salary = Salary * 1.10
WHERE Age > 40;

SET SQL_SAFE_UPDATES = 0;

-- Verify Inserted Data
SELECT * FROM Employees;

-- Query to delete all employees from the 'Sales' department
DELETE FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Sales');

-- Create a view for employees earning more than 100000
CREATE VIEW HighEarnerEmployees AS
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees
WHERE Salary > 100000;

-- Verify Created View
SELECT * FROM HighEarnerEmployees;

-- Query using CTE to find employees in the same department earning above average salary
WITH DeptAvgSalary AS (
    SELECT DepartmentID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
)
SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary, d.DepartmentName
FROM Employees e
JOIN DeptAvgSalary das ON e.DepartmentID = das.DepartmentID
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > das.AvgSalary;

-- Verify High Earning Employees by Department
SELECT * FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > (SELECT AVG(Salary) FROM Employees WHERE DepartmentID = e.DepartmentID);