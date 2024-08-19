-- 19/08/2024

-- 1. LIST ENAME, JOB, ANNUAL SAL, DEPTNO, DNAME WHO EARN 30000 PER YEAR AND WHO ARE NOT CLERKS.

SELECT 
    e1.ename,
    e1.job,
    (e1.sal * 12) sal,
    e1.deptno,
    dept.deptname
FROM
    emp e1
        INNER JOIN
    dept ON (e1.deptno = dept.deptno)
WHERE
    e1.sal = 3000
        AND e1.job NOT IN ('Clerk');
        
-- 2. LIST OUT THE ALL EMPLOYEES BY NAME AND EMPLOYEE NUMBER ALONG WITH THEIR MANAGER'S NAME AND EMPLOYEE NUMBER.

SELECT 
    e1.ename emp_name,
    e1.empno emp_no,
    m1.ename mgr_name,
    m1.empno mgr_no
FROM
    emp e1
        JOIN
    emp m1 ON (e1.mgr = m1.empno);
    
-- 3. DISPLAY ENAME,DNAME EVEN IF THERE NO EMPLOYEES WORKING IN A PARTICULAR DEPARTMENT.

SELECT 
    e1.ename, d1.deptname
FROM
    emp e1
        RIGHT JOIN
    dept d1 ON (e1.deptno = d1.deptno);

-- 4. DISPLAY THE DEPARTMENT NAME ALONG WITH TOTAL SALARY IN EACH DEPARTMENT.

SELECT 
    d1.deptno, d1.deptname, SUM(e1.sal)
FROM
    emp e1
        RIGHT JOIN
    dept d1 ON (e1.deptno = d1.deptno)
GROUP BY d1.deptno;

-- 5. DISPLAY EMPLOYEE NAME AND DEPARTMENT NAME FOR EACH EMPLOYEE.

SELECT 
    e1.ename, d1.deptname
FROM
    emp e1
        INNER JOIN
    dept d1 ON (e1.deptno = d1.deptno);

-- 6. DISPLAY LOCATION NAME OF THE EMPLOYEE WHO EARN COMMISSION.

SELECT 
    d1.loc, e1.comm
FROM
    emp e1
        INNER JOIN
    dept d1 ON (e1.deptno = d1.deptno)
WHERE
    e1.comm IS NOT NULL;

-- 7. DISPLAY DEPT NAME OF THE EMPLOYEE WHO EARN MIN SALARY AND HAVE NO REPORTING MANAGER.
SELECT 
    d1.deptname, MIN(e1.sal)
FROM
    emp e1
        INNER JOIN
    dept d1 ON (e1.deptno = d1.deptno)
WHERE
    e1.mgr IS NULL;


-- 8. DISPLAY DEPT NAME,LOC OF ALL THE EMPLOYEES WHO ARE REPORTING TO SMITH.

SELECT 
    d1.deptname, d1.loc
FROM
    dept d1
        INNER JOIN
    emp e1 ON e1.deptno = d1.deptno
WHERE
    empno = (SELECT 
            mgr
        FROM
            emp
        WHERE
            ename = 'Smith');
 
 -- 9. LIST ALL THE DEPT NAME AND LOCATION OF ALL THE SALESMAN MANAGER'S MANAGER.
SELECT 
    d1.deptname, d1.loc
FROM
    dept d1
        INNER JOIN
    emp e1 ON d1.deptno = e1.deptno
WHERE
    e1.empno IN (SELECT 
            mgr
        FROM
            emp
        WHERE
            empno IN (SELECT 
                    mgr
                FROM
                    emp
                WHERE
                    job = 'Salesman'));

-- 10. LIST EMPLOYEES WHO ARE WORKING IN RESEARCH DEPT AND THEY ARE MANAGER.
SELECT 
    e1.ename
FROM
    emp e1
        INNER JOIN
    dept d1 ON e1.deptno = d1.deptno
WHERE
    d1.deptname = 'Research'
        AND e1.job = 'manager';

-- 11. DISPLAY THE NUMBER OF EMPLOYEES WHO ARE GETTING SALARY LESS THAN THE BLAKE'S MANAGER.

SELECT 
    COUNT(e1.ename)
FROM
    emp e1
