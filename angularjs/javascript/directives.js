var app = angular.module('directivesApp',[]);
app.directive('directives',function(){
	return{
		restrict : "EA",
		template : "<h3>This is an user-defined directive.</h3>"
	}
});
app.controller('')