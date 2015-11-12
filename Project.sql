/*
	Kyle Brost
	Cameron Gera
	CIS4301
	Project
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

# relation between Order and Product with additional value 'quantity'
CREATE TABLE Contains (
	product_id CHAR(20),
	order_id CHAR(20),
	quantity INT
);

# relation between User and Order
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

INSERT INTO AnOrder VALUES ();

INSERT INTO Product VALUES ();

INSERT INTO Supplier VALUES ();

INSERT INTO User VALUES ();

INSERT INTO Contains VALUES ();

INSERT INTO Orders VALUES ();

INSERT INTO Supplies VALUES ();
