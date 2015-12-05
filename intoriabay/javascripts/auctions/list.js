function bidHandler(message){
	json = ColdFusion.JSON.encode(message.data);
	var response=jQuery.parseJSON(json);
	if (typeof response == 'object' && message.type == 'data') {
		var scope = angular.element($("#auction_ctrl")).scope()
		scope.$apply(function() {
			scope.addAuctionElement(response);
		});
	}
}