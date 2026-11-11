-- DBMS LAB ASSIGNMENT 6 | Oracle SQL
-- Run statements in order. Q29 and Q30 remove constraints/table.

-- Q1: Create EMP table and insert all 11 given records.
CREATE TABLE EMP (
    E_ID NUMBER CONSTRAINT EMP_ID_PK PRIMARY KEY,
    FNAME VARCHAR2(30) NOT NULL,
    LNAME VARCHAR2(30) NOT NULL,
    HIRE_DATE DATE NOT NULL,
    JOB_ID VARCHAR2(20) NOT NULL,
    SAL NUMBER NOT NULL,
    DEPT_ID NUMBER CONSTRAINT EMP_DEPT_CHK CHECK (DEPT_ID >= 10)
);

INSERT INTO EMP VALUES (198, 'Donald', 'Connell', TO_DATE('21-Jun-99','DD-MON-RR','NLS_DATE_LANGUAGE=ENGLISH'), 'SH_CLERK', 2600, 50);
INSERT INTO EMP VALUES (199, 'Douglas', 'Grant', TO_DATE('13-Jan-98','DD-MON-RR','NLS_DATE_LANGUAGE=ENGLISH'), 'SH_CLERK', 3000, 50);
INSERT INTO EMP VALUES (200, 'Jennifer', 'Whalen', TO_DATE('17-Sep-87','DD-MON-RR','NLS_DATE_LANGUAGE=ENGLISH'), 'AD_ASST', 4400, 10);
INSERT INTO EMP VALUES (201, 'Michael', 'Hartstein', TO_DATE('19-Jan-99','DD-MON-RR','NLS_DATE_LANGUAGE=ENGLISH'), 'IT_PROG', 6000, 20);
INSERT INTO EMP VALUES (202, 'Pat', 'Fay', TO_DATE('25-Oct-89','DD-MON-RR','NLS_DATE_LANGUAGE=ENGLISH'), 'AC_MGR', 6500, 20);
INSERT INTO EMP VALUES (203, 'Susan', 'Mavris', TO_DATE('26-Nov-76','DD-MON-RR','NLS_DATE_LANGUAGE=ENGLISH'), 'AD_VP', 7500, 40);
INSERT INTO EMP VALUES (204, 'Hermann', 'Baer', TO_DATE('23-Aug-95','DD-MON-RR','NLS_DATE_LANGUAGE=ENGLISH'), 'AD_PRES', 9500, 90);
INSERT INTO EMP VALUES (205, 'Shelley', 'Higgins', TO_DATE('24-Feb-98','DD-MON-RR','NLS_DATE_LANGUAGE=ENGLISH'), 'AC_MGR', 2300, 60);
INSERT INTO EMP VALUES (206, 'William', 'Gitz', TO_DATE('12-Mar-01','DD-MON-RR','NLS_DATE_LANGUAGE=ENGLISH'), 'IT_PROG', 5000, 60);
INSERT INTO EMP VALUES (100, 'Steven', 'King', TO_DATE('15-Jun-02','DD-MON-RR','NLS_DATE_LANGUAGE=ENGLISH'), 'AD_ASST', 8956, 100);
INSERT INTO EMP VALUES (101, 'Neena', 'Kochar', TO_DATE('10-Jul-03','DD-MON-RR','NLS_DATE_LANGUAGE=ENGLISH'), 'SH_CLERK', 3400, 30);
COMMIT;
SELECT * FROM EMP;

-- Q2: First names in ascending order with alias.
SELECT FNAME AS "Employee Name" FROM EMP ORDER BY FNAME ASC;

-- Q3: First names in descending order with alias.
SELECT FNAME AS "Employee Name" FROM EMP ORDER BY FNAME DESC;

-- Q4: Hire dates in ascending order.
SELECT HIRE_DATE FROM EMP ORDER BY HIRE_DATE ASC;

-- Q5: Names beginning J or M, ordered by surname.
SELECT * FROM EMP WHERE FNAME LIKE 'J%' OR FNAME LIKE 'M%' ORDER BY LNAME ASC;

-- Q6: Overall salary statistics.
SELECT MAX(SAL) AS "Max", MIN(SAL) AS "Min", AVG(SAL) AS "Avg", SUM(SAL) AS "Sum" FROM EMP;

-- Q7: Salary statistics per job.
SELECT JOB_ID, MAX(SAL) AS "Max", MIN(SAL) AS "Min", AVG(SAL) AS "Avg", SUM(SAL) AS "Sum"
FROM EMP GROUP BY JOB_ID;

-- Q8: Number of people per job.
SELECT JOB_ID, COUNT(*) AS "Number of Employees" FROM EMP GROUP BY JOB_ID;

-- Q9: Number of managers (JOB_ID ending in MGR).
SELECT COUNT(*) AS "Number of Managers" FROM EMP WHERE JOB_ID LIKE '%MGR';

-- Q10: Highest minus lowest salary.
SELECT MAX(SAL) - MIN(SAL) AS "Salary Difference" FROM EMP;

