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
	order_id CHAR(20),
	product_id CHAR(20),
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

# contains orders placed
INSERT INTO AnOrder VALUES ('orderID1', '11/13/2015', TRUE, 1);
INSERT INTO AnOrder VALUES ('orderID2', '11/13/2015', TRUE, 1);
INSERT INTO AnOrder VALUES ('orderID3', '11/13/2015', TRUE, 1);
INSERT INTO AnOrder VALUES ('orderID4', '11/13/2015', TRUE, 1);

# contains all products offered
INSERT INTO Product VALUES ('productID1', 'Basic 1', 5.00, 100, '1 month basic', TRUE);
INSERT INTO Product VALUES ('productID2', 'Basic 2', 14.00, 100, '3 month basic', TRUE);
INSERT INTO Product VALUES ('productID3', 'Basic 3', 28.00, 100, '6 month basic', TRUE);
INSERT INTO Product VALUES ('productID4', 'Basic 4', 55.00, 100, '12 month basic', TRUE);
INSERT INTO Product VALUES ('productID5', 'Silver 1', 10.00, 50, '1 month silver', TRUE);
INSERT INTO Product VALUES ('productID6', 'Silver 2', 28.00, 50, '3 month silver', TRUE);
INSERT INTO Product VALUES ('productID7', 'Silver 3', 50.00, 50, '6 month silver', TRUE);
INSERT INTO Product VALUES ('productID8', 'Silver 4', 99.00, 50, '12 month silver', TRUE);
INSERT INTO Product VALUES ('productID9', 'Gold 1', 20.00, 25, '1 month gold', TRUE);
INSERT INTO Product VALUES ('productID10', 'Gold 2', 58.00, 25, '3 month gold', TRUE);
INSERT INTO Product VALUES ('productID11', 'Gold 3', 110.00, 25, '6 month gold', TRUE);
INSERT INTO Product VALUES ('productID12', 'Gold 4', 210.00, 25, '12 month gold', TRUE);

# contains all suppliers
INSERT INTO Supplier VALUES ('supplierID1', 'Supplier A');
INSERT INTO Supplier VALUES ('supplierID2', 'Supplier B');
INSERT INTO Supplier VALUES ('supplierID3', 'Supplier C');

# contains all user information
INSERT INTO User VALUES ('broskj', '123 Main St', 'Kyle Brost', 'mypassword', 'broskj@email.com', TRUE);
INSERT INTO User VALUES ('gerac', '456 1st Ave', 'Cameron Gera', 'hispassword', 'gerac@email.com', TRUE);
INSERT INTO User VALUES ('doejohn', '789 2nd Ln', 'John Doe', 'johndoe123', 'doejohn@email.com', FALSE);
INSERT INTO User VALUES ('doejane', '234 3rd Ave', 'Jane Doe', 'password123', 'doejane@email.com', FALSE);
INSERT INTO User VALUES ('gwash', '567 4th St', 'George Washington', 'washington456', 'gwash@email.com', FALSE);
INSERT INTO User VALUES ('teddyr', '953 9th Rd', 'Teddy Roosevelt', 'teddyteddy2', 'teddyr@email.com', FALSE);
INSERT INTO User VALUES ('bclinton', '815 7th St', 'Bill Clinton', 'lewinskylessthan3', 'bclinton@email.com', FALSE);

# relationship between orders and products -> what orders contain what products and a quantity
INSERT INTO Contains VALUES ('orderID1', 'productID4', 1);
INSERT INTO Contains VALUES ('orderID2', 'productID12', 1);
INSERT INTO Contains VALUES ('orderID3', 'productID1', 1);
INSERT INTO Contains VALUES ('orderID4', 'productID6', 1);

# relationship between users and orders -> what users makes which order
INSERT INTO Orders VALUES ('doejohn', 'orderID1');
INSERT INTO Orders VALUES ('doejane', 'orderID2');
INSERT INTO Orders VALUES ('gwash', 'orderID3');
INSERT INTO Orders VALUES ('teddyr', 'orderID4');

# relationship between product and supplier -> what product comes from which supplier
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID2', 'supplierID1');
INSERT INTO Supplies VALUES ('productID3', 'supplierID1');
INSERT INTO Supplies VALUES ('productID4', 'supplierID1');
INSERT INTO Supplies VALUES ('productID5', 'supplierID2');
INSERT INTO Supplies VALUES ('productID6', 'supplierID2');
INSERT INTO Supplies VALUES ('productID7', 'supplierID2');
INSERT INTO Supplies VALUES ('productID8', 'supplierID2');
INSERT INTO Supplies VALUES ('productID9', 'supplierID3');
INSERT INTO Supplies VALUES ('productID10', 'supplierID3');
INSERT INTO Supplies VALUES ('productID11', 'supplierID3');
INSERT INTO Supplies VALUES ('productID12', 'supplierID3');
