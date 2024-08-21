# Mongoose ODM (Object Data Modeling.)
# Sequilize ORM (Object Relational Mapping)


# SQL (Structured Query Language)
## Data Definition Language (DDL)
### CREATE TABLE
- Creates a new table in the database.
```
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);
```

### ALTER TABLE
- Modifies an existing table structure.
```
-- Add a new column
ALTER TABLE users ADD COLUMN age INT;

-- Modify an existing column
ALTER TABLE users MODIFY COLUMN name VARCHAR(100);

-- Drop a column
ALTER TABLE users DROP COLUMN age;
```

### DROP TABLE
- Deletes an entire table along with all of its data.
```
DROP TABLE users;
```

### TRUNCATE TABLE
- Removes all rows from a table without deleting the table itself.
```
TRUNCATE TABLE users;
```

### RENAME TABLE
- Renames a table.
```
RENAME TABLE users TO customers;
```


## Data Manipulation Language (DML)
### INSERT INTO
- Adds new rows of data to a table.
```
INSERT INTO users (id, name, email) VALUES (1, 'John Doe', 'john@example.com');
```
### UPDATE
- Modifies existing data in a table.
```
UPDATE users SET email = 'john.doe@example.com' WHERE id = 1;
```

### DELETE
- Removes one or more rows from a table.
```
DELETE FROM users WHERE id = 1;
```

## Data Query Language (DQL)
### SELECT
- This is part of DML but often considered separately due to its querying nature.
```
SELECT name FROM users WHERE age > 30;
```

## Data Control Language (DCL)
### GRANT
- Gives a user or role specific privileges.
```
GRANT SELECT, INSERT ON users TO someuser;
```

### REVOKE
- Removes specific privileges from a user or role.
```
REVOKE INSERT ON users FROM someuser;
```

## Transaction Control Language (TCL)
### COMMIT
- Saves all changes made in the current transaction.
```
COMMIT;
```

### ROLLBACK
- Reverts all changes made in the current transaction.
```
ROLLBACK;
```

### SAVEPOINT
- Sets a point within a transaction to which you can later roll back.
```
SAVEPOINT sp1;
```
### RELEASE SAVEPOINT
- Removes a savepoint.
```
RELEASE SAVEPOINT sp1;
```

### SET TRANSACTION
- Sets characteristics for the current transaction.
```
SET TRANSACTION READ ONLY;
```

# Filtering and Sorting
## WHERE
- Filters records based on a condition.
```
SELECT column1 FROM table_name WHERE condition;
```
## ORDER BY
- Sorts the result set.
```
SELECT column1 FROM table_name ORDER BY column1 ASC|DESC;
```

## DISTINCT
- Removes duplicate values.
```
SELECT DISTINCT column1 FROM table_name;
```

## BETWEEN
- Filters the result set within a certain range.
```
SELECT column1 FROM table_name WHERE column1 BETWEEN value1 AND value2;
```

## LIKE
- Searches for a specified pattern.
```
SELECT column1 FROM table_name WHERE column1 LIKE 'pattern';
```
### _ - single unknown char
### % - wildcard


## IN / NOT IN
- Matches any value within a list.
```
SELECT column1 FROM table_name WHERE column1 IN (value1, value2);

SELECT column1 FROM table_name WHERE column1 NOT IN (value1, value2);

```

## IS NULL / IS NOT NULL: Checks for NULL values.
```
SELECT column1 FROM table_name WHERE column1 IS NULL;
```

# Aggregate Functions
## COUNT()
- Counts the number of rows.
```
SELECT COUNT(column1) FROM table_name;
```

## SUM()
- Calculates the sum of a numeric column.
```
SELECT SUM(column1) FROM table_name;
```

## AVG()
- Calculates the average value of a numeric column.
```
SELECT AVG(column1) FROM table_name;
```

## MIN()
- Retrieves the smallest value.
```
SELECT MIN(column1) FROM table_name;
```

## MAX()
- Retrieves the largest value.
```
SELECT MAX(column1) FROM table_name;
```

