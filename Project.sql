/*
	Kyle Brost
	Cameron Gera
	CIS4301
	Project
	We are working in MySQL for this project
*/

/*
+-----------------------+
| Tables_in_OnlineStore |
+-----------------------+
| AnOrder               |
| Product               |
| Supplier              |
| User                  |
+-----------------------+

-- AnOrder --
+-------+---------------------+-------------+----------+------+----------+---------------------+---------------------+
| id    | date_bought         | cur_product | cur_user | paid | quantity | createdAt           | updatedAt           |
+-------+---------------------+-------------+----------+------+----------+---------------------+---------------------+
| 10000 | 2015-11-19 11:56:11 |       20000 |    40000 |    1 |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 10001 | 2015-11-19 11:56:11 |       20003 |    40001 |    1 |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 10002 | 2015-11-19 11:56:11 |       20007 |    40002 |    1 |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
| 10003 | 2015-11-19 11:56:11 |       20010 |    40003 |    1 |        1 | 0000-00-00 00:00:00 | 0000-00-00 00:00:00 |
+-------+---------------------+-------------+----------+------+----------+---------------------+---------------------+

-- Product --
+-------+----------+-------+-------+-----------------+--------+----------+---------------------+---------------------+
| id    | name     | price | stock | description     | active | supplier | createdAt           | updatedAt           |
+-------+----------+-------+-------+-----------------+--------+----------+---------------------+---------------------+
| 20000 | Basic 1  |     5 |   100 | 1 month basic   |      1 |    30000 | 2015-11-19 11:56:04 | 0000-00-00 00:00:00 |
| 20001 | Basic 2  |    14 |   100 | 3 month basic   |      1 |    30000 | 2015-11-19 11:56:04 | 0000-00-00 00:00:00 |
| 20002 | Basic 3  |    28 |   100 | 6 month basic   |      1 |    30000 | 2015-11-19 11:56:04 | 0000-00-00 00:00:00 |
| 20003 | Basic 4  |    55 |   100 | 12 month basic  |      1 |    30000 | 2015-11-19 11:56:04 | 0000-00-00 00:00:00 |
| 20004 | Silver 1 |    10 |    50 | 1 month silver  |      1 |    30001 | 2015-11-19 11:56:04 | 0000-00-00 00:00:00 |
| 20005 | Silver 2 |    28 |    50 | 3 month silver  |      1 |    30001 | 2015-11-19 11:56:04 | 0000-00-00 00:00:00 |
| 20006 | Silver 3 |    50 |    50 | 6 month silver  |      1 |    30001 | 2015-11-19 11:56:04 | 0000-00-00 00:00:00 |
| 20007 | Silver 4 |    99 |    50 | 12 month silver |      1 |    30001 | 2015-11-19 11:56:04 | 0000-00-00 00:00:00 |
| 20008 | Gold 2   |    58 |    25 | 3 month gold    |      1 |    30002 | 2015-11-19 11:56:04 | 0000-00-00 00:00:00 |
| 20009 | Gold 3   |   110 |    25 | 6 month gold    |      1 |    30002 | 2015-11-19 11:56:04 | 0000-00-00 00:00:00 |
| 20010 | Gold 4   |   210 |    25 | 12 month gold   |      1 |    30002 | 2015-11-19 11:56:06 | 0000-00-00 00:00:00 |
+-------+----------+-------+-------+-----------------+--------+----------+---------------------+---------------------+

-- Supplier --
+-------+---------+---------------------+---------------------+
| id    | name    | createdAt           | updatedAt           |
+-------+---------+---------------------+---------------------+
| 30000 | Apple   | 2015-11-19 11:55:52 | 0000-00-00 00:00:00 |
| 30001 | Samsung | 2015-11-19 11:55:52 | 0000-00-00 00:00:00 |
| 30002 | Fossil  | 2015-11-19 11:55:54 | 0000-00-00 00:00:00 |
+-------+---------+---------------------+---------------------+

-- User --
+-------+-------------+-------------------+-------------------+--------------------+----------+---------------------+---------------------+
| id    | address     | name              | password          | email              | is_staff | createdAt           | updatedAt           |
+-------+-------------+-------------------+-------------------+--------------------+----------+---------------------+---------------------+
| 40000 | 123 Main St | Kyle Brost        | mypassword        | broskj@email.com   |        1 | 2015-11-19 12:15:06 | 0000-00-00 00:00:00 |
| 40001 | 456 1st Ave | Cameron Gera      | hispassword       | gerac@email.com    |        1 | 2015-11-19 12:15:06 | 0000-00-00 00:00:00 |
| 40002 | 789 2nd Ln  | John Doe          | johndoe123        | doejohn@email.com  |        0 | 2015-11-19 12:15:06 | 0000-00-00 00:00:00 |
| 40003 | 234 3rd Ave | Jane Doe          | password123       | doejane@email.com  |        0 | 2015-11-19 12:15:06 | 0000-00-00 00:00:00 |
| 40004 | 567 4th St  | George Washington | washington456     | gwash@email.com    |        0 | 2015-11-19 12:15:06 | 0000-00-00 00:00:00 |
| 40005 | 953 9th Rd  | Teddy Roosevelt   | teddyteddy2       | teddyr@email.com   |        0 | 2015-11-19 12:15:06 | 0000-00-00 00:00:00 |
| 40006 | 815 7th St  | Bill Clinton      | lewinskylessthan3 | bclinton@email.com |        0 | 2015-11-19 12:15:06 | 0000-00-00 00:00:00 |
+-------+-------------+-------------------+-------------------+--------------------+----------+---------------------+---------------------+
*/

