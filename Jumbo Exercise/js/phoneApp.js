var app = angular.module('phoneApp',[]);
app.controller('phoneController',['$scope', function($scope){
	$scope.phones = [
		{
		   id: 1,
		   name: "HONOR 8X 128GB 4G DUAL SIM, red ",
		   icon: "honor_8x.jpg",
		   brand: "HONOR",
		   variant: "Red",
		   price: 19047
		},
		{
		   id: 2,
		   name: "APPLE IPHONE XR, coral, 256gb",
		   icon: "iphone_xr.jpg",
		   brand: "APPLE",
		   variant: "Coral",
		   price: 68800
		},
		{
		   id: 3,
		   name: "HUAWEI P20 PRO 128GB DUAL SIM,  purple",
		   icon: "huwai_p20.jpg",
		   brand: "HUAWEI",
		   variant: "Purple",
		   price: 41915
		}
	];
	$scope.cartDetails = [];
	$scope.addToCart = function(index){

		$("#shoppingCart").css('width', "25%");
		$(".overlay").css('display',"block");
		cartIndex = $scope.cartDetails.indexOf($scope.phones[index]);
		if (cartIndex>=0){
			$scope.cartDetails[cartIndex].count = $scope.cartDetails[cartIndex].count+ 1;
		}
		else{
			$scope.cartDetails.push($scope.phones[index]);
			$scope.cartDetails[$scope.cartDetails.length-1].count = 1;
		}
	};

	$scope.removeFromCart = function(index){
		$scope.cartDetails.splice(index, 1);
	}

	$scope.increaseQuantity = function(index){
		$('button#decrease').attr('disabled',false);
		$scope.cartDetails[index].count +=1;
		if ($scope.cartDetails[index].count == 3)
			$('button#increase').attr('disabled',true);
	}

	$scope.decreaseQuantity = function(index){
		$('button#increase').attr('disabled',false);
		$scope.cartDetails[index].count -=1;
		if ($scope.cartDetails[index].count == 0)
			$('button#decrease').attr('disabled',true);
	}
}]);