# Joins
## INNER JOIN
- Returns rows when there is a match in both tables.
```
SELECT columns FROM table1 INNER JOIN table2 ON table1.column = table2.column;
```

## LEFT JOIN / LEFT OUTER JOIN
- Returns all rows from the left table and matched rows from the right table.
```
SELECT columns FROM table1 LEFT JOIN table2 ON table1.column = table2.column;
```
## RIGHT JOIN / RIGHT OUTER JOIN
- Returns all rows from the right table and matched rows from the left table.
```
SELECT columns FROM table1 RIGHT JOIN table2 ON table1.column = table2.column;
```

## FULL JOIN / FULL OUTER JOIN
- Returns rows when there is a match in one of the tables.
```
SELECT columns FROM table1 FULL JOIN table2 ON table1.column = table2.column;
```

## CROSS JOIN
- Returns the Cartesian product of the two tables.
```
SELECT columns FROM table1 CROSS JOIN table2;
```

# Grouping and Aggregation
## GROUP BY
- Groups rows that have the same values into summary rows.
```
SELECT column1, COUNT(*) FROM table_name GROUP BY column1;
```

## HAVING
- Filters groups based on a condition (used with GROUP BY).
```
SELECT column1, COUNT(*) FROM table_name GROUP BY column1 HAVING COUNT(*) > 1;
```

# Subqueries
- A query nested inside another query.
```
SELECT column1 FROM table_name WHERE column2 IN (SELECT column2 FROM another_table);
```

# `UNION` and `UNION ALL`

## UNION
- Combines the results of two or more SELECT statements and removes duplicate rows from the result set.
- When you need a distinct list of results.
- Generally slower than UNION ALL because it has to perform an additional step to remove duplicates.
```
SELECT employee_name FROM employees
UNION
SELECT manager_name FROM managers;
```

## UNION ALL
- Combines the results of two or more SELECT statements and includes all duplicate rows.
- When you need all rows from the combined result sets, including duplicates.
-  Generally faster than UNION because it does not have to check for and remove duplicates.
```
SELECT employee_name FROM employees
UNION ALL
SELECT manager_name FROM managers;
```

# Constraints
## NOT NULL
- Ensures that a column cannot have NULL values.
- Guarantees that a column always contains a value.
```
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
```
## UNIQUE
- Ensures that all values in a column (or a combination of columns) are unique across the table.
- Prevents duplicate values in a column or columns.
```
CREATE TABLE employees (
    id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```
## DEFAULT
- Provides a default value for a column if no value is specified during record insertion.
- Automatically assigns a default value to a column when no explicit value is provided.
```
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    status VARCHAR(20) DEFAULT 'Available'
);
```
## AUTO_INCREMENT
- Automatically generates a unique value for a column, typically used for primary keys.
- Ensures that each new row receives a unique identifier.
```
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);
```
## CHECK
- Ensures that values in a column meet a specific condition or set of conditions.
- Enforces domain integrity by restricting the values that can be entered into a column.
```
CREATE TABLE employees (
    id INT PRIMARY KEY,
    salary DECIMAL(10, 2) CHECK (salary > 0)
);
```


# Primary Key
- Ensures that each row in a table has a unique and non-null identifier.
- Typically used to uniquely identify a record.
```
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
```

# Composite Primary Key
- A composite primary key in a database is a primary key that consists of two or more columns, used together to uniquely identify each row in a table. 
- This is typically used when a single column is not sufficient to ensure row uniqueness.
- Combination of multiple column shoud be unique.
```
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id)
);
```

# Foreign Key
- Ensures referential integrity by linking a column (or a set of columns) in one table to the primary key of another table.
- Maintains relationships between tables and ensures that a value in the foreign key column must match a value in the primary key column of the referenced table.
```
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```


# Views
- Creates a virtual table based on a SELECT query.
```
-- Create a view
CREATE VIEW user_emails AS
SELECT name, email FROM users; 

-- Delete a view
DROP VIEW user_emails;
```

# Transcation
## BEGIN TRANSACTION
- Starts a transaction.
```
BEGIN TRANSACTION;
```

