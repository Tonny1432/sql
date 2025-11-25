

# 📌 **SQL Case Study — Employee Management Database**

This project is a complete SQL case study built using **MS SQL Server**.
It includes database creation, table creation, foreign key relationships, data insertion, and 50+ SQL queries covering **Joins, Group By, Having, Case, Subqueries**, and more.

---

# 📂 **Project Structure**

### ✔ Database

`case_study`

### ✔ Tables

* **Location**
* **Department**
* **Job**
* **Employees**

### ✔ Queries Included

* Basic SELECT queries
* Filtering & pattern matching
* ORDER BY operations
* GROUP BY & HAVING
* Conditional CASE statements
* JOINS (INNER, LEFT, RIGHT through logical cases)
* Subqueries (single row, multiple row, correlated)
* Data analysis queries

---

# 🛠 **1. Database & Table Creation**

### **Location Table**

```sql
CREATE TABLE Location (
    Location_ID INT PRIMARY KEY,
    City VARCHAR(30)
);
```

### **Department Table**

```sql
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Name VARCHAR(30),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);
```

### **Job Table**

```sql
CREATE TABLE Job (
    Job_ID INT PRIMARY KEY,
    Designation VARCHAR(30)
);
```

### **Employees Table**

```sql
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
```

---

# 🧩 **2. Insert Statements**

Sample:

```sql
INSERT INTO Employees (Employee_ID, Last_Name, First_Name, Middle_Name, Job_ID, Hire_Date, Salary, Comm, Department_ID)
VALUES
(7369, 'Smith', 'John', 'Q', 667, '1984-12-17', 800, NULL, 20),
(7499, 'Allen', 'Kevin', 'J', 670, '1985-02-20', 1600, 300, 30);
```

(Full script contains all data.)

---

# 📊 **3. SQL Queries Included**

## 🔹 Basic Queries

* Select specific columns
* Filtering using WHERE
* Ranges (BETWEEN)
* Pattern matching (LIKE)

## 🔹 Sorting

```sql
SELECT * FROM Employees ORDER BY Last_Name ASC;
```

## 🔹 Aggregations (GROUP BY + HAVING)

```sql
SELECT Department_ID, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department_ID;
```

## 🔹 JOIN Queries

```sql
SELECT E.*, D.Name
FROM Employees E
JOIN Department D ON E.Department_ID = D.Department_ID;
```

## 🔹 CASE (Conditional Statements)

```sql
SELECT First_Name, Salary,
CASE
  WHEN Salary >= 5000 THEN 'A'
  WHEN Salary >= 3000 THEN 'B'
  ELSE 'C'
END AS Grade
FROM Employees;
```

## 🔹 Subqueries

```sql
SELECT *
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);
```

---

# 📈 **4. Analysis Queries**

* Department-wise salary summary
* Job-wise salary summary
* Employees joined per month/year
* Departments with ≥ 3 employees
* Employees with NULL commission
* Employees who earn more than the department average
* Second highest salary
* Departments with no employees

---

# 🗂 **5. Full SQL Script**

The repository contains the full `.sql` file including:

✔ Table creation
✔ Insert commands
✔ 50+ SQL queries
✔ CLEAN & ORGANIZED STRUCTURE

---

# 🚀 **6. How to Run the Project**

1. Install **MS SQL Server / SQL Server Management Studio**
2. Create the database:

   ```sql
   CREATE DATABASE case_study;
   USE case_study;
   ```
3. Run the table creation statements
4. Insert the sample data
5. Execute the queries as needed

---

# 🎯 **7. Skills Practiced**

* SQL Joins
* Database design
* Data grouping & aggregation
* Conditional logic
* Subqueries
* Real-world business data analysis

---

# 📮 **8. Author**
Tonny
