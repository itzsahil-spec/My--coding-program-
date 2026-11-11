-- ============================================================
-- LAB ASSIGNMENT 5: ORACLE SQL SCRIPT
-- ============================================================

-- ============================================================
-- Table Creation & Insert Statements
-- ============================================================

-- Table Creation: Client_Master
CREATE TABLE Client_Master (
    Client_no VARCHAR2(10) CONSTRAINT pk_client_master PRIMARY KEY 
        CONSTRAINT chk_client_no CHECK (Client_no LIKE 'C%'),
    Name VARCHAR2(50) CONSTRAINT nn_client_name NOT NULL 
        CONSTRAINT uk_client_name UNIQUE,
    Address1 VARCHAR2(100),
    State VARCHAR2(50),
    City VARCHAR2(50) CONSTRAINT chk_client_city CHECK (City IN ('Delhi', 'Mumbai', 'Chennai'))
);

-- Table Creation: Products_Master
CREATE TABLE Products_Master (
    Product_no VARCHAR2(10) CONSTRAINT pk_products_master PRIMARY KEY 
        CONSTRAINT chk_product_no CHECK (Product_no LIKE 'P%'),
    Description VARCHAR2(100) CONSTRAINT nn_product_desc NOT NULL 
        CONSTRAINT uk_product_desc UNIQUE,
    Qty_on_hand NUMBER CONSTRAINT chk_product_qty CHECK (Qty_on_hand > 10),
    Sell_price NUMBER CONSTRAINT nn_product_sell NOT NULL,
    Cost_price NUMBER CONSTRAINT nn_product_cost NOT NULL
);

-- Table Creation: Sales_Order
CREATE TABLE Sales_Order (
    S_order_no VARCHAR2(10) CONSTRAINT pk_sales_order PRIMARY KEY 
        CONSTRAINT chk_s_order_no CHECK (S_order_no LIKE 'O%'),
    S_order_date DATE,
    Client_no VARCHAR2(10) CONSTRAINT fk_so_client REFERENCES Client_Master(Client_no),
    Salesman_no VARCHAR2(10) CONSTRAINT chk_salesman_no CHECK (Salesman_no LIKE 'S%'),
    Product_no VARCHAR2(10) CONSTRAINT fk_so_product REFERENCES Products_Master(Product_no)
);

-- Insert Data: Client_Master
INSERT INTO Client_Master (Client_no, Name, Address1, State, City) VALUES ('C01', 'Ivaan', 'Church Rd', 'Maharashtra', 'Mumbai');
INSERT INTO Client_Master (Client_no, Name, Address1, State, City) VALUES ('C02', 'Vandana', 'St.Mary Rd', 'Tamil Nadu', 'Chennai');
INSERT INTO Client_Master (Client_no, Name, Address1, State, City) VALUES ('C03', 'Pramada', 'Mall Rd', 'Maharashtra', 'Mumbai');
INSERT INTO Client_Master (Client_no, Name, Address1, State, City) VALUES ('C04', 'Basu', 'Church Rd', 'Maharashtra', 'Mumbai');
INSERT INTO Client_Master (Client_no, Name, Address1, State, City) VALUES ('C05', 'Ravi', 'Chandni', NULL, 'Delhi');
INSERT INTO Client_Master (Client_no, Name, Address1, State, City) VALUES ('C06', 'Rukmini', 'Mall Rd', 'Maharashtra', 'Mumbai');

-- Insert Data: Products_Master
INSERT INTO Products_Master (Product_no, Description, Qty_on_hand, Sell_price, Cost_price) VALUES ('P01', '1.44 Floppies', 100, 50, 40);
INSERT INTO Products_Master (Product_no, Description, Qty_on_hand, Sell_price, Cost_price) VALUES ('P02', 'Monitors', 20, 12000, 11280);
INSERT INTO Products_Master (Product_no, Description, Qty_on_hand, Sell_price, Cost_price) VALUES ('P03', 'Mouse', 50, 1050, 1000);
INSERT INTO Products_Master (Product_no, Description, Qty_on_hand, Sell_price, Cost_price) VALUES ('P04', '1.22 floppies', 100, 45, 35);
INSERT INTO Products_Master (Product_no, Description, Qty_on_hand, Sell_price, Cost_price) VALUES ('P05', 'Keyboards', 40, 3150, 3050);
INSERT INTO Products_Master (Product_no, Description, Qty_on_hand, Sell_price, Cost_price) VALUES ('P06', 'Cd drive', 30, 5250, 5100);

-- Insert Data: Sales_Order
INSERT INTO Sales_Order (S_order_no, S_order_date, Client_no, Salesman_no, Product_no) VALUES ('O19001', TO_DATE('12-jan-96', 'DD-MON-YY'), 'C01', 'S01', 'P01');
INSERT INTO Sales_Order (S_order_no, S_order_date, Client_no, Salesman_no, Product_no) VALUES ('O19002', TO_DATE('25-jan-96', 'DD-MON-YY'), 'C02', 'S02', 'P02');
INSERT INTO Sales_Order (S_order_no, S_order_date, Client_no, Salesman_no, Product_no) VALUES ('O19003', TO_DATE('18-feb-96', 'DD-MON-YY'), 'C03', 'S01', 'P03');
INSERT INTO Sales_Order (S_order_no, S_order_date, Client_no, Salesman_no, Product_no) VALUES ('O19004', TO_DATE('03-apr-96', 'DD-MON-YY'), 'C04', 'S03', 'P04');
INSERT INTO Sales_Order (S_order_no, S_order_date, Client_no, Salesman_no, Product_no) VALUES ('O19005', TO_DATE('20-may-96', 'DD-MON-YY'), 'C05', 'S02', 'P05');
INSERT INTO Sales_Order (S_order_no, S_order_date, Client_no, Salesman_no, Product_no) VALUES ('O19006', TO_DATE('24-may-96', 'DD-MON-YY'), 'C06', 'S03', 'P06');


