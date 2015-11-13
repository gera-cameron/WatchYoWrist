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

# contains orders placed
INSERT INTO AnOrder VALUES ('orderID1', '11/13/2015', YES, 1);
INSERT INTO AnOrder VALUES ('orderID2', '11/13/2015', YES, 1);
INSERT INTO AnOrder VALUES ('orderID3', '11/13/2015', YES, 1);
INSERT INTO AnOrder VALUES ('orderID4', '11/13/2015', YES, 1);
INSERT INTO AnOrder VALUES ('orderID5', '11/13/2015', YES, 1);

# contains all products offered
INSERT INTO Product VALUES ('productID1', 'Basic 1', 5.00, 100, '1 month basic', YES);
INSERT INTO Product VALUES ('productID2', 'Basic 2', 14.00, 100, '3 month basic', YES);
INSERT INTO Product VALUES ('productID3', 'Basic 3', 28.00, 100, '6 month basic', YES);
INSERT INTO Product VALUES ('productID4', 'Basic 4', 55.00, 100, '12 month basic', YES);
INSERT INTO Product VALUES ('productID5', 'Silver 1', 10.00, 50, '1 month silver', YES);
INSERT INTO Product VALUES ('productID6', 'Silver 2', 28.00, 50, '3 month silver', YES);
INSERT INTO Product VALUES ('productID7', 'Silver 3', 50.00, 50, '6 month silver', YES);
INSERT INTO Product VALUES ('productID8', 'Silver 4', 99.00, 50, '12 month silver', YES);
INSERT INTO Product VALUES ('productID9', 'Gold 1', 20.00, 25, '1 month gold', YES);
INSERT INTO Product VALUES ('productID10', 'Gold 2', 58.00, 25, '3 month gold', YES);
INSERT INTO Product VALUES ('productID11', 'Gold 3', 110.00, 25, '6 month gold', YES);
INSERT INTO Product VALUES ('productID12', 'Gold 4', 210.00, 25, '12 month gold', YES);

# contains all suppliers
INSERT INTO Supplier VALUES ('supplierID1', 'Supplier A');
INSERT INTO Supplier VALUES ('supplierID2', 'Supplier B');
INSERT INTO Supplier VALUES ('supplierID3', 'Supplier C');

# contains all user information
INSERT INTO User VALUES ('broskj', '123 Main St', 'Kyle Brost', 'mypassword', 'broskj@email.com', YES);
<<<<<<< HEAD
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

=======
INSERT INTO User VALUES ('gerac', '456 1st Ave', 'Cameron Gera', 'hispassword', 'gerac@email.com', YES);
INSERT INTO User VALUES ('doejohn', '789 2nd Ln', 'John Doe', 'johndoe123', 'doejohn@email.com', NO);
INSERT INTO User VALUES ('doejane', '234 3rd Ave', 'Jane Doe', 'password123', 'doejane@email.com', NO);
INSERT INTO User VALUES ('gwash', '567 4th St', 'George Washington', 'washington456', 'gwash@email.com', NO);
INSERT INTO User VALUES ('teddyr', '953 9th Rd', 'Teddy Roosevelt', 'teddyteddy2', 'teddyr@email.com', NO);
INSERT INTO User VALUES ('bclinton', '815 7th St', 'Bill Clinton', 'lewinskylessthan3', 'bclinton@email.com', NO);

# relationship between orders and products -> what orders contain what products and a quantity
INSERT INTO Contains VALUES ('productID1', 'orderID1', 1);
INSERT INTO Contains VALUES ('productID1', 'orderID1', 1);
INSERT INTO Contains VALUES ('productID1', 'orderID1', 1);
INSERT INTO Contains VALUES ('productID1', 'orderID1', 1);
INSERT INTO Contains VALUES ('productID1', 'orderID1', 1);
INSERT INTO Contains VALUES ('productID1', 'orderID1', 1);
INSERT INTO Contains VALUES ('productID1', 'orderID1', 1);

# relationship between users and orders -> what users makes which order
>>>>>>> 5b74f91d7fd4e6b000db9da458357b1395163bbb
INSERT INTO Orders VALUES ('userID3', 'orderID1');
INSERT INTO Orders VALUES ('userID3', 'orderID1');
INSERT INTO Orders VALUES ('userID4', 'orderID2');
INSERT INTO Orders VALUES ('userID5', 'orderID3');
INSERT INTO Orders VALUES ('userID5', 'orderID3');
INSERT INTO Orders VALUES ('userID6', 'orderID4');
INSERT INTO Orders VALUES ('userID7', 'orderID5');

# relationship between product and supplier -> what product comes from which supplier
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
INSERT INTO Supplies VALUES ('productID1', 'supplierID1');