WHERE
    e1.sal < (SELECT 
            sal
        FROM
            emp
        WHERE
            empno = (SELECT 
                    mgr
                FROM
                    emp
                WHERE
                    ename = 'Blake'));

-- 12. LIST THE EMPLOYEE DEPTNAME AND LOCATION OF ALL THE EMPLOYEES WHO ARE ANALYST AND ARE REPORTING TO BLAKE.

SELECT 
    e1.empno, d1.deptname, d1.loc
FROM
    emp e1
        INNER JOIN
    dept d1 ON e1.deptno = d1.deptno
WHERE
    e1.job = 'Analyst'
        AND e1.mgr = (SELECT 
            empno
        FROM
            emp
        WHERE
            ename = 'Blake');

-- 13. DISPLAY THE EMPLOYEE NAMES,HIREDATE,COMM OF FORD'S MANAGER.

SELECT 
    e1.ename, e1.hiredate, e1.comm
FROM
    emp e1
WHERE
    empno = (SELECT 
            mgr
        FROM
            emp
        WHERE
            ename = 'Ford');

-- 14. DISPLAY ENAME, DNAME OF ALL THE EMPLOYEES WHOSE SALARY IS LESS THAN AVG SAL OF DEPT 30.

SELECT 
    e1.ename, d1.deptname
FROM
    emp e1
        INNER JOIN
    dept d1 ON (e1.deptno = d1.deptno)
        AND e1.sal < (SELECT 
            AVG(sal)
        FROM
            emp
        WHERE
            deptno = 30);

-- 15. DISPLAY ENAME,DNAME AND LOC OF ALL THE EMPLOYEES WHO ARE WORKING FOR JONES.

SELECT 
    e1.ename, d1.deptname, d1.loc
FROM
    emp e1
        INNER JOIN
    dept d1 ON (e1.deptno = d1.deptno)
        AND e1.mgr = (SELECT 
            empno
        FROM
            emp
        WHERE
            ename = 'Jones');
    
-- 16. DISPLAY ENAME,DNAME OF ALL THE EMPLOYEES WHOSE NAME STARTS WITH S.

SELECT 
    e1.ename, d1.deptname
FROM
    emp e1
        INNER JOIN
    dept d1 ON (e1.deptno = d1.deptno)
        AND e1.ename LIKE 'S%';

-- 17. LIST THE DNAME WHO ARE NOT HAVING ANY EMPLOYEE IN IT.

SELECT 
    d1.deptname
FROM
    dept d1
        LEFT JOIN
    emp e1 ON (d1.deptno = e1.deptno)
WHERE
    e1.empno IS NULL;
    
-- 18. DISPLAY THE EMPLOYEE WHO ARE GETTING SAME COMMISSION.

SELECT 
    e1.empno, e1.ename, e1.comm
FROM
    emp e1
        JOIN
    emp e2 ON e1.comm = e2.comm
WHERE
    e1.comm IS NOT NULL
        AND e1.empno != e2.empno
ORDER BY e1.comm;

-- 19. DISPLAY ALL THE DEPT NAMES IRRESPECTIVE OF ANY EMPLOYEE WORKING IN IT OR NOT AND IF AN EMPLOYEE IS WORKING DISPLAY HIS NAME.

SELECT 
    d1.deptname, e1.ename
FROM
    dept d1
        LEFT JOIN
    emp e1 ON d1.deptno = e1.deptno;

-- 20. WRITE A QUERY TO DISPLAY EMPLOYEE NAME, JOB, DNAME, LOCATION OF ALL EMPLOYEES WHO ARE WORKING AS ACTUAL MANAGERS AND WORKS AT CHICAGO.

SELECT 
    e1.ename, e1.job, d1.deptname, d1.loc
FROM
    emp e1
        JOIN
    dept d1 ON e1.deptno = d1.deptno
WHERE
    e1.job = 'Manager'
        AND d1.loc = 'Chicago';

-- 21. LIST THE DEPARTMENT NAMES IN WHICH THE EMPLOYEES ARE HIRED BETWEEN 1ST OF JAN 1981 AND 31ST DEC 1982 WITH SALARY MORE THAN 1800.

SELECT DISTINCT
    d1.deptname
