create table Employees(
    EmployeeID INTEGER PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary NUMERIC
);

-- Insert Employee
INSERT INTO Employeees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES (101, 'John', 'Doe', 'IT', 60000);

-- Update Salary
UPDATE Employeees
SET Salary = 65000
WHERE EmployeeID = 101;

-- Delete Employee
DELETE FROM Employeees
WHERE EmployeeID = 101;

-- Insert Employee
INSERT INTO Employeees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES (102, 'Jane', 'Smith', 'HR', 55000);

-- Update Salary
UPDATE Employeees
SET Salary = 58000
WHERE EmployeeID = 102;

-- Delete Employee
DELETE FROM Employeees
WHERE EmployeeID = 102;