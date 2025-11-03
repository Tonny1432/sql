# 🧠 My First Step in Data Science — SQL Basics

This mini-project marks my first hands-on step into **Data Science**, focusing on **SQL fundamentals** using MySQL.

---

## 📘 Overview
I created a database `school` and a table `students`, performed:
- Data insertion and updates  
- Column addition & data type changes  
- Filtering and selecting data  

---

## 💻 SQL Used
```sql
CREATE DATABASE school;
USE school;

CREATE TABLE students(
  student_id TINYINT,
  student_name VARCHAR(20),
  age SMALLINT,
  grade CHAR(1),
  marks DECIMAL(5,2)
);

INSERT INTO students VALUES
(101,'tonny',21,'A',90),
(102,'rebaca',22,'B',80),
(103,'alice',23,'A',90),
(104,'racheal',22,'C',70),
(105,'jhon',22,'C',70);

ALTER TABLE students ADD student_email VARCHAR(50);

SELECT student_name, marks FROM students WHERE marks >= 80;
