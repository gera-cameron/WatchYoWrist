/**
* Supplier.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models

CREATE TABLE Supplier (
	id INT NOT NULL AUTO_INCREMENT,
	name CHAR(20),
	createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updatedAt timestamp ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

*/

module.exports = {
  tableName: 'Supplier',
  connection: 'mysql',
  migrate: 'safe',
  attributes: {
    id : {type:'INT'},
    name : {type:'CHAR'}
  }
};
