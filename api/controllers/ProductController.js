/**
 * ProductController
 *
 * @description :: Server-side logic for managing Products
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	find: function(req,res){
		var allParams = req.allParams();
		var productsDetails = allParams.description;
		var productName = allParams.name;
		Product.find()
		.then(function(product){
			sails.log.verbose("product is", product);
			while(product){
						return res.send(product);
			}
		})
		.catch(function(err){
			return res.serverError();
		});
	}
};
