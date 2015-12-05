var app = angular.module("intoriabay", []);

app.factory('auctions', function($http) {
  var promise = null;
  return function() {
    if (promise) {
      return promise;
    } else {
      promise = $http.get('api/auctions');
      return promise;
    }
  };
});

app.directive("auctionCard", function(){
	return {
		restrict: "E",
		replace: true,
		scope:{ auction: '=element'},
		templateUrl: 'files/auctionitem.html'
	}
});

app.controller("AuctionCntl", function($scope, $q, auctions) {
	auctions().then(function(response) {
		$scope.auctionlist = response.data.auctions;
	});

	// push a new auction item to the list
	$scope.addAuctionElement = function(element) {
		$scope.auctionlist.push(element);
	}
	
	// loop and update price of last bid amount
	$scope.updateAuctionElement =  function(element) {
		angular.forEach($scope.auctionlist, function(auction_item){
			if (auction_item.id == element.auctionid) {
				auction_item.startingprice = element.amount;
			}
		});
	} 
});