FROM
    emp e1
        JOIN
    dept d1 ON e1.deptno = d1.deptno
WHERE
    e1.hiredate BETWEEN '1981-01-01' AND '1982-12-31'
        AND e1.sal > 1800;

-- 22. DISPLAY 2ND LEAST SALARY FROM EMPLOYEE TABLE.

SELECT 
    MIN(sal)
FROM
    emp
WHERE
    sal > (SELECT 
            MIN(sal)
        FROM
            emp);

-- 23. LIST THE EMPLOYEES WHOSE ANNUAL SALARY IS GREATER THAN 1500 AND WHO ARE JOINED BEFORE 1982 ONLY.

SELECT 
    ename, sal * 12, hiredate
FROM
    emp
WHERE
    (sal * 12) > 1500
        AND hiredate < '1982-01-01';

-- 24. DISPLAY DNAME, LOC, DEPTNO OF EMPLOYEES WHO HAS SAME REPORTING MANAGER.

SELECT 
    d1.deptname, d1.loc, e1.deptno
FROM
    emp e1
        JOIN
    dept d1 ON e1.deptno = d1.deptno
WHERE
    e1.mgr IS NOT NULL
GROUP BY e1.mgr , d1.deptname , d1.loc , e1.deptno
HAVING COUNT(e1.empno) > 1;

-- 25. DISPLAY EMPLOYEE NAME ALONG WITH THEIR MANAGER NAME.

SELECT 
    e1.ename, e2.ename
FROM
    emp e1
        LEFT JOIN
    emp e2 ON e1.mgr = e2.empno;

-- 26. DISPLAY EMPLOYEE NAME AND HIS DEPT NAME FOR THE EMPLOYEES WHOSE NAME STARTS WITH ‘S’.

SELECT 
    e1.ename, 
    d1.deptname
FROM 
    emp e1
JOIN 
    dept d1 ON e1.deptno = d1.deptno
WHERE 
    e1.ename LIKE 'S%';

-- 27. DISPLAY EMPLOYEES WHO ARE GETTING SAME SALARY.

SELECT 
    e1.ename, 
    e2.ename, 
    e1.sal
FROM 
    emp e1
JOIN 
    emp e2 ON e1.sal = e2.sal AND e1.empno != e2.empno
ORDER BY 
    e1.sal;

-- 12/08/2024

-- Orders Table

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);

INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity) VALUES
(1, 101, 201, '2024-01-15', 5),
(2, 102, 202, '2024-02-17', 3),
(3, 103, 201, '2024-03-22', 2),
(4, 101, 203, '2024-04-05', 1),
(5, 104, 202, '2024-05-12', 4);



-- Customers Table

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Customers (customer_id, customer_name, city) VALUES
(101, 'Alice', 'New York'),
(102, 'Bob', 'Los Angeles'),
(103, 'Charlie', 'Chicago'),
(104, 'David', 'Houston');



-- Products Table

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO Products (product_id, product_name, price) VALUES
(201, 'Laptop', 1200.00),
(202, 'Smartphone', 800.00),
(203, 'Tablet', 500.00);



-- 1. Inner Join with Three Tables

SELECT o.order_id, c.customer_name, p.product_name, o.quantity, o.order_date
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Products p ON o.product_id = p.product_id;



-- 2. Total Quantity Ordered by Each Customer

SELECT c.customer_name, SUM(o.quantity) AS total_quantity
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name;



-- 3. Find Products with Total Quantity Ordered Greater Than 4

SELECT p.product_name, SUM(o.quantity) AS total_quantity_ordered
FROM Orders o
INNER JOIN Products p ON o.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(o.quantity) > 4;



-- 4. List Cities with More Than 1 Customer and Their Total Orders

SELECT c.city, COUNT(DISTINCT c.customer_id) AS num_customers, COUNT(o.order_id) AS total_orders
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING COUNT(DISTINCT c.customer_id) > 1;


-- 10/08/2024

-- 9. WAQTD number of employees hired before ‘ALLEN’ in ‘RESEARCH’ department using joins.

SELECT 
    COUNT(emp.ename)
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.hiredate < (SELECT 
            hiredate
        FROM
            emp
        WHERE
            ename = 'ALLEN')
        AND dept.deptname = 'RESEARCH';


