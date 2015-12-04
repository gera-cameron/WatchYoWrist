/**
 * ProductController
 *
 * @description :: Server-side logic for managing Products
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	update: function(req, res) {

    var sentParamsObj = req.allParams();
    var productId = Number(sentParamsObj.id);
    var productName = sentParamsObj.name;
    var productPrice = sentParamsObj.price;
    var productStock = sentParamsObj.stock;
    var productDescription = sentParamsObj.description;
    var productSupplier = sentParamsObj.supplier;
		var productActive = true;

		if(productStock <= 0){
			productActive = false;
		}
    sails.log.verbose("productId is", productId);
    Product.update(productId, {name:productName, price:productPrice, stock:productStock,
      description:productDescription,suppler:productSupplier,active:productActive})
			.then(function(updatedProduct){
        sails.log.verbose("Updated Product", updatedProduct);
        return res.ok(updatedProduct);
      }).catch(function(err){
        return res.serverError(err);
      });
    sails.log.verbose("product info is ", productName);
  },

  delete: function(req,res){
    var sentParamsObj = req.allParams();
    var productId = Number(sentParamsObj.id);
    Product.destroy(productId).exec(function deleteCB(err){
      sails.log.verbose('The record has been deleted', sentParamsObj);
      return res.ok(sentParamsObj);
    });
  },

	find: function(req,res){
		sails.log.verbose("Print this");
		var allParams = req.allParams();
		var productsDetails = allParams.description;
		var productName = allParams.name;
		sails.log.verbose(productName);
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
