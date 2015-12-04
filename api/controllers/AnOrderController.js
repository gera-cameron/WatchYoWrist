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
     }
};
