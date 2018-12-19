var taxAssessmentApp = angular.module("taxAssessmentApp", []);

taxAssessmentApp.controller("taxAssessmentController",['$scope','$http', '$window', function($scope, $http, $window){
	$http({
		url: "http://localhost:3000/tax_assessments/getItrTypes",
		method: "GET"
	}).then(function successCallback(response) {
		$scope.Itr_types = response.data['Itr_types']
	}, function errorCallback(response){
	    $scope.Itr_types = "error";
	});

	$http({
		url: "http://localhost:3000/tax_assessments/getAssessmentYears",
		method: "GET"
	}).then(function successCallback(response){
		$scope.assessmentYears = response.data['assessmentYears'];
	});

	$scope.createTaxAssessment = function(){
		var data =  {Itr_type:$scope.Itr_type,
					assessment_year:$scope.assessment_year,
					ack_no:$scope.ack_no,
					profit:$scope.profit,
					revenue:$scope.revenue};
		$http({
	      url: "http://localhost:3000/tax_assessments/taxAssessmentRecord",
	      method: "POST",
	      params: data
	    }).then(function successCallback(response){
	    	$window.location.href = '/tax_assessments';
	    }, function errorCallback(response){
	    	$scope.errorMessage = response.data['message'];
	    });
	};
}]);

taxAssessmentApp.controller("viewAllController",['$scope','$http', '$window', function($scope, $http, $window){
	$http({
		url: "http://localhost:3000/tax_assessments/showAll",
	    method: "GET",
	    isArray: true
	}).then(function successCallback(response){
		$scope.taxAssessments = JSON.parse(response.data.taxAssessments);
	});

	$scope.deleteRecord = function(id){
		$http({
	      url: "http://localhost:3000/tax_assessments/destroy?id="+id.toString(),
	      method: "DELETE"
	  	}).then(function successCallback(response){
	  		$window.location.href = '/tax_assessments'
	  	});
	};

	$scope.editRecord = function(id){
	  	$window.localStorage.setItem('taxAssessmentId',id.toString());
	  	$window.location.href = '/tax_assessments/edit';
	};

	$scope.logoutProcess = function(){
		$http({
			url: "http://localhost:3000/tax_assessments/logoutProcess"
		}).then(function successCallback(response){
			$window.location.href = '/application'
		});
	};
}]);


taxAssessmentApp.controller("editTaxAssessmentController",['$scope', '$http', '$window', function($scope, $http, $window){
	$http({
		url: "http://localhost:3000/tax_assessments/getItrTypes",
		method: "GET"
	}).then(function successCallback(response) {
		$scope.Itr_types = response.data['Itr_types']
	});

	$http({
		url: "http://localhost:3000/tax_assessments/getAssessmentYears",
		method: "GET"
	}).then(function successCallback(response){
		$scope.assessmentYears = response.data['assessmentYears'];
	});

	currentTaxId = $window.localStorage.getItem('taxAssessmentId');

	$http({
	    url: "http://localhost:3000/tax_assessments/getTaxAssessmentRecord?id="+currentTaxId.toString(),
	    method: "GET"
	}).then(function successCallback(response){
	  	$scope.taxAssessment = response.data['tax_assessment'];
	  	delete $scope.taxAssessment.created_at;
	  	delete $scope.taxAssessment.updated_at;
	  	delete $scope.taxAssessment.logins_id;
	  	$scope.taxAssessment.assessment_year = $scope.taxAssessment.assessment_year.toString();
	  	//$scope.taxAssessment.assessment_year = $scope.taxAssessment.assessment_year.toString() + " - " + ($scope.taxAssessment.assessment_year+1).toString();
	});

	$scope.editTaxAssessment = function(){
		var data = $scope.taxAssessment;
		$http({
	      url: "http://localhost:3000/tax_assessments/update?id="+currentTaxId.toString(),
	      method: "POST",
	      params: data
	    }).then(function successCallback(response){
	    	$window.location.href = '/tax_assessments';
		}, function errorCallback(response){
			$scope.errorMessage = response.data['message']
		});
	}
}]);

function ackNoTypeCheck(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
