<cfscript>
	addRoute(name="home", pattern="", controller="Auctions", action="list");

	addRoute(name="auction_new", pattern="auction/new", controller="Auctions", action="new");
	addRoute(name="auction_bid", pattern="auction/[auctionid]/bid", controller="Auctions", action="bid");
	addRoute(name="auction_detail", pattern="auction/[auctionid]", controller="Auctions", action="show");
	addRoute(name="auction_apilist", pattern="api/auctions", controller="Auctions", action="jsonlist");
	addRoute(name="auction_list", pattern="auctions", controller="Auctions", action="list");

</cfscript>