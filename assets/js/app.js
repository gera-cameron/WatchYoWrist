'use strict';

angular.module('watchYoWrist', [
  'ngRoute'
]).
config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/', {
       templateUrl: 'templates/home.html',
       controller: 'HomeCtrl'
   });
   $routeProvider.otherwise({
        redirectTo: '/'
    });
}]).
controller('HomeCtrl',['$scope','$log','$http', function($scope,$log,$http){
      $scope.products = {};
      $http({
          method: 'GET',
          url: '/Product',
      }).success(function(response){
          $log.debug(response);
          $scope.products = response;
      });

    }]).
controller('LoginCtrl',['$scope','$log','$http', function($scope,$log,$http){
      $scope.userData = {};
      $scope.loginSubmit = function(submittedUser){
        $log.debug(submittedUser);
        $http({
          method: 'POST',
          url: '/login',
          params: {
            email : submittedUser.email,
            password : submittedUser.password
          }
        }).then(function successCallback(response) {
            $log.debug(response);
        }, function errorCallback(response) {
          // called asynchronously if an error occurs
          // or server returns response with an error status.
        });
      };
}])
;