-- 10. WAQTD maximum SAL given to the employees working in same designation as that of ‘BLAKE’ in ‘DALLAS’.

SELECT 
    MAX(emp.sal)
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.job = (SELECT 
            job
        FROM
            emp
        WHERE
            ename = 'BLAKE')
        AND dept.loc = 'DALLAS';


-- 11. WAQTD ENAME, HIREDATE & DNAME of employees hired in the month of ‘FEB’ & his DNAME must have second character as ‘A’.

SELECT 
    emp.ename, emp.hiredate, dept.deptname
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
        AND (emp.hiredate LIKE '%FEB%')
        AND (dept.deptname LIKE '_A%')
 
-- 12. WAQTD ENAME earning more than ‘MILLER’ in ‘NEW YORK’ using both Sub-query & joins.

SELECT 
    emp.ename
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.sal > (SELECT 
            sal
        FROM
            emp
        WHERE
            ename = 'MILLER')
        AND dept.deptno = (SELECT 
            deptno
        FROM
            dept
        WHERE
            loc = 'NEW YORK')E & DNAME of employee who is having exactly 4 characters in his name & his DNAME should have 2 consecutive 'CC'.

SELECT 
    emp.ename, dept.deptname
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.ename LIKE '____'
        AND dept.deptname LIKE '%CC%';

-- 13. WAQTD DNAME, ENAME & LOC of employees hired before 1981 in ‘DALLAS’.

SELECT 
    dept.deptname, emp.ename, dept.loc
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
          emp.hiredate < '01-Jan-1981'
        AND dept.loc = 'DALLAS';

-- 14. WAQTD ENAME, JOB, LOC of employees working in same designation as that of ‘JONES’ in ‘CHICAGO’.

SELECT 
    emp.ename, emp.job, dept.loc
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    job = (SELECT 
            job
        FROM
            emp
        WHERE
            ename = 'JONES')
        AND dept.loc = 'CHICAGO';


-- 15. WAQTD ENAME, LOC of employees who is searching same SAL as that of ‘SCOTT‘ in ‘DALLAS’ & he was hired in the month of ‘DEC’.

SELECT 
    emp.ename, dept.loc
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    sal = (SELECT 
            sal
        FROM
            emp
        WHERE
            ename = 'SCOTT')
        AND dept.loc = 'DALLAS'
        AND emp.hiredate LIKE '%-Dec-%'
        AND emp.ename != 'SCOTT';

-- 16. WAQTD ENAME, DNAME of employees whose designation ends with string ‘MAN’ & his name must have 2 consecutive ‘LL’.

SELECT 
    emp.ename, dept.deptname
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.job LIKE '%MAN'
        AND emp.ename LIKE '%LL%';

-- 17. WAQTD ENAME, DEPTNO & DNAME of employees working in same designation as that of ‘SMITH’ in ‘NEW YORK’.

SELECT 
    emp.ename, dept.deptno, dept.deptname
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.job = (SELECT 
            job
        FROM
            emp
        WHERE
            ename = 'SMITH')
        AND dept.loc = 'NEW YORK';
        
-- 18. WAQTD ENAME & DNAME of employees hired after 1980 into ‘RESEARCH’ department & working as an ‘ANALYST’.        

SELECT 
    emp.ename, dept.deptname
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    hiredate > '31-Dec-1980'
        AND dept.deptname = 'RESEARCH'
        AND emp.job = 'ANALYST';

SELECT 
    emp.ename, dept.deptname
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    (emp.hiredate LIKE '%-1981'
       OR emp.hiredate LIKE '%-1982'
       OR emp.hiredate LIKE '%-1983')
        AND dept.deptname = 'RESEARCH'
        AND emp.job = 'ANALYST';
        
-- 19. WAQTD ENAME, SAL, LOC of employees whose SAL ends with 50 in ‘CHICAGO’ & his name must start with ‘M’ & ends with ‘N’.

SELECT 
    emp.ename, emp.sal, dept.loc
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.sal LIKE '%50'
        AND dept.loc = 'CHICAGO'
        AND emp.ename LIKE 'M%N';

