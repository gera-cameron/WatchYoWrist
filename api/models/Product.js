/**
* Product.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models

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
	PRIMARY KEY (id),
	CHECK(quantity >= 1)
);

*/

module.exports = {
  tableName: 'Product',
  connection: 'mysql',
  migrate: 'safe',
  attributes: {
    id : {type:'INT'},
    name : {type:'CHAR'},
    price : {type:'REAL'},
    stock : {type:'INT'},
    description : {type:'CHAR'},
    supplier: {type:'INT'}
  }
};