## COMMIT
- Saves all changes made during the current transaction.
```
COMMIT;
```

## ROLLBACK
- Reverts changes made during the current transaction.
```
ROLLBACK;
```

# Indexing
- Indexing in a database is a technique used to improve the speed and efficiency of data retrieval operations. An index is a data structure that provides a fast way to look up records based on the values of one or more columns in a table. 
- Just like an index in a book helps you quickly find the page where a topic is discussed, a database index allows the database engine to quickly find rows in a table without scanning the entire table.

## Clustered Index
- A clustered index sorts and stores the data rows of the table based on the key values.
- It defines the physical order of data in the table. There can be only one clustered index per table because the data rows themselves can be sorted in only one order.
### Structure:
- The data rows are stored in a B-tree structure with the leaf nodes containing the actual data pages.

## Non-Clustered Index
- A non-clustered index creates a separate structure to maintain the index and does not affect the order of the data rows in the table.
- It contains pointers to the actual data rows.
### Structure
- The non-clustered index also uses a B-tree structure, but the leaf nodes contain pointers (row identifiers) to the actual data pages rather than the data itself.

## Primary Index
- Automatically created when a primary key is defined.
- Ensures that the values in the primary key column are unique and not null.
```
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
```

## Unique Index
- Ensures that the values in the indexed column(s) are unique across the table.
```
CREATE UNIQUE INDEX idx_unique_email ON users(email);
```

## Non-Unique Index
- Does not enforce uniqueness; used to speed up retrieval based on a column's value.
```
CREATE INDEX idx_name ON users(name);
```
## Composite Index
- An index on multiple columns.
- B-tree (data structure) type off index
```
CREATE INDEX idx_name_email ON users(name, email);
```

## Full-Text Index
- Used for full-text searches, enabling efficient searching of text within large text fields.
```
CREATE FULLTEXT INDEX idx_fulltext_bio ON users(bio);
```

## Spatial Index
- Used for indexing spatial data types, such as geometrical data.
```
CREATE SPATIAL INDEX idx_location ON locations(geometry);
```

## Deleting the index
```
DROP INDEX idx_name; // delete index
```

# Functions
- A function is a stored program that can be called to perform a specific task. It usually returns a single value and can be used within SQL statements.
- Functions return a value to the caller
- Functions can be used within SELECT, WHERE, and other SQL statements.
```
CREATE FUNCTION function_name (parameters)
RETURNS return_type
AS
BEGIN
    -- Function body
    RETURN value;
END;
```

# Stored Procedures
- A stored procedure is a collection of SQL statements that perform a specific task. Unlike functions, stored procedures do not return a value but can return multiple result sets or output parameters.
- Procedures do not return a single value but can output multiple values through output parameters or result sets.
- Procedures can include complex logic, loops, and transactions.
```
CREATE PROCEDURE updateEmployeeSalary(IN emp_id INT, IN new_salary DECIMAL(10, 2))
AS
BEGIN
    UPDATE employees
    SET salary = new_salary
    WHERE id = emp_id;
END;
```


# Triggers
- A trigger is a special type of stored procedure that automatically executes in response to certain events on a table, such as `INSERT`, `UPDATE`, or `DELETE`. Triggers help maintain data integrity and enforce business rules.
- Triggers run automatically in response to specific events.
- Triggers can prevent or alter the changes made to the data in the table.
```
CREATE TRIGGER afterEmployeeInsert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (operation, emp_id, operation_time)
    VALUES ('INSERT', NEW.id, NOW());
END;
```

# Sharding
- Sharding is a database architecture pattern used to improve the performance and scalability of a database by distributing data across multiple servers or instances. Each server or instance is called a "shard," and together they form a shard cluster.

