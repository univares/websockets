<cfsetting showDebugOutput=False>
<cfscript>
	json = {
		"auctions": []
	};

	for(row in auctions) {
		startingprice = 0;
		if (IsNumeric(row.maxbidprice) AND row.maxbidprice NEQ 0) {
			startingprice =	row.maxbidprice;
		} else {
			startingprice =	row.startingprice;
		}
		arrayAppend(json.auctions, {
			"id": row.id,
			"title": row.title,
			"description": row.description,
			"startdate": dateformat(row.startdate, "long"),
			"duration": row.duration,
			"socketchannel": row.socketchannel,
			"startingprice": numberFormat(startingprice, "0.00")
		});
	};
	WriteOutput(serializeJson(json));
</cfscript>