
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
