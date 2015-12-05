<cfoutput>
	<div id="auction_ctrl" ng-controller="AuctionCntl">
	<label>Search: <input ng-model="search"></label>
	<div class="row-fluid" ng-repeat="item in auctionlist | filter:search | orderBy:'id'">
		<auction-card element="item"></auction-card>
	</div>

	<cfwebsocket name="mysock" onmessage="bidHandler" subscribeTo="auction_list"/>
	#javaScriptIncludeTag("auctions/list.js")#
</cfoutput>