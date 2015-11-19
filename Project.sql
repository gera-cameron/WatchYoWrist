/*
	Kyle Brost
	Cameron Gera
	CIS4301
	Project
	We are working in MySQL for this project
*/

-- create tables --

/*
	+-------------+
	| 	TABLES		|		>>	* = PRIMARY KEY
	+-------------+
	|		AnOrder		|		->	id*, date_bought, product, paid, quantity
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
	id INT NOT NULL AUTO INCREMENT = 10000,
	date_bought datetime NOT NULL DEFAULT CURDATE(),
	product INT REFERENCING Product.id,
	paid BOOLEAN,
	quantity INT CHECK (quantity <=
		(SELECT quantity
		FROM Product, AnOrder
		WHERE AnOrder.product = Product.id)),
	PRIMARY KEY (id)
);

# product table
CREATE TABLE Product (
	id INT NOT NULL AUTO INCREMENT = 20000,
	name CHAR(20),
	price REAL,
	stock INT,
	description CHAR(100),
	active BOOLEAN,
	PRIMARY KEY (id)
);

# supplier table
CREATE TABLE Supplier (
	id INT NOT NULL AUTO INCREMENT = 30000,
	name CHAR(20),
	PRIMARY KEY (id)
);

# user table
CREATE TABLE User (
	id INT NOT NULL AUTO INCREMENT = 40000,
	address CHAR(20),
	name CHAR(20),
	password CHAR(20),
	email CHAR(20) UNIQUE,
	is_staff BOOLEAN,
	PRIMARY KEY (id)
);

# relation between AnOrder and Product with additional value 'quantity'
CREATE TABLE Contains (
	order_id INT,
	product_id INT,
	quantity INT
);

# relation between User and AnOrder
CREATE TABLE Orders (
	user_id INT,
	order_id INT
);

# relation between Product and Supplier
CREATE TABLE Supplies (
	product_id INT,
	supplier_id INT
);

# update tables for sails
alter table AnOrder add createdAt timestamp;
alter table Contains add createdAt timestamp;
alter table Orders add createdAt timestamp;
alter table Product add createdAt timestamp;
alter table Supplier add createdAt timestamp;
alter table Supplies add createdAt timestamp;
alter table User add createdAt timestamp;

alter table AnOrder add updatedAt timestamp;
alter table Contains add updatedAt timestamp;
alter table Orders add updatedAt timestamp;
alter table Product add updatedAt timestamp;
alter table Supplier add updatedAt timestamp;
alter table Supplies add updatedAt timestamp;
alter table User add updatedAt timestamp;

-- add initial data --
/*
# contains orders placed
<<<<<<< HEAD
INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20000, 40000, TRUE, 1);
INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20001, 40003, TRUE, 1);
INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20002, 40002, TRUE, 1);
INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20003, 40001, TRUE, 1);
=======
INSERT INTO AnOrder VALUES (TRUE, 1);
INSERT INTO AnOrder VALUES (TRUE, 1);
INSERT INTO AnOrder VALUES (TRUE, 1);
INSERT INTO AnOrder VALUES (TRUE, 1);
>>>>>>> 8ac20e86e5dfe96b538b696d887badb42b6c7879

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
<<<<<<< HEAD
INSERT INTO User (address, name, password, email, is_staff) VALUES ('123 Main St', 'Kyle Brost', 'mypassword', 'broskj@email.com', TRUE);
INSERT INTO User (address, name, password, email, is_staff) VALUES ('456 1st Ave', 'Cameron Gera', 'hispassword', 'gerac@email.com', TRUE);
INSERT INTO User (address, name, password, email, is_staff) VALUES ('789 2nd Ln', 'John Doe', 'johndoe123', 'doejohn@email.com', FALSE);
INSERT INTO User (address, name, password, email, is_staff) VALUES ('234 3rd Ave', 'Jane Doe', 'password123', 'doejane@email.com', FALSE);
INSERT INTO User (address, name, password, email, is_staff) VALUES ('567 4th St', 'George Washington', 'washington456', 'gwash@email.com', FALSE);
INSERT INTO User (address, name, password, email, is_staff) VALUES ('953 9th Rd', 'Teddy Roosevelt', 'teddyteddy2', 'teddyr@email.com', FALSE);
INSERT INTO User (address, name, password, email, is_staff) VALUES ('815 7th St', 'Bill Clinton', 'lewinskylessthan3', 'bclinton@email.com', FALSE);
=======
INSERT INTO User VALUES ('broskj', '123 Main St', 'Kyle Brost', 'mypassword', 'broskj@email.com', TRUE);
INSERT INTO User VALUES ('gerac', '456 1st Ave', 'Cameron Gera', 'hispassword', 'gerac@email.com', TRUE);
INSERT INTO User VALUES ('doejohn', '789 2nd Ln', 'John Doe', 'johndoe123', 'doejohn@email.com', FALSE);
INSERT INTO User VALUES ('doejane', '234 3rd Ave', 'Jane Doe', 'password123', 'doejane@email.com', FALSE);
INSERT INTO User VALUES ('gwash', '567 4th St', 'George Washington', 'washington456', 'gwash@email.com', FALSE);
INSERT INTO User VALUES ('teddyr', '953 9th Rd', 'Teddy Roosevelt', 'teddyteddy2', 'teddyr@email.com', FALSE);
INSERT INTO User VALUES ('bclinton', '815 7th St', 'Bill Clinton', 'lewinskylessthan3', 'bclinton@email.com', FALSE);

# relationship between orders and products -> what orders contain what products and a quantity
INSERT INTO Contains VALUES ('O001', 'P004', 1);
INSERT INTO Contains VALUES ('O002', 'P0012', 1);
INSERT INTO Contains VALUES ('O003', 'P001', 1);
INSERT INTO Contains VALUES ('O004', 'P006', 1);

# relationship between users and orders -> what users makes which order
INSERT INTO Orders VALUES ('doejohn', 'O001');
INSERT INTO Orders VALUES ('doejane', 'O002');
INSERT INTO Orders VALUES ('gwash', 'O003');
INSERT INTO Orders VALUES ('teddyr', 'O004');

# relationship between product and supplier -> what product comes from which supplier
INSERT INTO Supplies VALUES ('P001', 'S001');
INSERT INTO Supplies VALUES ('P002', 'S001');
INSERT INTO Supplies VALUES ('P003', 'S001');
INSERT INTO Supplies VALUES ('P004', 'S001');
INSERT INTO Supplies VALUES ('P005', 'S002');
INSERT INTO Supplies VALUES ('P006', 'S002');
INSERT INTO Supplies VALUES ('P007', 'S002');
INSERT INTO Supplies VALUES ('P008', 'S002');
INSERT INTO Supplies VALUES ('P009', 'S003');
INSERT INTO Supplies VALUES ('P010', 'S003');
INSERT INTO Supplies VALUES ('P011', 'S003');
INSERT INTO Supplies VALUES ('P012', 'S003');
>>>>>>> 8ac20e86e5dfe96b538b696d887badb42b6c7879
*/

