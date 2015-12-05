component extends="Model" {
	function init() {
		// watch for case
		belongsTo("auction");
		belongsTo("customer");

		validatesFormatOf(property="amount", regEx="^-?(?:0|[1-9]\d{0,2}(?:,?\d{3})*)(?:\.\d+)?$");

		validate(property="amount", when="onCreate", method="ValidateAmount");
		afterCreate("NotifyChannel");
	}

	function ValidateAmount() {
		max_bid = model("Auction").findAll(
			select="MAX(bids.amount) + minimumincrement as maxbidprice",
			where="auctionid=1",
			include="bids"
		);

		if (this.amount < max_bid.maxbidprice) {
			WriteLog(text="failed to add new bid, price #this.amount# below max price of #max_bid.maxbidprice#", type="Information", file="socket");
			addError(property="amount", message="Amount below max bid price. Bid should be #max_bid.maxbidprice# or greater");
		}
		return true;
	}

	function NotifyChannel() {
		auction = model("Auction").FindByKey(key=this.auctionid);
		channel = auction.socketchannel;
		// notify the page that the bid has changed
		wsPublish(auction.socketchannel, lcase(serializeJSON(this)));

		// notify the list that the bid item has changed
		wsPublish('auction_list', lcase(serializeJSON(this)));
	}
}