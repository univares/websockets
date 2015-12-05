component extends="Wheels" {
	function init() {
		filters(through="checkLogin", except="login,signin,home,logout");
	}

	function checkLogin() {
		if (! StructKeyExists(session, "user")) {
			redirectTo(controller="Customer", action="login");
		}
	}

	function getNextAvailableChannel() {
		available_channels = ArrayFilter(GetApplicationMetaData().wschannels, function(struct){
		   return FindNoCase("auction_item", struct.name);
		});

		used_channels = model('Auction').findAll(
			select="socketchannel",
			where="active = 1 AND started = 1 AND current_date < DATE_ADD(startdate,INTERVAL duration DAY)",
			order="DATE_ADD(startdate,INTERVAL duration DAY) DESC"
		);

		return_channel = "";
		for (channel in available_channels) {
			found = False;
			for (db_channel in used_channels) {
				if (channel.name == db_channel.socketchannel) {
					found = True;
				}
			}
			if (found == False) {
				return_channel = channel.name;
				break;
			}
		}
		return return_channel;
	}
}
