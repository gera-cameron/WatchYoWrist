module.exports = {
  login: function(req, res){
    sails.log.verbose("Login submitted");
    var allParams = req.allParams();
    var email = allParams.email || null;
    var password = allParams.password || null;

    sails.log.verbose("username is", email);
    sails.log.verbose("password is", password);
    if(email && password){
      //TODO : RegEx Email
      User.findOne({'email': email})
      .then(function(user){
        sails.log.verbose("user is", user);
        if(user){
          if(user.password === password){
              return res.send(user);
          } else {
            return res.badRequest();
          }
        } else {
          return res.badRequest();
        }
      })
      .catch(function(err){
        return res.serverError();
      });
    } else {
      return res.badRequest();
    }
  }
};
