/**
 * AnOrder1.jsController
 *
 * @description :: Server-side logic for managing Anorder1.js
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

 module.exports = {
     checkout : function(req,res){
       var allParams = req.allParams();
       sails.log.verbose(allParams);
       return res.ok(allParams);
     },
     update: function(req, res) {

       var sentParamsObj = req.allParams();
       var orderId = Number(sentParamsObj.id);
       var orderQuantity = sentParamsObj.quantity;
       var orderDate = sentParamsObj.date_bought;
       var orderPaid = sentParamsObj.paid;
       var orderUser = sentParamsObj.cur_user;
       var orderProduct = sentParamsObj.cur_product;
       sails.log.verbose("orderId is", orderId);
       AnOrder.update(orderId, {quantity:orderQuantity, date_bought:orderDate, paid:orderPaid,
         cur_product:orderProduct, cur_user:orderUser}).then(function(updatedOrder){
           sails.log.verbose("Updated Order", updatedOrder);
           return res.ok(updatedOrder);
         }).catch(function(err){
           return res.serverError(err);
         });
       sails.log.verbose("order info is ", orderUser);
     },

     delete: function(req,res){
       var sentParamsObj = req.allParams();
       var orderId = Number(sentParamsObj.id);
       sails.log.verbose("Print this" + orderId);
       AnOrder.destroy(orderId).exec(function deleteCB(err){
         sails.log.verbose('The record has been deleted', sentParamsObj);
         return res.ok(sentParamsObj);
       });
     },

     find: function(req,res){
   		sails.log.verbose("Print this");
   		var allParams = req.allParams();
   		var ordersQuantity = allParams.quantity;
   		var orderId = allParams.id;
   		sails.log.verbose(orderId);
   		AnOrder.find()
   		.then(function(order){
   			sails.log.verbose("order is", order);
   			while(order){
   						return res.ok(order);
   			}
   		})
   		.catch(function(err){
   			return res.serverError();
   		});
   	}
};
