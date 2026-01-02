
# 📘 SQL Hands-on Practice Project

## 📌 Project Overview

This project is a **hands-on SQL practice** focused on understanding core SQL concepts through real queries instead of memorization.
It covers data sorting, joins, functions, conditional logic, and set operations using sample tables.

The goal of this project is to **strengthen SQL fundamentals** and understand how SQL works in real-world scenarios.

---

## 🗂️ Database Used

**Database Name:** `joints`

---

## 📊 Tables Created

### 1️⃣ Orders Table

Stores order-related information.

* `order_id`
* `order_date`
* `amount`
* `customer_id`

### 2️⃣ Customer Table

Stores customer details.

* `customer_id`
* `customer_name`
* `menu`

### 3️⃣ Employee Tables

Two tables created with the same structure for practicing set operations:

* `employee_details1`
* `employee_details2`

---

## 🛠️ SQL Concepts Covered

### 🔹 Data Sorting

* Used `ORDER BY` with:

  * `ASC` (ascending)
  * `DESC` (descending)
* Sorted the **Orders** table based on the `amount`.

---

### 🔹 Joins

Practiced different types of joins between **Customer** and **Orders** tables:

* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`
* `FULL OUTER JOIN`

This helped understand how SQL handles **matching and non-matching records**.

---

### 🔹 Aggregate Functions

Used built-in functions to analyze order data:

* `MIN(amount)`
* `MAX(amount)`
* `AVG(amount)`

---

### 🔹 CASE Statement

Used `CASE` to classify order amounts as:

* Low amount
* Medium amount
* High amount

This helped convert raw data into meaningful insights.

---

### 🔹 User-Defined Functions

* Created a scalar function to multiply a given number by 10.
* Created a table-valued function to fetch orders greater than a given amount.

These functions improved **reusability and clarity** of queries.

---

### 🔹 Set Operations

Using `employee_details1` and `employee_details2`, practiced:

* `UNION`
* `INTERSECT`
* `EXCEPT`

This helped understand how SQL handles:

* Duplicate records
* Common records
* Unmatched records

---

## 🎯 Key Learnings

* Practical SQL projects improve understanding more than theory alone.
* Joins and set operations become clear when working with real data.
* SQL functions and CASE statements are powerful for data analysis.



