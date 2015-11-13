/*
	Kyle Brost
	Cameron Gera
	CIS4301
	Project
	We are working in MySQL for this project.
*/

-- create tables --

/*
	+-------------+
	| 	TABLES		|		>>	* = PRIMARY KEY
	+-------------+
	|		AnOrder		|		->	id*, date_bought, paid, quantity
	|		Product		|		->	id*, name, price, stock, description, active
	|		Supplier	|		->	id*, name
	|		User			|		->	id*, address, name, password, email, is_Staff
	+-------------+

	+-------------+
	|  RELATIONS	|
	+-------------+
	|		Contains	|		->	product_id, order_id, quantity
	|		Orders		|		->	user_id, order_id
	|		Supplies	|		->	product_id, supplier_id
	+-------------+
*/

# order table
CREATE TABLE AnOrder (
	id CHAR(20),
	date_bought CHAR(10),
	paid BOOLEAN,
	quantity INT,
	PRIMARY KEY (id)
);

# product table
CREATE TABLE Product (
	id CHAR(20),
	name CHAR(20),
	price REAL,
	stock INT,
	description CHAR(100),
	active BOOLEAN,
	PRIMARY KEY (id)
);

# supplier table
CREATE TABLE Supplier (
	id CHAR(20),
	name CHAR(20),
	PRIMARY KEY (id)
);

# user table
CREATE TABLE User (
	id CHAR(20),
	address CHAR(20),
	name CHAR(20),
	password CHAR(20),
	email CHAR(20),
	is_staff BOOLEAN,
	PRIMARY KEY (id)
);

# relation between AnOrder and Product with additional value 'quantity'
CREATE TABLE Contains (
	product_id CHAR(20),
	order_id CHAR(20),
	quantity INT
);

# relation between User and AnOrder
CREATE TABLE Orders (
	user_id CHAR(20),
	order_id CHAR(20)
);

# relation between Product and Supplier
CREATE TABLE Supplies (
	product_id CHAR(20),
	supplier_id CHAR(20)
);

-- add initial data --

INSERT INTO AnOrder VALUES ('orderID1', '11/13/2015', YES, 1);
INSERT INTO AnOrder VALUES ('orderID2', '11/13/2015', YES, 1);
INSERT INTO AnOrder VALUES ('orderID3', '11/13/2015', YES, 1);
INSERT INTO AnOrder VALUES ('orderID4', '11/13/2015', YES, 1);
INSERT INTO AnOrder VALUES ('orderID5', '11/13/2015', YES, 1);

INSERT INTO Product VALUES ('productID1', 'productName1', 5.00, 100, '1 month subscription', YES);
INSERT INTO Product VALUES ('productID2', 'productName2', 9.00, 100, '2 month subscription', YES);
INSERT INTO Product VALUES ('productID3', 'productName3', 14.00, 100, '3 month subscription', YES);
INSERT INTO Product VALUES ('productID4', 'productName4', 28.00, 100, '6 month subscription', YES);
INSERT INTO Product VALUES ('productID5', 'productName5', 55.00, 100, '12 month subscription', YES);
INSERT INTO Product VALUES ('productID6', 'productName6', 20.00, 100, 'Silver upcharge', YES);
INSERT INTO Product VALUES ('productID7', 'productName7', 25.00, 100, 'Gold upcharge', YES);

INSERT INTO Supplier VALUES ('supplierID1', 'Supplier A');
INSERT INTO Supplier VALUES ('supplierID2', 'Supplier B');
INSERT INTO Supplier VALUES ('supplierID3', 'Supplier C');

INSERT INTO User VALUES ('broskj', '123 Main St', 'Kyle Brost', 'mypassword', 'broskj@email.com', YES);
INSERT INTO User VALUES ('gerac', '456 1st Ave', 'Cameron Gera', 'hispassword', 'gera.cameron@gmail.com', YES);
INSERT INTO User VALUES ('userID3', '789 2nd Ln', 'User 3''s name', 'user 3''s password', 'user3@email.com', NO);
INSERT INTO User VALUES ('userID4', '234 3rd Ave', 'User 4''s name', 'user 4''s password', 'user4@email.com', NO);
INSERT INTO User VALUES ('userID5', '567 4th St', 'User 5''s name', 'user 5''s password', 'user5@email.com', NO);
INSERT INTO User VALUES ('userID6', '953 9th Rd', 'User 6''s name', 'user 6''s password', 'user6@email.com', NO);
INSERT INTO User VALUES ('userID7', '815 7th St', 'User 7''s name', 'user 7''s password', 'user7@email.com', NO);

INSERT INTO Contains VALUES ('productID1', 'orderID1', 12);
INSERT INTO Contains VALUES ('productID1', 'orderID1', 12);
INSERT INTO Contains VALUES ('productID1', 'orderID1', 12);
INSERT INTO Contains VALUES ('productID1', 'orderID1', 12);
INSERT INTO Contains VALUES ('productID1', 'orderID1', 12);
INSERT INTO Contains VALUES ('productID1', 'orderID1', 12);
INSERT INTO Contains VALUES ('productID1', 'orderID1', 12);

INSERT INTO Orders VALUES ('userID3', 'orderID1');
INSERT INTO Orders VALUES ('userID3', 'orderID1');
INSERT INTO Orders VALUES ('userID4', 'orderID2');
INSERT INTO Orders VALUES ('userID5', 'orderID3');
INSERT INTO Orders VALUES ('userID5', 'orderID3');
INSERT INTO Orders VALUES ('userID6', 'orderID4');
INSERT INTO Orders VALUES ('userID7', 'orderID5');

INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
