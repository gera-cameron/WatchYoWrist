var expressJwt = require('express-jwt');
var secret = sails.config.tokenSecret;

module.exports = expressJwt({secret: secret});
