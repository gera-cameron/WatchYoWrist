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
    id : {type:'INT'},
    date_bought : {type:'datetime'},
    product : {type:'INT'},
    paid : {type:'boolean'},
    quantity : {type:'INT'},
  }
};
