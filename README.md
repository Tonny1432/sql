

# 📊 SQL Database Assignment – Salesman, Customer & Orders

## 📌 Project Overview

This project demonstrates **hands-on SQL practice** by creating and managing a relational database using **Salesman, Customer, and Orders** tables.
The goal is to understand **database design, constraints, relationships, and querying real-world data**.

---

## 🛠️ Technologies Used

* **SQL (MS SQL Server compatible)**
* Relational Database Concepts

---

## 📂 Database Structure

### 1️⃣ Salesman Table

Stores salesman details.

* `Salesman_id` (Primary Key)
* `Salesman_Name`
* `Commission`
* `City` (Default: Paris)
* `Age`

### 2️⃣ Customer Table

Stores customer details linked to salesman.

* `Customer_id`
* `Customer_name` (NOT NULL)
* `Purchase_amount`
* `Salesman_id` (Foreign Key)

### 3️⃣ Orders Table

Stores order transactions.

* `Order_id`
* `Customer_id`
* `Salesman_id`
* `Order_date`
* `Amount`

---

## 🔐 Constraints Implemented

* **PRIMARY KEY** on `Salesman_id`
* **FOREIGN KEY** between Customer → Salesman
* **NOT NULL** constraint on `Customer_name`
* **DEFAULT constraint** on `City`
* Ensured **referential integrity** by inserting parent records first

---

## 📊 SQL Operations Covered

✔ Database & table creation
✔ Data insertion
✔ ALTER TABLE operations
✔ PRIMARY & FOREIGN KEY constraints
✔ DEFAULT & NOT NULL constraints
✔ Filtering using `WHERE`, `LIKE`, `BETWEEN`
✔ `INNER JOIN` and `RIGHT JOIN`
✔ `UNION` vs `UNION ALL`
✔ Querying relational data

---

## 🧠 Sample Tasks Performed

* Insert new orders into existing tables
* Retrieve customers with purchase conditions
* Combine salesman IDs using UNION & UNION ALL
* Join multiple tables to fetch business insights
* Use RIGHT JOIN to analyze unmatched records

---

## 📎 File Included

* `Assignment 1 answer.sql` – Complete SQL script with table creation, data insertion, and queries

---

## 🚀 Learning Outcome

This project strengthened my understanding of:

* Relational database design
* Real-world SQL constraints
* Querying structured data efficiently
* Practical use of joins and set operations

---

## 📬 Feedback & Suggestions

I’m actively learning SQL and databases.
Feedback, improvements, and suggestions are always welcome!

---

### ⭐ If you like this project, feel free to star the repository!

---