-- create tables --

# order table
CREATE TABLE AnOrder (
	id INT NOT NULL AUTO_INCREMENT,
	date_bought timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	cur_product INT REFERENCES Product.id,
	cur_user INT REFERENCES User.id,
	paid BOOLEAN,
	quantity INT CHECK (quantity <= (
		SELECT quantity
		FROM Product
		WHERE product = Product.id)),
	PRIMARY KEY (id)
);

# product table
CREATE TABLE Product (
	id INT NOT NULL AUTO_INCREMENT,
	name CHAR(20),
	price REAL,
	stock INT,
	description CHAR(100),
	active BOOLEAN,
	supplier INT REFERENCES Supplier.id,
	PRIMARY KEY (id)
);

# supplier table
CREATE TABLE Supplier (
	id INT NOT NULL AUTO_INCREMENT,
	name CHAR(20),
	PRIMARY KEY (id)
);

# user table
CREATE TABLE User (
	id INT NOT NULL AUTO_INCREMENT,
	address CHAR(20),
	name CHAR(20),
	password CHAR(20),
	email CHAR(20) UNIQUE,
	is_staff BOOLEAN,
	PRIMARY KEY (id)
);

# 
ALTER TABLE AnOrder AUTO_INCREMENT = 10000;
ALTER TABLE Product AUTO_INCREMENT = 20000;
ALTER TABLE Supplier AUTO_INCREMENT = 30000;
ALTER TABLE User AUTO_INCREMENT = 40000;

# update tables for sails
alter table AnOrder add createdAt timestamp;
alter table Product add createdAt timestamp;
alter table Supplier add createdAt timestamp;
alter table User add createdAt timestamp;

alter table AnOrder add updatedAt timestamp;
alter table Product add updatedAt timestamp;
alter table Supplier add updatedAt timestamp;
alter table User add updatedAt timestamp;

-- add initial data --
/*
# contains orders placed
INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20000, 40000, TRUE, 1);
INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20001, 40003, TRUE, 1);
INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20002, 40002, TRUE, 1);
INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20003, 40001, TRUE, 1);

# contains all products offered
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Basic 1', 5.00, 100, '1 month basic', TRUE, 30000);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Basic 2', 14.00, 100, '3 month basic', TRUE, 30000);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Basic 3', 28.00, 100, '6 month basic', TRUE, 30000);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Basic 4', 55.00, 100, '12 month basic', TRUE, 30000);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Silver 1', 10.00, 50, '1 month silver', TRUE, 30001);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Silver 2', 28.00, 50, '3 month silver', TRUE, 30001);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Silver 3', 50.00, 50, '6 month silver', TRUE, 30001);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Silver 4', 99.00, 50, '12 month silver', TRUE, 30001);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Gold 1', 20.00, 25, '1 month gold', TRUE), 30002;
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Gold 2', 58.00, 25, '3 month gold', TRUE, 30002);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Gold 3', 110.00, 25, '6 month gold', TRUE, 30002);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Gold 4', 210.00, 25, '12 month gold', TRUE, 30002);

# contains all suppliers
INSERT INTO Supplier (name) VALUES ('Apple');
INSERT INTO Supplier (name) VALUES ('Samsung');
INSERT INTO Supplier (name) VALUES ('Fossil');

# contains all user information
INSERT INTO User (address, name, password, email, is_staff) VALUES ('123 Main St', 'Kyle Brost', 'mypassword', 'broskj@email.com', TRUE);
INSERT INTO User (address, name, password, email, is_staff) VALUES ('456 1st Ave', 'Cameron Gera', 'hispassword', 'gerac@email.com', TRUE);
INSERT INTO User (address, name, password, email, is_staff) VALUES ('789 2nd Ln', 'John Doe', 'johndoe123', 'doejohn@email.com', FALSE);
INSERT INTO User (address, name, password, email, is_staff) VALUES ('234 3rd Ave', 'Jane Doe', 'password123', 'doejane@email.com', FALSE);
INSERT INTO User (address, name, password, email, is_staff) VALUES ('567 4th St', 'George Washington', 'washington456', 'gwash@email.com', FALSE);
INSERT INTO User (address, name, password, email, is_staff) VALUES ('953 9th Rd', 'Teddy Roosevelt', 'teddyteddy2', 'teddyr@email.com', FALSE);
INSERT INTO User (address, name, password, email, is_staff) VALUES ('815 7th St', 'Bill Clinton', 'lewinskylessthan3', 'bclinton@email.com', FALSE);
*/
