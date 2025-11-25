CREATE DATABASE case_study;
USE case_study;

-- 1. LOCATION TABLE
CREATE TABLE Location(
    Location_ID INT PRIMARY KEY,
    City VARCHAR(30)
);

INSERT INTO Location (Location_ID, City) VALUES
(122, 'New York'),
(123, 'Dallas'),
(124, 'Chicago'),
(167, 'Boston');


-- 2. DEPARTMENT TABLE
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Name VARCHAR(30),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);

INSERT INTO Department (Department_ID, Name, Location_ID) VALUES
(10, 'Accounting', 122),
(20, 'Sales', 124),
(30, 'Research', 123),
(40, 'Operations', 167);


-- 3. JOB TABLE (MUST COME BEFORE employees)
CREATE TABLE Job (
    Job_ID INT PRIMARY KEY,
    Designation VARCHAR(30)
);

INSERT INTO Job (Job_ID, Designation) VALUES
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President');


-- 4. EMPLOYEE TABLE
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Last_Name VARCHAR(30),
    First_Name VARCHAR(30),
    Middle_Name VARCHAR(10),
    Job_ID INT,
    Hire_Date DATE,
    Salary INT,
    Comm INT,
    Department_ID INT,
    FOREIGN KEY (Job_ID) REFERENCES Job(Job_ID),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

INSERT INTO Employees(
    Employee_ID, Last_Name, First_Name, Middle_Name, 
    Job_ID, Hire_Date, Salary, Comm, Department_ID
)
VALUES
(7369, 'Smith', 'John', 'Q', 667, '1984-12-17', 800,   NULL, 20),
(7499, 'Allen', 'Kevin', 'J', 670, '1985-02-20', 1600, 300,  30),
(755,  'Doyle', 'Jean',  'K', 671, '1985-04-04', 2850, NULL, 30),
(756,  'Dennis','Lynn',  'S', 671, '1985-05-15', 2750, NULL, 30),
(757,  'Baker', 'Leslie','D', 671, '1985-06-10', 2200, NULL, 40),
(7521, 'Wark',  'Cynthia','D', 670, '1985-02-22', 1250, 50,   30);


-- CHECK TABLES
SELECT * FROM Location;
SELECT * FROM Department;
SELECT * FROM Job;
SELECT first_name, last_name ,salary ,comm from Employees
select Employee_id,last_name,department_id from Employees
SELECT First_Name,Last_Name,Salary * 12 AS Annual_Salary FROM Employees;
select*from Employees where Last_Name = 'smith';
select*from Employees where Department_ID=20;
select*from Employees where Salary between 2000 and 3000;
select*from Employees where Department_ID not in (10,20);
select*from Employees where Department_ID between 10 and 20;
select*from Employees where First_Name like 'L%'
select*from Employees where First_Name like 'L%E'
SELECT *
FROM Employees
WHERE LEN(First_Name ) = 4 and First_Name like 'j%';
select*from Employees where Department_ID=30 and salary>2500;
select*from Employees where  comm is null;
select Employee_ID,last_name from employees
order by Employee_ID asc;
select Employee_ID,first_name from employees
order by Employee_ID desc;
select * from employees
order by last_name desc;
select * from employees
order by last_name asc , department_id asc;

--GROUP BY and HAVING Clause: 
SELECT 
    Department_ID,
    MAX(Salary) AS Max_Salary,
    MIN(Salary) AS Min_Salary,
    AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department_ID;

SELECT 
    Job_ID,
    MAX(Salary) AS Max_Salary,
    MIN(Salary) AS Min_Salary,
    AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Job_ID;

SELECT 
    month(hire_date) as join_month,
    count(*) as number_of_employees
FROM Employees
GROUP BY month(hire_date)
order by join_month asc;

SELECT 
    month(hire_date) as join_month,
    year(hire_date) as join_year,
    count(*) as number_of_employees
FROM Employees
GROUP BY month(hire_date),year(hire_date)
order by join_month,join_year asc;

SELECT 
    Department_ID,
    count(*) as number_of_employees
FROM Employees
GROUP BY Department_ID
having count(*) >= 4;

SELECT 
    month(hire_date) as feburay_month,
    count(*) as number_of_employees
FROM Employees
GROUP BY month(hire_date)
having month(hire_date) = 2;

SELECT 
    month(hire_date) as may_june,
    count(*) as number_of_employees
FROM Employees
GROUP BY month(hire_date)
having month(hire_date) in (5,6)

SELECT 
    YEAR(Hire_Date) AS join_year,
    COUNT(*) AS number_of_employees
FROM Employees
GROUP BY YEAR(Hire_Date)
HAVING YEAR(Hire_Date) = 1985;

SELECT 
    month(Hire_Date) AS join_month,
    COUNT(*) AS number_of_employees
FROM Employees
where YEAR(Hire_Date) = 1985
group by month(hire_date)
order by month (hire_date);

SELECT 
    month(Hire_Date) AS join_month,
    COUNT(*) AS number_of_employees
FROM Employees
where YEAR(Hire_Date) = 1985
group by month(hire_date)
having month(hire_date) in (4)
order by month (hire_date);

SELECT 
    Department_ID,
    COUNT(*) AS num_joined_in_apr_1985
FROM Employees
WHERE YEAR(Hire_Date) = 1985
  AND MONTH(Hire_Date) = 4
