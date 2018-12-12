var app = angular.module("controllerApp",[]);
app.controller("myController",function($scope){
	$scope.text = "Click on me";
	$scope.changeText = function(){
		$scope.text = "The text changed after click";
	};
});
app.controller("myFilters",['$scope',function($scope){
	$scope.string = "Hello World";
	$scope.number = 1234567890;
	$scope.objArray = [{id:1,item:'Oranges'},{id:2, item:'Zebra'},{id:3,item:'Apples'},{id:4,item:'Peach'}];
	$scope.array = ['Oranges','Zebra','Apples','Peaches'];
}]);

app.controller("myServices",['$scope', '$location', '$http','$timeout','$interval', function($scope,$location, $http, $timeout, $interval){
	$scope.myUrl = $location.absUrl();

	$http.get("../html/hello_world.html").then(function (response) {
		$scope.helloWorld = response.data;
    });

    $scope.timeoutText = "Text will change after 3 seconds";
	$timeout(function () {
		$scope.timeoutText = "I have changed";
	}, 3000);

	$scope.intervalNumber = 0
	$interval(function(){
		$scope.intervalNumber = $scope.intervalNumber + 1;
	},1000);
}]);

app.controller('MainCtrl', function MainCtrl() {
  this.hero = {
    name: 'John Doe'
  };
});

app.component('heroDetail', {
  template: 'Name: {{$ctrl.hero.name}}',
  bindings: {
    hero: '='
  }
});