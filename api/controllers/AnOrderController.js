/**
 * AnOrder1.jsController
 *
 * @description :: Server-side logic for managing Anorder1.js
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

 module.exports = {
     getCart: function(req, res) {
         CartService.getCart(function(cart) {
             res.json(cart);
         });
     },
     addToCart: function(req, res) {
         var CartVal = (req.body.value) ? req.body.value : undefined;
         CartService.addToCart(CartVal, function(success) {
             res.json(success);
         });
     },
     removeFromCart: function(req, res) {
        var CartVal = (req.body.value) ? req.body.value : undefined;
         CartService.removeFromCart(CartVal, function(success) {
             res.json(success);
         });
    }
};