# Rank and Dense Rank
- `Order By` clause always required in rank queries.
## Rank 
- `RANK()`: Assigns a unique rank to each row within a partition of a result set. Rows with the same values receive the same rank, and the next rank is incremented by the number of duplicates. This means there may be gaps in the ranking.
## Dense Rank
- `DENSE_RANK()`: Similar to RANK(), but without gaps. Rows with the same values receive the same rank, and the next rank is incremented by 1.
### Simple Using Order By 
```
SELECT 
    id,
    name,
    position,
    salary,
    RANK() OVER (ORDER BY salary DESC) as salary_rank,
	DENSE_RANK() OVER (ORDER BY salary DESC) as salary_dense_rank
FROM 
    employees;

-- output
4	Michael Brown	    Male	    Data Scientist	        95000.00	1	1
2	Jane Doe	        emale	    Product Manager	        85000.00	2	2
6	David Wilson	    Male	    Sales Manager	        80000.00	3	3
9	Linda Thomas	    Female  	Financial Analyst	    78000.00	4	4
10	Robert Martinez	    Male	    Business Analyst	    77000.00	5	5
1	John Smith	        Male    	Software Engineer	    75000.00	6	6
11	Diya Sharma	        Female	    Software Engineer	    75000.00	6	6
3	Emily Johnson	    Female  	UX Designer	            72000.00	8	7
8	James Anderson	    Male	    HR Coordinator	        70000.00	9	8
5	Jessica Davis	    Female	    Marketing Specialist	68000.00	10	9
7	Sarah Miller	    Female	    Content Writer	        62000.00	11	10
```
### Simple Using Order By with partition by (To get the employ rank by partitionaning gender top 2nd in male and female like that)
```
SELECT 
    id,
    name,
    gender,
    position,
    salary,
    RANK() OVER (PARTITION BY gender ORDER BY salary DESC) as salary_rank,
	DENSE_RANK() OVER (PARTITION BY gender ORDER BY salary DESC) as salary_dense_rank
FROM 
    employees;

-- output:
2	Jane Doe	        Female	    Product Manager	        85000.00	1	1
9	Linda Thomas	    Female	    Financial Analyst	    78000.00	2	2
11	Diya Sharma	        Female	    Software Engineer	    75000.00	3	3
3	Emily Johnson	    Female	    UX Designer	            72000.00	4	4
5	Jessica Davis	    Female	    Marketing Specialist	68000.00	5	5
7	Sarah Miller	    Female	    Content Writer	        62000.00	6	6
4	Michael Brown	    Male	    Data Scientist	        95000.00	1	1
6	David Wilson	    Male	    Sales Manager	        80000.00	2	2
10	Robert Martinez 	Male	    Business Analyst	    77000.00	3	3
1	John Smith	        Male	    Software Engineer	    75000.00	4	4
8	James Anderson	    Male	    HR Coordinator	        70000.00	5	5
```
### Find the Top 3 salary
```
WITH result_rank AS (SELECT 
    id,
    name,
    gender,
    position,
    salary,
	DENSE_RANK() OVER ( ORDER BY salary DESC) AS salary_dense_rank
FROM 
    employees) SELECT  * FROM result_rank WHERE salary_dense_rank = 3;

-- output
6	David Wilson	Male	Sales Manager	80000.00	3
```

```
SELECT * FROM (SELECT 
    empno,
    ename,
    sal,
    deptno,
	DENSE_RANK() OVER (ORDER BY sal DESC) as salary_dense_rank
FROM 
    emp) table1 where salary_dense_rank=2;
```


# Cursor
- A cursor in a database is a database object used to retrieve, manipulate, and navigate through a result set row by row. Cursors are typically used in procedural programming and are essential for scenarios where row-by-row processing of data is necessary, which can't be efficiently achieved with set-based SQL operations alone.

# Cascading 
- `cascade` refers to the automatic propagation of changes from one table to related tables when a specific action is performed. 
- This concept is primarily used in the context of foreign key constraints in relational databases. 
- Cascading actions ensure data integrity and consistency across related tables.

# ACID properties

