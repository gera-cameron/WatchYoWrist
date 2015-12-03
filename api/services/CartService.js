module.exports = {
  getCart: function(next) {
    AnOrder.find().exec(function(err, cartItem) {
      if(err) throw err;
      next(cartItem);
    });
  },
  addToCart: function(todoVal, next) {
    AnOrder.create({cur_product: cartVal}).exec(function(err, cartItem) {
      if(err) throw err;
      next(cartItem);
    });
  },
  removeFromCart: function(todoVal, next) {
    AnOrder.destroy({cur_product: cartVal}).exec(function(err, cartItem) {
      if(err) throw err;
      next(cartItem);
    });
  }
};
