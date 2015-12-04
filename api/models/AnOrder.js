/**
* AnOrder.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models

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
	createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updatedAt timestamp ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	CHECK(quantity >= 1)
);

*/

module.exports = {
  tableName: 'AnOrder',
  connection: 'mysql',
  migrate: 'safe',
  attributes: {
    id : {type:'integer', primaryKey: true, unique: true},
    date_bought : {type:'datetime'},
    cur_product : {type:'INT'},
    cur_user : {type:'INT'},
    paid : {type:'boolean'},
    quantity : {type:'INT'},
  }
};
