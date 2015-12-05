		
function bidHandler(message){
	json = ColdFusion.JSON.encode(message.data);
	var response=jQuery.parseJSON(json);
	if (typeof response == 'object' && message.channelname == 'auction_list') {
		console.log('we are updating a bid price');
		var scope = angular.element($("#auction_ctrl")).scope()
		scope.$apply(function() {
			scope.updateAuctionElement(response);
		});
	} else if (typeof response == 'object' && message.type == 'data') {
		console.log(response);
		var scope = angular.element($("#auction_ctrl")).scope()
		scope.$apply(function() {
			scope.addAuctionElement(response);
		});
	}
}