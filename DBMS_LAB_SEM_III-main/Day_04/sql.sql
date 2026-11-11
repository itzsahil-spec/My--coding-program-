-- ==========================================
-- LAB ASSIGNMENT 4: ORACLE SQL SCRIPT
-- ==========================================

-- ------------------------------------------
-- Setup: Table Creation & Initial Data
-- ------------------------------------------

CREATE TABLE Customer (
    Cust_id VARCHAR2(10) PRIMARY KEY,
    Fname VARCHAR2(30) NOT NULL,
    Lname VARCHAR2(30) NOT NULL,
    Area VARCHAR2(30),
    Phone VARCHAR2(15)
);

CREATE TABLE Movie (
    Mv_no VARCHAR2(10) PRIMARY KEY,
    Cust_id VARCHAR2(10) REFERENCES Customer(Cust_id),
    Title VARCHAR2(50) NOT NULL,
    Star VARCHAR2(30) NOT NULL,
    Price NUMBER(6, 2) CHECK (Price BETWEEN 100 AND 250)
);

INSERT INTO Customer VALUES ('C001', 'Ivan', 'Ross', 'SA', '6125467');
INSERT INTO Customer VALUES ('C002', 'Vandana', 'Ray', 'SA', '5560379');
INSERT INTO Customer VALUES ('C003', 'Pramada', 'Jauguste', 'DA', '4560389');
INSERT INTO Customer VALUES ('C004', 'Basu', 'Navindi', 'BA', '6125401');
INSERT INTO Customer VALUES ('C005', 'Ravi', 'Shridhar', 'CA', NULL);
INSERT INTO Customer VALUES ('C006', 'Rukmini', 'Aiyer', 'SA', '5125274');

INSERT INTO Movie VALUES ('M101', 'C001', 'Bloody', 'JC', 150);
INSERT INTO Movie VALUES ('M102', 'C002', 'The Firm', 'TC', 200);
INSERT INTO Movie VALUES ('M103', 'C003', 'Pretty Woman', 'MC', 180);
INSERT INTO Movie VALUES ('M104', 'C004', 'Home Alone', 'JC', 120);
INSERT INTO Movie VALUES ('M105', 'C001', 'The Fugitive', 'TC', 160);
INSERT INTO Movie VALUES ('M106', 'C002', 'Coma', 'MC', 110);
INSERT INTO Movie VALUES ('M107', 'C006', 'Dracula', 'JC', 190);
INSERT INTO Movie VALUES ('M108', 'C003', 'Quick Change', 'MC', 170);
INSERT INTO Movie VALUES ('M109', 'C004', 'Gone with the Wind', 'TC', 220);
INSERT INTO Movie VALUES ('M110', 'C006', 'Carry on Doctor', 'JC', 130);

COMMIT;


-- ------------------------------------------
-- Questions & Queries
-- ------------------------------------------

-- Q1. Prove that entity integrity constraint is ensured by both the tables. (2 conditions to be checked)
-- Condition 1: Primary key must be unique (Fails with ORA-00001: unique constraint violated)
INSERT INTO Customer (Cust_id, Fname, Lname, Area, Phone) 
VALUES ('C001', 'John', 'Doe', 'SA', '1234567');

-- Condition 2: Primary key cannot be NULL (Fails with ORA-01400: cannot insert NULL)
INSERT INTO Customer (Cust_id, Fname, Lname, Area, Phone) 
VALUES (NULL, 'Alice', 'Brown', 'SA', '9876543');


-- Q2. Prove that referential integrity constraint is ensured by both the tables.
-- Attempting to insert a foreign key value not present in the parent table (Fails with ORA-02291: parent key not found)
INSERT INTO Movie (Mv_no, Cust_id, Title, Star, Price) 
VALUES ('M999', 'C999', 'Inception', 'TC', 150);


-- Q3. Prove that domain integrity constraint is ensured by the Movie table.
-- Attempting to insert a price outside the range of 100 to 250 (Fails with ORA-02290: check constraint violated)
INSERT INTO Movie (Mv_no, Cust_id, Title, Star, Price) 
VALUES ('M999', 'C001', 'Avatar', 'TC', 300);


-- Q4. Display the movie titles, whose price is greater than 100 but less than 200.
SELECT Title 
FROM Movie 
WHERE Price > 100 AND Price < 200;


-- Q5. Display the cust_id who have seen movies having stars as either JC or TC or MC.
SELECT DISTINCT Cust_id 
FROM Movie 
WHERE Star IN ('JC', 'TC', 'MC');


-- Q6. Display the details of those customers who have an A in their area name.
SELECT * 
FROM Customer 
WHERE UPPER(Area) LIKE '%A%';


-- Q7. Display the movie titles, whose price is within 180 and the movie titles are of exactly 6 characters.
SELECT Title 
FROM Movie 
WHERE Price <= 180 AND LENGTH(Title) = 6;


-- Q8. Display the movie name, their original prices and the prices after 10% increment. Give alias name to the incremented price column.
SELECT Title, Price AS Original_Price, Price * 1.10 AS Incremented_Price 
FROM Movie;


-- Q9. Display all the customer details in the following way: Ivan Ross stays in SA and his phone number is 6125467.
SELECT Fname || ' ' || Lname || ' stays in ' || Area || ' and his phone number is ' || Phone AS Customer_Info 
FROM Customer;


-- Q10. Add a not null constraint to the Lname field in Customer.
ALTER TABLE Customer MODIFY Lname VARCHAR2(30) NOT NULL;


-- Q11. Display the customer name whose phone number is not recorded.
SELECT Fname, Lname 
FROM Customer 
WHERE Phone IS NULL;


-- Q12. Add the phone number according to your own wish for the person mentioned in problem no 7.
UPDATE Customer 
SET Phone = '9830012345' 
WHERE Phone IS NULL;


-- Q13. Display the unique customer id s from movie table.
SELECT DISTINCT Cust_id 
FROM Movie;


-- Q14. Remove the not null constraint from Star column in movie table.
ALTER TABLE Movie MODIFY Star VARCHAR2(30) NULL;


-- Q15. Delete any row from the Customer table. If you cannot delete, then note the error message displayed.
-- Attempting to delete a record referenced in Movie table (Fails with ORA-02292: child record found)
DELETE FROM Customer WHERE Cust_id = 'C001';


-- Q16. Delete any row from the Movie table. If you cannot delete, then note the error message displayed.
DELETE FROM Movie WHERE Mv_no = 'M101';


-- Q17. Drop the Customer table. If you cannot drop, then note the error message displayed.
-- Attempting to drop table referenced by an enabled foreign key (Fails with ORA-02449: unique/primary keys referenced by enabled foreign keys)
DROP TABLE Customer;


-- Q18. Drop the Movie table. If you cannot drop, then note the error message displayed.
DROP TABLE Movie;


-- Q19. Drop the foreign key from Movie table.
-- Note: Replace FK_MOVIE_CUST with the system-generated or user-defined foreign key constraint name
-- Q20. 20.	Drop the foreign key from Movie table.
ALTER TABLE Movie DROP CONSTRAINT <constraint_name>;