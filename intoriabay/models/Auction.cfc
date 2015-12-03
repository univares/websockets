component extends="Model" accessors=true output=false persistent=false {
	function init() {
		hasMany("Bid");
	}
}