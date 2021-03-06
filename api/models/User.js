/**
* User.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {
  tableName: 'User',
  connection: 'mysql',
  migrate: 'safe',
  attributes: {
    id : {type:'integer', primaryKey: true, unique: true},
    address : {type:'string'},
    name : {type:'string'},
    password : {type:'string'},
    email : {type:'string'},
    is_staff : {type:'boolean', defaultsTo:false}
  },
  autoPK:false
};
