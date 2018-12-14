var app = angular.module('myApp', ['ui.router'])

/*//Sample Controller
app.controller('helloWorld', function($scope) {
    $scope.greeting= "Welcome User.";
    $scope.desc= "This is a hello world program";
});*/

app.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
    
    $stateProvider
        // HOME STATES AND NESTED VIEWS ========================================
        .state('home', {
            url: '/hello_world',
            templateUrl: 'partial_hello_world.html' 
        })

        // ABOUT PAGE AND MULTIPLE NAMED VIEWS =================================
        .state('about', {
            url: '/hello_world',
            templateUrl: 'partial_hello_world.html' 
        });
        //$urlRouterProvider.otherwise('/hello_world');
}]);