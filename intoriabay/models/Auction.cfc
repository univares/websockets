component extends="Model" {
	function init() {
		// watch for case
		hasMany("bids");
		afterCreate("NotifyChannel");
	}

	function NotifyChannel() {
		wsPublish("auction_list", lcase(serializeJSON(this)));
	}
}