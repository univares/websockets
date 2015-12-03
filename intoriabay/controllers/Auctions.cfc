component extends="Controller" accessors=true output=false persistent=false {
	function detail() {
		auction = model('Auction').findByKey(
			key=params.auctionid,
			select="MAX(bids.amount) as maxbidprice,auctions.*",
			where="active = 1 AND started = 1 AND current_date < DATE_ADD(startdate,INTERVAL duration DAY)",
			order="DATE_ADD(startdate,INTERVAL duration DAY) DESC",
			include="Bid"
		);
	}

	function bid() {

	}

	function list() {
		auctions = model('Auction').findAll(
			select="MAX(bids.amount) as maxbidprice,auctions.*",
			where="active = 1 AND started = 1 AND current_date < DATE_ADD(startdate,INTERVAL duration DAY)",
			order="DATE_ADD(startdate,INTERVAL duration DAY) DESC",
			include="Bid"
		);
	}
}