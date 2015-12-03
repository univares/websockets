component extends="Controller" accessors=true output=false persistent=false {
	BCrypt = CreateObject( "java", "com.meridian.BCrypt" );

	function login() {
		customer = model("Customer").new();
	}

	function signin() {
		user = model("Customer").findOne(where="username='#params.customer.username#'");

		if (IsObject(user)) {
			pw = "#params.customer.password#";
			if (BCrypt.checkpw(pw, user.password)) {
				session.user.id = user.id;
				redirectTo(controller="Auctions", action="list");
			} else {
				flashInsert(error="Invalid credentials");
				error = True;
			}
		} else {
			flashInsert(error="user not found");
			error = True;
		}

		if (error) {
			user = model("User").new(username='#params.customer.username#');
			renderPage(action="login");
		}
	}

	function logout() {
		structDelete(session, "user");
		redirectTo(controller="Customer", action="login");
	}
}