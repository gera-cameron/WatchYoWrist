'use strict';

angular.module('watchYoWrist', [
  'ngRoute', 'ngCookies'
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
    var userCookie = $cookies.getObject('user');
    $log.info(userCookie);
    $scope.loggedOn = false;
    if (userCookie) {
        $scope.loggedOn = true;
    }
    $scope.logout = function () {
        $cookies.remove('user');
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
    $scope.sortAlphaAZ = function () {
        $scope.products.sort(function (a, b) {
            return a.name.localeCompare(b.name.localeCompare);
        });
    };
    $scope.sortAlphaZA = function () {
        $scope.products.sort(function (a, b) {
            return b.name.localeCompare(a.name.localeCompare);
        });
    };
    $scope.reset = function () {
        $route.reload();
    };

    }]).
controller('AboutCtrl', ['$scope', '$log', '$http', function ($scope, $log, $http) {

    }]).
controller('CartCtrl', ['$scope', '$log', '$http', '$window', function ($scope, $log, $http, $window) {
    $scope.items = [];
    $scope.total = 0;

    $log.debug("cartctrl called");

    $scope.addItem = function (product) {
        $scope.items.push(product);
        $scope.total = $scope.total + product.price;
        $log.debug("additem called, product is " + product.name + " items is size " + $scope.items.length);

    };
    $scope.deleteItem = function (product) {
        var index = $scope.items.indexOf(product);
        if (index > -1) {
            $scope.total = $scope.total - product.price;
            $scope.items.splice(index, 1);
        }
    };
    $scope.clear = function () {
        $scope.items = [];
    };
            }]).controller('UserCtrl', ['$scope', '$log', '$http', '$cookies', '$window', '$route', function ($scope, $log, $http, $cookies, $window, $route) {
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
            $cookies.putObject('user', response.data);
            $window.location.href = "/";
            $log.debug(response);
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