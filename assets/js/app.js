'use strict';

angular.module('watchYoWrist', [
  'ngRoute', 'ngCookies', 'angular-toArrayFilter'
]).
config(['$routeProvider', function ($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'templates/home.html',
            controller: 'HomeCtrl'
        })
        .when('/about', {
            templateUrl: 'templates/about.html',
            controller: 'AboutCtrl'
        })
        .when('/cart', {
            templateUrl: 'templates/cart.html',
            controller: 'CartCtrl'
        })
        .when('/user', {
            templateUrl: 'templates/user.html',
            controller: 'UserCtrl'
        });
    $routeProvider.otherwise({
        redirectTo: '/'
    });
}]).
controller('MainCtrl', ['$scope', '$log', '$http', '$cookies', '$window', function ($scope, $log, $http, $cookies, $window) {
    $scope.products = {};
    $scope.items = [];
    $scope.total = 0;
    $scope.enabled = false;

    $log.debug("cartctrl called");

    $scope.addItem = function (product) {
        $scope.items.push(product);
        $scope.total = $scope.total + product.price;
        $scope.enabled = true;
        $log.debug("additem called, product is " + product.name + " items is size " + $scope.items.length);
        $log.debug("additem called, Total is " + $scope.total);

    };
    $scope.deleteItem = function (product) {
        var index = $scope.items.indexOf(product);
        $log.debug("deleteitem called, product is " + product.name);
        if (index > -1) {
            $scope.total = $scope.total - product.price;
            $scope.items.splice(index, 1);
            if ($scope.items.length <= 0)
                $scope.enabled = false;
        }
    };
    $scope.clear = function () {
        $scope.items = [];
        $scope.total = 0;
        $scope.enabled = false;
    };

    var userCookie = $cookies.getObject('user');
    $log.info(userCookie);
    $scope.loggedOn = false;
    $scope.staff = false;
    if (userCookie) {
        $scope.loggedOn = true;
        if (userCookie.is_staff) {
            $scope.staff = true;
        }
    }
    $scope.logout = function () {
        $cookies.remove('user');
        $scope.staff = false;
        $window.location.href = "/";
    };

    }]).
controller('HomeCtrl', ['$scope', '$log', '$http', '$route', function ($scope, $log, $http, $route) {
    $scope.products = {};

    $http({
        method: 'GET',
        url: '/Product',
    }).success(function (response) {
        $log.debug(response);
        $scope.products = response;
    });

    $scope.sortPriceLowHigh = function () {
        $scope.products.sort(function (a, b) {
            return parseFloat(a.price) - parseFloat(b.price);
        });
    };
    $scope.sortPriceHighLow = function () {
        $scope.products.sort(function (a, b) {
            return parseFloat(b.price) - parseFloat(a.price);
        });
    };
    $scope.reset = function () {
        $route.reload();
    };

    }]).
controller('AboutCtrl', ['$scope', '$log', '$http', function ($scope, $log, $http) {

    }]).
controller('CartCtrl', ['$scope', '$log', '$http', '$window', function ($scope, $log, $http, $window) {

  }]).
controller('UserCtrl', ['$scope', '$log', '$http', '$cookies', '$window', '$route', function ($scope, $log, $http, $cookies, $window, $route) {
    $scope.users = {};

    $http({
        method: 'GET',
        url: '/User',
    }).success(function (response) {
        $log.debug(response);
        $scope.users = response;
    });
    $scope.userObject = $cookies.getObject('user');
    $scope.updateSubmit = function (updatedUser) {
        $log.debug(updatedUser.id);
        $http({
            method: 'PUT',
            url: '/User/update/updatedUser.id',
            params: {
                id: updatedUser.id,
                name: updatedUser.name,
                address: updatedUser.address,
                email: updatedUser.email,
                password: updatedUser.password
            }
        }).then(function successCallback(response) {
            $cookies.remove('user');
            $cookies.putObject('user', response.data[0]);
            $window.location.href = "/#/user";
            $log.debug(response.data[0]);
        }, function errorCallback(response) {
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    };

    $scope.deleteAccount = function (updatedUser) {
        $log.debug(updatedUser.id);
        $http({
            method: 'DELETE',
            url: '/User/destroy/' + updatedUser.id,
            // params: {
            //   id : updatedUser.id,
            //   name : updatedUser.name,
            //   address : updatedUser.address,
            //   email : updatedUser.email,
            //   password : updatedUser.password
            // }
        }).then(function successCallback(response) {
            $cookies.remove('user');
            $window.location.href = "/";
            $scope.$parent.loggedOn = false;
            $log.debug(response.data);
            $route.reload();
        }, function errorCallback(response) {
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    };
}]).controller('LoginCtrl', ['$scope', '$log', '$http', '$cookies', '$window', function ($scope, $log, $http, $cookies, $window) {
    $scope.message = false;
    $scope.userData = {};

    $scope.loginSubmit = function (submittedUser) {
        $scope.staff = false;
        $scope.message = false;
        $log.debug(submittedUser);
        $http({
            method: 'POST',
            url: '/login',
            params: {
                email: submittedUser.email,
                password: submittedUser.password
            }
        }).then(function successCallback(response) {
            $log.debug(response.data.is_staff);
            $log.debug($scope.staff);
            $cookies.putObject('user', response.data);
            $window.location.href = "/";
        }, function errorCallback(response) {
            $scope.message = {
                feedback: 'Incorrect Username or Password'
            };
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    };
}]).controller('NewUserCtrl', ['$scope', '$log', '$http', '$cookies', '$window', function ($scope, $log, $http, $cookies, $window) {
    $scope.newUserData = {};
    $scope.createUser = function (createdUser) {
        $log.debug(createdUser);
        $http({
            method: 'POST',
            url: '/User/create',
            params: {
                address: createdUser.address,
                name: createdUser.name,
                email: createdUser.email,
                password: createdUser.password,
                is_staff: false
            }
        }).then(function successCallback(response) {
            $log.debug(response);
        }, function errorCallback(response) {
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    };
}]);