## Atomicity
- Atomicity ensures that a transaction is treated as a single, indivisible unit of work. Either all operations within the transaction are executed, or none of them are. This prevents partial updates that could lead to data inconsistencies.
## Consistency
- Consistency ensures that a transaction transforms the database from one valid state to another. The database must always adhere to predefined rules, such as constraints, triggers, and cascades.
## Isolation
-  Isolation ensures that transactions are executed independently of one another. Changes made by one transaction are not visible to other transactions until the transaction is completed (committed). This prevents transactions from interfering with each other.
## Durability
- Durability ensures that once a transaction has been committed, its effects are permanently recorded in the database, even in the case of a system crash or failure. Committed data survives permanent failures and system restarts.


# Normalization
- Normalization is a process in database design that aims to minimize redundancy and dependency by organizing fields and table relationships in a database.
- Dividing single table containing duplicate data into multiple table is Normalization.

## First Normal Form (1NF) (one to many) 
- The table must have atomic (indivisible) values, and each column should contain only one value per row.
- Eliminate repeating groups and ensure data is stored in a tabular format.
```
CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE employee_emails (
    employee_id INT,
    email VARCHAR(100),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
```
## Second Normal Form (2NF) (one to many + dependancy on other table) 
- The table must be in 1NF, and all non-key attributes must be fully functionally dependent on the primary key.
- Eliminate partial dependencies (where a non-key attribute is dependent on part of a composite key).
```
CREATE TABLE orders (
    order_id INT,
    product_id INT,
    quantity INT
);

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);
```
## Third Normal Form (3NF)
- The table must be in 2NF, and all attributes must be directly dependent on the primary key.
- Eliminate transitive dependencies (where a non-key attribute depends on another non-key attribute).
```
CREATE TABLE employees (
    employee_id INT,
    department_id INT
);

CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(100)
);
```

# Differece between Primary key and Unique Key
```
Primary key                                  Unique Key

UNIUQE + NOT NULL                           UNIUQE
Single per table                            Can be multiple
Composite Primary Key                       Nullability
Indexing (Clustered)                        Indexing (Non-Clustered)
Identification

```
# update all the male to female and female to male 
```
userdata 
id      gender
1       male
2       female
3       male

UPDATE userdata
SET gender = CASE
    WHEN gender = 'male' THEN 'female'
    WHEN gender = 'female' THEN 'male'
    ELSE gender
END;
```

# Alter table add gender column and give gender to all rows 
```
ALTER TABLE employees
ADD gender VARCHAR(10);


UPDATE employees
SET gender = CASE id
    WHEN 1 THEN 'Male'
    WHEN 2 THEN 'Female'
    WHEN 3 THEN 'Female'
    WHEN 4 THEN 'Male'
    WHEN 5 THEN 'Female'
    WHEN 6 THEN 'Male'
    WHEN 7 THEN 'Female'
    WHEN 8 THEN 'Male'
    WHEN 9 THEN 'Female'
    WHEN 10 THEN 'Male'
        WHEN 11 THEN 'Female'
    ELSE 'Unknown'
END;
```

# Remove duplicate records from table
## Using `DELETE` with a `Subquery`
- For each group, this selects the smallest employee_id. This ensures that the smallest employee_id for each unique combination is retained.
```
DELETE FROM employees
WHERE id NOT IN (
    SELECT MIN(id)
    FROM employees
    GROUP BY first_name, last_name, email
);

-- Subquery Check
 SELECT MIN(id) FROM employees GROUP BY name, salary;
-- Subquery output:
1
2
3
4
5
6
7
8
9
10
11
```
## Using Temporary Table
- Another method involves creating a temporary table to hold unique records and then replacing the original table with this temporary table.
```
-- Create a temporary table with distinct records
CREATE TABLE employees_temp AS
SELECT DISTINCT employee_id, first_name, last_name, email
FROM employees;

-- Drop the original table
DROP TABLE employees;

-- Rename the temporary table to the original table name
ALTER TABLE employees_temp RENAME TO employees;
```

# Employe Manager Self join
```
SELECT 
    e1.employee_name AS employee,
    e2.employee_name AS manager
FROM 
    employees e1
LEFT JOIN 
    employees e2
ON 
    e1.manager_id = e2.employee_id;
```


# SUDO COLUMENS