-- ============================================================
-- Assignment Questions Solutions
-- ============================================================

-- Question 1: Add a Not Null constraint on the address1 field of Client_Master table and display the structure of the table.
ALTER TABLE Client_Master MODIFY (Address1 CONSTRAINT nn_client_address1 NOT NULL);
DESC Client_Master;

-- Question 2: Calculate the profit (Sell_price-Cost_price) from the Products_Master table. Name the column as Profit.
SELECT Product_no, Description, (Sell_price - Cost_price) AS Profit 
FROM Products_Master;

-- Question 3: Calculate and display the total cost price (Qty_on_hand * Cost_price) of the stock present in hand. Name the column accordingly.
SELECT Product_no, Description, (Qty_on_hand * Cost_price) AS Total_Cost_Price 
FROM Products_Master;

-- Question 4: Display the client details of all the clients whose name starts with I.
SELECT * FROM Client_Master 
WHERE Name LIKE 'I%';

-- Question 5: Display the client details of all the clients whose name start with R and ends with i.
SELECT * FROM Client_Master 
WHERE Name LIKE 'R%i';

-- Question 6: Display the client details of all the clients whose name contains a in the third and fifth position.
SELECT * FROM Client_Master 
WHERE Name LIKE '__a_a%';

-- Question 7: Display the client details of all the clients whose name contains aa.
SELECT * FROM Client_Master 
WHERE Name LIKE '%aa%';

-- Question 8: Display the client details of all the clients whose name contains exactly four characters.
SELECT * FROM Client_Master 
WHERE Name LIKE '____';

-- Question 9: Display the client details of those clients who have not mentioned state in his/her address.
SELECT * FROM Client_Master 
WHERE State IS NULL;

-- Question 10: Display the order details placed after January, 1996.
SELECT * FROM Sales_Order 
WHERE S_order_date > TO_DATE('31-JAN-1996', 'DD-MON-YYYY');

-- Question 11: Change the s_order_date of client_no 'C01' to 24/07/96, Product_no to 'P02', Salesman_no to 'S02'.
UPDATE Sales_Order 
SET S_order_date = TO_DATE('24/07/96', 'DD/MM/YY'), 
    Product_no = 'P02', 
    Salesman_no = 'S02' 
WHERE Client_no = 'C01';

-- Question 12: Change the city of client_no 'C05' to Kolkata.
-- (Note: Since City has a CHECK constraint restricting values to Delhi, Mumbai, Chennai, we drop/modify the constraint first)
ALTER TABLE Client_Master DROP CONSTRAINT chk_client_city;
ALTER TABLE Client_Master ADD CONSTRAINT chk_client_city CHECK (City IN ('Delhi', 'Mumbai', 'Chennai', 'Kolkata'));

UPDATE Client_Master 
SET City = 'Kolkata' 
WHERE Client_no = 'C05';

-- Question 13: Change the field size of Client_no to 15 in all the tables where the field Client_no is present.
-- (Note: Foreign key constraints must be temporarily dropped to modify referenced primary key column size)
ALTER TABLE Sales_Order DROP CONSTRAINT fk_so_client;

ALTER TABLE Client_Master MODIFY (Client_no VARCHAR2(15));
ALTER TABLE Sales_Order MODIFY (Client_no VARCHAR2(15));

ALTER TABLE Sales_Order ADD CONSTRAINT fk_so_client 
    FOREIGN KEY (Client_no) REFERENCES Client_Master(Client_no);

-- Question 14: Remove the record for Client_no C02 from Client_Master table.
-- First delete child records referencing C02 in Sales_Order to maintain referential integrity
DELETE FROM Sales_Order WHERE Client_no = 'C02';
DELETE FROM Client_Master WHERE Client_no = 'C02';

-- Question 15: Remove those records from Product_Master table for which sell price is between 1000 and 10,000.
-- First delete referencing records in Sales_Order table to prevent foreign key violation
DELETE FROM Sales_Order 
WHERE Product_no IN (
    SELECT Product_no FROM Products_Master 
    WHERE Sell_price BETWEEN 1000 AND 10000
);

DELETE FROM Products_Master 
WHERE Sell_price BETWEEN 1000 AND 10000;

-- Question 16: Create a table of your own with a composite primary key.
CREATE TABLE Student_Course (
    Student_id VARCHAR2(10),
    Course_id VARCHAR2(10),
    Enrollment_date DATE,
    CONSTRAINT pk_student_course PRIMARY KEY (Student_id, Course_id)
);

-- Question 17: Create another table of your own wish, where the composite primary key of problem 16 will act as a foreign key here.
CREATE TABLE Course_Grades (
    Grade_id VARCHAR2(10) CONSTRAINT pk_course_grades PRIMARY KEY,
    Student_id VARCHAR2(10),
    Course_id VARCHAR2(10),
    Grade VARCHAR2(2),
    CONSTRAINT fk_grade_student_course FOREIGN KEY (Student_id, Course_id) 
        REFERENCES Student_Course(Student_id, Course_id)
);