-- 20. WAQTD ENAME, DNAME of employees earning less than ‘JAMES’ & must be hired in the year 1980 in ‘DALLAS’.

SELECT 
    emp.ename, dept.deptname
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.sal < (SELECT 
            sal
        FROM
            emp
        WHERE
            ename = 'JAMES')
        AND emp.hiredate LIKE '%1980'
        AND dept.loc = 'DALLAS';

-- 21. WAQTD ENAME & DEPTNO & DNAME of employees working as ‘SALESMAN’ or ‘MANAGER’ in DEPTNO 20 or 30 & he must be earning more than ‘WARD’ in ‘SALES’ or ‘RESEARCH’ department & he must get commission.

SELECT 
    emp.ename, dept.deptno, dept.deptname
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    job IN ('SALESMAN' , 'MANAGER')
        AND dept.deptno IN (20 , 30)
        AND emp.sal > (SELECT 
            sal
        FROM
            emp
        WHERE
            ename = 'WARD')
        AND dept.deptname IN ('SALES' , 'RESEARCH')
        AND emp.comm IS NOT NULL;

-- 22. WAQTD ENAME of the employees & their LOC of all the employees.

SELECT 
    emp.ename, dept.loc
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno);
    
-- 23. WAQTD DNAME & SAL for all the employee working in ‘ACCOUNTING‘ department.

SELECT 
    dept.deptname, emp.sal
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    dept.deptname = 'ACCOUNTING';
    
-- 24. WAQTD DNAME & ANNUALSAL for all employees whose SAL is more than Rs.2340.

SELECT 
    dept.deptname, (emp.sal * 12)
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
	sal > 2340;
    
    
-- 25. WAQTD ENAME & DNAME for employees having character ‘A’ in their DNAME.

SELECT 
    emp.ename, dept.deptname
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    dept.deptname LIKE '%A%';

-- 26. WAQTD ENAME & DNAME for all the employees working as ‘SALESMAN’.

SELECT 
    emp.ename, dept.deptname
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.job = "SALESMAN";
    
-- 27. WAQTD ENNAME, DNAME & JOB for all the employees whose JOB & DNAME starts with character ‘S’.

SELECT 
    emp.ename, dept.deptname, emp.job
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.job LIKE 'S%'
        AND dept.deptname LIKE 'S%';
        
-- 28. WAQTD ENAME, DNAME & MGR for employees reporting to 7839.

SELECT 
    emp.ename, dept.deptname, emp.mgr
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE 
    emp.mgr = 7839;
    
-- 29. WAQTD ENAME, DNAME & HIREDATE for employees hired after 83 into ‘ACCOUNTING’ or ‘RESEARCH’ department.

SELECT 
    emp.ename, dept.deptname, emp.hiredate
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.hiredate > '31-Dec-1983'
        AND dept.deptname IN ('ACCOUNTING' , 'RESEARCH');

SELECT 
    emp.ename, dept.deptname, emp.hiredate
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
     (emp.hiredate LIKE '%-1984'
       OR emp.hiredate LIKE '%-1985'
       OR emp.hiredate LIKE '%-1986' OR emp.hiredate LIKE '%-1987')
        AND dept.deptname IN ('ACCOUNTING' , 'RESEARCH');

-- 30. WAQTD ENAME, DNAME, COMMISSION & DEPTNO of the employees who are getting COMM in DEPTNO 10 or 30.

SELECT 
    emp.ename, dept.deptname, emp.comm, dept.deptno
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.comm IS NOT NULL
        AND dept.deptno IN (10 , 30);
        
-- 31. WAQTD DNAME & EMPNO for all the employees whose EMPNO are (7839, 7902) & are working in LOC = ‘NEW YORK’.

SELECT 
    emp.empno, dept.deptname, emp.comm, dept.deptno
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    emp.empno IN (7839 , 7902)
        AND dept.loc = 'NEW YORK';
        
-- 32. WAQTD ENAME & DNAME who are earning more than ‘SMITH’.

SELECT 
    emp.ename, dept.deptname
FROM
    emp
        INNER JOIN
    dept ON (emp.deptno = dept.deptno)
WHERE
    sal > (SELECT 
            sal
        FROM
            emp
        WHERE
            ename = 'SMITH');
