/**
 * UserController
 *
 * @description :: Server-side logic for managing users
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	create: function(req, res){
    sails.log.verbose("New user created");
    var allParams = req.allParams();
		var member = {
    	Email: email.toLowerCase(),
      Password: password
    };
    User.findOne({'email': email})
      .then(function(user){
				if(user) {
					sails.log.verbose("User email" + user.email + "already exist");
        return res.json({ success: false });
			} else {
				//Create new user
				User.create({
					address : allParams.address,
			    name : allParams.name,
			    password : allParams.password,
			    email : allParams.email,
			    is_staff : false
				});
			}
      })
      .catch(function(err){
        return res.serverError();
      });
    }
};