GROUP BY Department_ID
HAVING COUNT(*) >= 3;

---------------------------------------------------------
-- JOIN QUERIES
---------------------------------------------------------

-- 1. Employees with their department names
SELECT E.*, D.Name AS Department_Name
FROM Employees E
JOIN Department D ON E.Department_ID = D.Department_ID;

-- 2. Employees with their designations
SELECT E.*, J.Designation
FROM Employees E
JOIN Job J ON E.Job_ID = J.Job_ID;

-- 3. Employees with their department names and city
SELECT E.*, D.Name AS Department_Name, L.City
FROM Employees E
JOIN Department D ON E.Department_ID = D.Department_ID
JOIN Location L ON D.Location_ID = L.Location_ID;

-- 4. Number of employees in each department
SELECT D.Name AS Department_Name, COUNT(*) AS Total_Employees
FROM Employees E
JOIN Department D ON E.Department_ID = D.Department_ID
GROUP BY D.Name;

-- 5. Employees working in Sales department (count)
SELECT COUNT(*)
FROM Employees E
JOIN Department D ON E.Department_ID = D.Department_ID
WHERE D.Name = 'Sales';

-- 6. Departments with >= 3 employees (ascending)
SELECT D.Name
FROM Employees E
JOIN Department D ON E.Department_ID = D.Department_ID
GROUP BY D.Name
HAVING COUNT(*) >= 3
ORDER BY D.Name ASC;

-- 7. Employees working in 'Dallas'
SELECT COUNT(*)
FROM Employees E
JOIN Department D ON E.Department_ID = D.Department_ID
JOIN Location L ON D.Location_ID = L.Location_ID
WHERE L.City = 'Dallas';

-- 8. Employees in Sales or Operations
SELECT E.*
FROM Employees E
JOIN Department D ON E.Department_ID = D.Department_ID
WHERE D.Name IN ('Sales', 'Operations');

---------------------------------------------------------
-- CONDITIONAL STATEMENTS (CASE)
---------------------------------------------------------

-- 1. Employee details with salary grades
SELECT *,
CASE
    WHEN Salary >= 5000 THEN 'A'
    WHEN Salary >= 3000 THEN 'B'
    WHEN Salary >= 2000 THEN 'C'
    ELSE 'D'
END AS Grade
FROM Employees;

-- 2. Number of employees grade-wise
SELECT 
CASE
    WHEN Salary >= 5000 THEN 'A'
    WHEN Salary >= 3000 THEN 'B'
    WHEN Salary >= 2000 THEN 'C'
    ELSE 'D'
END AS Grade,
COUNT(*) AS Total_Employees
FROM Employees
GROUP BY 
CASE
    WHEN Salary >= 5000 THEN 'A'
    WHEN Salary >= 3000 THEN 'B'
    WHEN Salary >= 2000 THEN 'C'
    ELSE 'D'
END;

-- 3. Salary grades for employees earning 2000–5000
SELECT 
CASE
    WHEN Salary >= 5000 THEN 'A'
    WHEN Salary >= 3000 THEN 'B'
    WHEN Salary >= 2000 THEN 'C'
END AS Grade,
COUNT(*) AS Total_Employees
FROM Employees
WHERE Salary BETWEEN 2000 AND 5000
GROUP BY 
CASE
    WHEN Salary >= 5000 THEN 'A'
    WHEN Salary >= 3000 THEN 'B'
    WHEN Salary >= 2000 THEN 'C'
END;

---------------------------------------------------------
-- SUBQUERIES
---------------------------------------------------------

-- 1. Employees with maximum salary
SELECT *
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

-- 2. Employees in Sales department
SELECT *
FROM Employees
WHERE Department_ID = (
    SELECT Department_ID FROM Department WHERE Name = 'Sales'
);

-- 3. Employees working as 'Clerk'
SELECT *
FROM Employees
WHERE Job_ID = (
    SELECT Job_ID FROM Job WHERE Designation = 'Clerk'
);

-- 4. Employees living in 'Boston'
SELECT E.*
FROM Employees E
JOIN Department D ON E.Department_ID = D.Department_ID
JOIN Location L ON D.Location_ID = L.Location_ID
WHERE L.City = 'Boston';

-- 5. Number of employees in Sales department
SELECT COUNT(*)
FROM Employees
WHERE Department_ID = (
    SELECT Department_ID FROM Department WHERE Name = 'Sales'
);

-- 6. Increase salaries of clerks by 10%
UPDATE Employees
SET Salary = Salary * 1.10
WHERE Job_ID = (SELECT Job_ID FROM Job WHERE Designation = 'Clerk');

-- 7. Second highest salary
SELECT *
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary) 
    FROM Employees 
    WHERE Salary < (SELECT MAX(Salary) FROM Employees)
);

-- 8. Employees earning more than EVERY employee in Dept 30
SELECT *
FROM Employees
WHERE Salary > ALL (
    SELECT Salary FROM Employees WHERE Department_ID = 30
);

-- 9. Departments with no employees
SELECT *
FROM Department
WHERE Department_ID NOT IN (
    SELECT DISTINCT Department_ID FROM Employees
);

-- 10. Employees earning more than average salary of their department
SELECT *
FROM Employees E
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE Department_ID = E.Department_ID
);
