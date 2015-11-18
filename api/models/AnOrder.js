/**
* AnOrder.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {
  tableName: 'AnOrder',
  connection: 'mysql',
  migrate: 'safe',
  attributes: {
    id : {type:'string'},
    date_bought : {type:'string'},
    paid : {type:'boolean'},
    quantity : {type:'INT'},
  }
};
