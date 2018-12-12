var app = angular.module('myApp', [])

/*//Sample Controller
app.controller('helloWorld', function($scope) {
    $scope.greeting= "Welcome User.";
    $scope.desc= "This is a hello world program";
});*/

app.directive('helloWorld', function(){
	return {
		template : "Welcome User. This ia a hello world program. (using directives)"
	};
});