component extends="Controller" accessors=true output=false persistent=false {

	function detail() {
		auction = model('Auction').findAll(
			select="MAX(bids.amount) as maxbidprice,auctions.*",
			where="id = #params.auctionid# AND active = 1 AND started = 1 AND current_date < DATE_ADD(startdate,INTERVAL duration DAY)",
			order="DATE_ADD(startdate,INTERVAL duration DAY) DESC",
			include="bids"
		);
		bid = model('bid').new();
	}

	function bid() {
		auction = model('Auction').findByKey(
			key=params.auctionid
		);

		bid = auction.createBid(params.bid);
		bid.customerid = session.user.id;
		if (!bid.save())  {
			error_message = "";
			for (error in bid.allErrors()) {
				error_message = error_message & error.message & "<br>";
			}
			flashInsert(error=error_message);
			redirectTo(route="auction_detail", auctionid=params.auctionid);
		} else {
			flashInsert(success="You are currently the higgest bidder");
			redirectTo(route="auction_detail", auctionid=params.auctionid);
		}
	}

	function list() {
		auctions = model('Auction').findAll(
			select="MAX(bids.amount) as maxbidprice,auctions.*",
			where="active = 1 AND started = 1 AND current_date < DATE_ADD(startdate,INTERVAL duration DAY)",
			order="DATE_ADD(startdate,INTERVAL duration DAY) DESC",
			include="bids"
		);
	}
}