/**
 * UserController
 *
 * @description :: Server-side logic for managing users
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
  update: function(req, res) {

    var sentParamsObj = req.allParams();
    var userId = sentParamsObj.id;
    var userName = sentParamsObj.name;
    var userAddress = sentParamsObj.address;
    var userEmail = sentParamsObj.email;
    var userPassword = sentParamsObj.password;
    var userIsStaff = sentParamsObj.is_staff;
    sails.log.verbose("userId is", userId);
    User.update({email: userEmail}, {name:userName, address:userAddress, email:userEmail,
      password:userPassword,is_staff:userIsStaff}).then(function(updatedUser){
        sails.log.verbose("Updated User", updatedUser);
        return res.ok(updatedUser);
      }).catch(function(err){
        return res.serverError(err);
      });
    sails.log.verbose("user info is ", userAddress);
  },

  delete: function(req,res){
    var sentParamsObj = req.allParams();
    var userId = Number(sentParamsObj.id);
    User.destroy(userId).exec(function deleteCB(err){
      sails.log.verbose('The record has been deleted', sentParamsObj);
      return res.ok(sentParamsObj);
    });
  },

  find: function(req,res){
		sails.log.verbose("Print this");
		var allParams = req.allParams();
		var usersDetails = allParams.description;
		var userName = allParams.name;
		sails.log.verbose(userName);
		User.find()
		.then(function(user){
			sails.log.verbose("user is", user);
			while(user){
						return res.send(user);
			}
		})
		.catch(function(err){
			return res.serverError();
		});
	}
};