/*
	on new order:
		create Orders with User.id and AnOrder.id
		create AnOrder with (...)
		Product.stock -= Contains.quantity
	on new User:
		create new User with (...)
	On new Product:
		create new Product with (...)
	On new Supplier:
		create new Supplier with (...)
		update Supplies with Product.id and Supplier.id

	On removal from any
		(...)
*/

-- constraints --

#
ALTER TABLE Product add constraint productExist check (0<> (select COUNT(*) from Product));

-- triggers --
CREATE OR REPLACE TRIGGER orderTrigger
	AFTER INSERT ON Contains
	REFERENCING NEW ROW AS NewTuple
	FOR EACH ROW BEGIN
		INSERT INTO Orders(user_id) VALUES (SELECT USER());
		INSERT INTO Orders(order_id) VALUES (NewTuple.order_id);
		INSERT INTO AnOrder(id) VALUES (NewTuple.order_id);
		INSERT INTO AnOrder(paid) VALUES TRUE;
		INSERT INTO AnOrder(quantity) VALUES (NewTuple.quantity);
		UPDATE Product SET stock = stock - NewTuple.quantity;
	END;

CREATE OR REPLACE TRIGGER anOrderTrigger
	AFTER INSERT ON AnOrder
	REFERENCING NEW ROW AS NewTuple
	FOR EACH ROW BEGIN
		INSERT INTO
	END;
#

-- assertions --

#
CREATE ASSERTION productExist
	CHECK (0 <> (Select COUNT(*) from Product));
	