-- Q11: Engineer salaries. No ENGINEER job exists in supplied data; IT_PROG used as technical-role proxy.
SELECT MAX(SAL) AS "Maximum Salary", AVG(SAL) AS "Average Salary" FROM EMP WHERE JOB_ID = 'IT_PROG';

-- Q12: First and last alphabetic first name.
SELECT MIN(FNAME) AS "First Employee", MAX(FNAME) AS "Last Employee" FROM EMP;

-- Q13: Earliest and latest hiring dates.
SELECT MIN(HIRE_DATE) AS "First Hire_Date", MAX(HIRE_DATE) AS "Last Hire_Date" FROM EMP;

-- Q14: Clerk salaries (JOB_ID ending in CLERK).
SELECT MAX(SAL) AS "Maximum Salary", AVG(SAL) AS "Average Salary" FROM EMP WHERE JOB_ID LIKE '%CLERK';

-- Q15: Lowest salary per department.
SELECT DEPT_ID, MIN(SAL) AS "Minimum Salary" FROM EMP GROUP BY DEPT_ID;

-- Q16: Departments with minimum salary greater than 3000, descending.
SELECT DEPT_ID, MIN(SAL) AS "Minimum Salary"
FROM EMP GROUP BY DEPT_ID HAVING MIN(SAL) > 3000 ORDER BY MIN(SAL) DESC;

-- Q17: Requested salary sentence.
SELECT FNAME || ' whose designation is ' || JOB_ID || ' gets ' || SAL ||
       ' but wants to earn ' || (3 * SAL) || '.' AS "Employee Details"
FROM EMP;

-- Q18: Comma-separated employee details.
SELECT E_ID || ', ' || FNAME || ', ' || LNAME || ', ' ||
       TO_CHAR(HIRE_DATE, 'DD-Mon-RR', 'NLS_DATE_LANGUAGE=ENGLISH') || ', ' ||
       JOB_ID || ', ' || SAL || ', ' || DEPT_ID AS "Employee Details"
FROM EMP;

-- Q19: Today's date.
SELECT SYSDATE AS TODAY FROM DUAL;

-- Q20: Employee ID, hire day of month, and hire year.
SELECT E_ID, TO_CHAR(HIRE_DATE, 'DD') AS "Hire Day", TO_CHAR(HIRE_DATE, 'YYYY') AS "Hire Year" FROM EMP;

-- Q21: Employee name and date formatted dd-month-yy.
SELECT FNAME || ' ' || LNAME AS "Employee Name",
       TO_CHAR(HIRE_DATE, 'DD-FMMONTH-YY', 'NLS_DATE_LANGUAGE=ENGLISH') AS "Hire Date"
FROM EMP;

-- Q22: Employee ID and month hired.
SELECT E_ID, TO_CHAR(HIRE_DATE, 'FMMONTH', 'NLS_DATE_LANGUAGE=ENGLISH') AS "Hire Month" FROM EMP;

-- Q23: Employee name, ID and dd-mon-yyyy date.
SELECT FNAME || ' ' || LNAME AS "Employee Name", E_ID,
       TO_CHAR(HIRE_DATE, 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH') AS "Hire Date"
FROM EMP;

-- Q24: Employee name, ID and month-dd-yyyy date.
SELECT FNAME || ' ' || LNAME AS "Employee Name", E_ID,
       TO_CHAR(HIRE_DATE, 'FMMONTH-DD-YYYY', 'NLS_DATE_LANGUAGE=ENGLISH') AS "Hire Date"
FROM EMP;

-- Q25: System year spelled out.
SELECT TO_CHAR(SYSDATE, 'YEAR', 'NLS_DATE_LANGUAGE=ENGLISH') AS "Year in Words" FROM DUAL;

-- Q26: 15 days after/before today (TRUNC avoids time-of-day).
SELECT TRUNC(SYSDATE) AS TODAY, TRUNC(SYSDATE) + 15 AS "After 15 Days",
       TRUNC(SYSDATE) - 15 AS "Before 15 Days" FROM DUAL;

-- Q27: Verify domain (CHECK) and entity integrity (PRIMARY KEY) constraints from Q1.
-- Both constraints were created in Q1, so do NOT add them again.
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP' AND CONSTRAINT_NAME IN ('EMP_DEPT_CHK', 'EMP_ID_PK');
-- Optional: test invalid rows individually (both should fail):
-- INSERT INTO EMP VALUES (999, 'Test', 'User', SYSDATE, 'IT_PROG', 1000, 5);
-- INSERT INTO EMP VALUES (198, 'Test', 'User', SYSDATE, 'IT_PROG', 1000, 20);

-- Q28: Drop domain CHECK constraint.
ALTER TABLE EMP DROP CONSTRAINT EMP_DEPT_CHK;

-- Q29: Drop primary key constraint.
ALTER TABLE EMP DROP PRIMARY KEY;

-- Q30: Drop the EMP table. Run LAST: removes the table and its records.
DROP TABLE EMP;
