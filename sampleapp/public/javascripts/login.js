var loginDetails = angular.module("loginApp",['ngResource']);

loginDetails.component("welcomeNote",{
	//template: "Hello There",
	template: "<h1>{{$ctrl.welcome.titleName}}</h1>",
	controller: function(){
		this.welcome = {
			note: "Hello. Welcome to SampleApp.",
			titleName: "Tax Assessments",
			loginNote: "This is the login page.",
			registerNote: "This is the registration page. Please register to login!"
		};
	}
});

loginDetails.factory("Users", function($resource) {
  return $resource("/logins.json",{loginId: '@id'}, 
  {index: { method: 'GET', isArray: true }},);
});

loginDetails.controller("loginController", ['$scope','Users','$http', '$window', function($scope, Users, $http, $window) {
	$scope.loginAuth =function (){
		var data = {username:$scope.username, password:$scope.password};
		$scope.status = "Unknown";
	    $http({
	      url: "http://localhost:3000/logins/loginAuth",
	      method: "POST",
	      params: data,
	    }).then(function successCallback(response) {
	    	$window.location.href = '/tax_assessments'
	    }, function errorCallback(response){
	    	$scope.status = response.data['message'];
	    });
	}
	
}]);