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

app.factor('auction', function($http) {
	var promise = null;
	var promise = null;
	return function(auctionid) {
	if (promise) {
	  return promise;
	} else {
	  promise = $http.get(url:'api/auctions/:id', params: {id:auctionid});
	  return promise;
    }
  };
});

app.controller("AuctionCntl", function($scope, $q, auctions) {
	auctions().then(function(response) {
		$scope.auctionlist = response.data.auctions;
	});

	$scope.addAuctionElement = function(element) {
		$scope.auctionlist.push(element);
	}
});
