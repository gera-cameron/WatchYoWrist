/*
	Kyle Brost
	Cameron Gera
	CIS4301
	Project
	
	We are working in MySQL for this project (MySQL does not support assertions or
	 checks)

	We've taken a slightly different approach to the traditional online store
		model - instead of selling individual products, we've instead opted to sell
		monthly subscription services, watch bands in particular.  As seen in
		'Product', there are three levels and four term lenghts for each.  Order
		quantity shouldn't exceed 1 typically, but it is allowed to.

	Our online store sells watch band subscriptions, where each level mails a
		different manufacturer's watch band monthly.
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
| 10000 | 2015-11-20 11:18:26 |       20000 |    40000 |    1 |        1 | 2015-11-20 11:18:26 | 0000-00-00 00:00:00 |
| 10001 | 2015-11-20 11:18:26 |       20003 |    40001 |    1 |        4 | 2015-11-20 11:18:26 | 0000-00-00 00:00:00 |
| 10002 | 2015-11-20 11:18:26 |       20007 |    40002 |    1 |        2 | 2015-11-20 11:18:26 | 0000-00-00 00:00:00 |
| 10003 | 2015-11-20 11:18:27 |       20010 |    40003 |    1 |        3 | 2015-11-20 11:18:27 | 0000-00-00 00:00:00 |
+-------+---------------------+-------------+----------+------+----------+---------------------+---------------------+

-- Product --
+-------+----------+-------+-------+-----------------+--------+----------+---------------------+---------------------+
| id    | name     | price | stock | description     | active | supplier | createdAt           | updatedAt           |
+-------+----------+-------+-------+-----------------+--------+----------+---------------------+---------------------+
| 20000 | Basic 1  |     5 |    99 | 1 month basic   |      1 |    30000 | 2015-11-20 11:18:20 | 2015-11-20 11:18:26 |
| 20001 | Basic 2  |    14 |   100 | 3 month basic   |      1 |    30000 | 2015-11-20 11:18:20 | 0000-00-00 00:00:00 |
| 20002 | Basic 3  |    28 |   100 | 6 month basic   |      1 |    30000 | 2015-11-20 11:18:20 | 0000-00-00 00:00:00 |
| 20003 | Basic 4  |    55 |    96 | 12 month basic  |      1 |    30000 | 2015-11-20 11:18:20 | 2015-11-20 11:18:26 |
| 20004 | Silver 1 |    10 |    50 | 1 month silver  |      1 |    30001 | 2015-11-20 11:18:20 | 0000-00-00 00:00:00 |
| 20005 | Silver 2 |    28 |    50 | 3 month silver  |      1 |    30001 | 2015-11-20 11:18:20 | 0000-00-00 00:00:00 |
| 20006 | Silver 3 |    50 |    50 | 6 month silver  |      1 |    30001 | 2015-11-20 11:18:20 | 0000-00-00 00:00:00 |
| 20007 | Silver 4 |    99 |    48 | 12 month silver |      1 |    30001 | 2015-11-20 11:18:20 | 2015-11-20 11:18:26 |
| 20008 | Gold 1   |    20 |    25 | 1 month gold    |      1 |    30002 | 2015-11-20 11:18:20 | 0000-00-00 00:00:00 |
| 20009 | Gold 2   |    58 |    25 | 3 month gold    |      1 |    30002 | 2015-11-20 11:18:20 | 0000-00-00 00:00:00 |
| 20010 | Gold 3   |   110 |    22 | 6 month gold    |      1 |    30002 | 2015-11-20 11:18:20 | 2015-11-20 11:18:27 |
| 20011 | Gold 4   |   210 |    25 | 12 month gold   |      1 |    30002 | 2015-11-20 11:18:21 | 0000-00-00 00:00:00 |
+-------+----------+-------+-------+-----------------+--------+----------+---------------------+---------------------+

-- Supplier --
+-------+---------+---------------------+---------------------+
| id    | name    | createdAt           | updatedAt           |
+-------+---------+---------------------+---------------------+
| 30000 | Apple   | 2015-11-20 11:17:42 | 0000-00-00 00:00:00 |
| 30001 | Samsung | 2015-11-20 11:17:42 | 0000-00-00 00:00:00 |
| 30002 | Fossil  | 2015-11-20 11:17:43 | 0000-00-00 00:00:00 |
+-------+---------+---------------------+---------------------+

-- User --
+-------+-------------+-------------------+-------------------+--------------------+----------+---------------------+---------------------+
| id    | address     | name              | password          | email              | is_staff | createdAt           | updatedAt           |
+-------+-------------+-------------------+-------------------+--------------------+----------+---------------------+---------------------+
| 40000 | 123 Main St | Kyle Brost        | mypassword        | broskj@email.com   |        1 | 2015-11-20 11:17:37 | 0000-00-00 00:00:00 |
| 40001 | 456 1st Ave | Cameron Gera      | hispassword       | gerac@email.com    |        1 | 2015-11-20 11:17:37 | 0000-00-00 00:00:00 |
| 40002 | 789 2nd Ln  | John Doe          | johndoe123        | doejohn@email.com  |        0 | 2015-11-20 11:17:37 | 0000-00-00 00:00:00 |
| 40003 | 234 3rd Ave | Jane Doe          | password123       | doejane@email.com  |        0 | 2015-11-20 11:17:37 | 0000-00-00 00:00:00 |
| 40004 | 567 4th St  | George Washington | washington456     | gwash@email.com    |        0 | 2015-11-20 11:17:37 | 0000-00-00 00:00:00 |
| 40005 | 953 9th Rd  | Teddy Roosevelt   | teddyteddy2       | teddyr@email.com   |        0 | 2015-11-20 11:17:37 | 0000-00-00 00:00:00 |
| 40006 | 815 7th St  | Bill Clinton      | lewinskylessthan3 | bclinton@email.com |        0 | 2015-11-20 11:17:38 | 0000-00-00 00:00:00 |
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
	quantity INT,
	createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updatedAt timestamp ON UPDATE CURRENT_TIMESTAMP,
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
	createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updatedAt timestamp ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

# supplier table
CREATE TABLE Supplier (
	id INT NOT NULL AUTO_INCREMENT,
	name CHAR(20),
	createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updatedAt timestamp ON UPDATE CURRENT_TIMESTAMP,
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
	createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updatedAt timestamp ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

# Table alterations that are required
ALTER TABLE AnOrder AUTO_INCREMENT = 10000;
ALTER TABLE Product AUTO_INCREMENT = 20000;
ALTER TABLE Supplier AUTO_INCREMENT = 30000;
ALTER TABLE User AUTO_INCREMENT = 40000;

-- add initial data --
/*
# contains orders placed
INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20000, 40000, TRUE, 1);
INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20003, 40001, TRUE, 4);
INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20007, 40002, TRUE, 2);
INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20010, 40003, TRUE, 3);

# contains all products offered
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Basic 1', 5.00, 100, '1 month basic', TRUE, 30000);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Basic 2', 14.00, 100, '3 month basic', TRUE, 30000);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Basic 3', 28.00, 100, '6 month basic', TRUE, 30000);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Basic 4', 55.00, 100, '12 month basic', TRUE, 30000);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Silver 1', 10.00, 50, '1 month silver', TRUE, 30001);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Silver 2', 28.00, 50, '3 month silver', TRUE, 30001);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Silver 3', 50.00, 50, '6 month silver', TRUE, 30001);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Silver 4', 99.00, 50, '12 month silver', TRUE, 30001);
INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Gold 1', 20.00, 25, '1 month gold', TRUE, 30002);
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

DELIMITER //

/*
	prevent negative quantity
	prevent quantity > stock
	prevent ordering inactive product (stock = 0)
*/

CREATE TRIGGER beforeNewOrder
BEFORE INSERT ON AnOrder
FOR EACH ROW BEGIN
	IF(NEW.quantity) <= 0 THEN
		SIGNAL SQLSTATE '22003' SET message_text = "ERROR: INVALID QUANTITY";
	END IF;
	IF(NEW.quantity) > (
		SELECT stock
		FROM Product
		WHERE NEW.cur_product = id
	) THEN
		SIGNAL SQLSTATE '22003' SET message_text = "ERROR: QUANTITY > STOCK";
	END IF;
	IF (SELECT active
		FROM Product
		WHERE NEW.cur_product = id) = FALSE
		THEN
			SIGNAL SQLSTATE '22000' SET message_text = "ERROR: INACTIVE PRODUCT";
	END IF;
END;
//

/*
	decrease stock by quantity on order
	change active to false on stock = 0
*/
CREATE TRIGGER newOrderTrigger
AFTER INSERT ON AnOrder
FOR EACH ROW BEGIN
	UPDATE Product
	SET stock = stock - NEW.quantity
	WHERE NEW.cur_product = id
	AND active = TRUE;
	UPDATE Product
	SET active = FALSE
	WHERE stock = 0 AND active = TRUE;
END;
//

DELIMITER ;
