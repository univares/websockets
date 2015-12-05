<cfsetting showDebugOutput=False>
<cfscript>
	if (IsNumeric(auction.maxbidprice) AND auction.maxbidprice NEQ 0) {
		startingprice =	auction.maxbidprice;
	} else {
		startingprice =	auction.startingprice;
	}

	json = {
		"id": auction.id,
		"title": auction.title,
		"description": auction.description,
		"startdate": dateformat(auction.startdate, "long"),
		"duration": auction.duration,
		"socketchannel": auction.socketchannel,
		"startingprice": numberFormat(startingprice, "0.00")
	};
	WriteOutput(serializeJson(json));
</cfscript>