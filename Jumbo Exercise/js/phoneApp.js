var app = angular.module('phoneApp',[]);
app.controller('phoneController',['$scope', function($scope){
	$scope.phones = [
		{
		   id: 1,
		   name: "HONOR 8X 128GB 4G DUAL SIM",
		   icon: "img/honor_8x.jpg",
		   brand: "HONOR",
		   variant: "Red",
		   price: 19047
		},
		{
		   id: 2,
		   name: "APPLE IPHONE XR, 256gb",
		   icon: "img/iphone_xr.jpg",
		   brand: "APPLE",
		   variant: "Coral",
		   price: 68800
		},
		{
		   id: 3,
		   name: "HUAWEI P20 PRO 128GB DUAL SIM",
		   icon: "img/huwai_p20.jpg",
		   brand: "HUAWEI",
		   variant: "Purple",
		   price: 41915
		},
		{
		   id: 4,
		   name: "SAMSUNG GALAXY S9 DUAL SIM, 128gb",
		   icon: "img/samsung_s9.png",
		   price: 42072,
		   brand: "SAMSUNG",
		   variant: "Black"
		}
	];
	$scope.cartDetails = [];
	$scope.addToCart = function(index){
		$("#shoppingCart").css('width', "25%");
		$(".overlay").css('display',"block");
		cartIndex = $scope.cartDetails.indexOf($scope.phones[index]);
		if (cartIndex>=0){
			$scope.cartDetails[cartIndex].count +=1;
		}
		else{
			$scope.cartDetails.push($scope.phones[index]);
			$scope.cartDetails[$scope.cartDetails.length-1].count = 1;
		}
		updatePrice();
	};

	$scope.removeFromCart = function(index){
		$scope.cartDetails.splice(index, 1);
		updatePrice();
	}

	$scope.increaseQuantity = function(index){
		$(event.currentTarget).parent().siblings('#decrease').children().attr('disabled',false);
		$scope.cartDetails[index].count +=1;
		if ($scope.cartDetails[index].count == 3)
			$(event.currentTarget).attr('disabled',true);
		updatePrice();
	}

	$scope.decreaseQuantity = function(index){
		$(event.currentTarget).parent().siblings('#increase').children().attr('disabled',false);
		$scope.cartDetails[index].count -=1;
		if ($scope.cartDetails[index].count == 1)
			$(event.currentTarget).attr('disabled',true);
		updatePrice();
	}

	
	var updatePrice = function(){
		$scope.totalPrice = 0;
		for (var i = 0; i<$scope.cartDetails.length; i++){
			$scope.totalPrice += $scope.cartDetails[i].count * $scope.cartDetails[i].price;
		}
	}
}]);
