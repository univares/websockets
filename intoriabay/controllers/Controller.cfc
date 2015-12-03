component extends="Wheels" {
	function init() {
		filters(through="checkLogin", except="login,signin,home,auction_list");
	}

	function checkLogin() {
		if (! StructKeyExists(session, "user")) {
			redirectTo(controller="Customer", action="login");
		}
	}
}
