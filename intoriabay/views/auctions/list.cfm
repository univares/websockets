<cfoutput>
	<cfloop query="auctions">
		<div class="row">
    		<div class="col-md-2">
				#linkTo(text=imageTag(source='#auctions.id#.jpg', height="96", width="96"), route="auction_detail", auctionid="#auctions.id#")#
			</div>
			<div class="col-md-8">
				<h3>#auctions.title#</h3>
				<div class="desc">#auctions.description#</div>
			</div>
			<div class="col-md-2">
				<cfif IsNumeric(auctions.maxbidprice) AND auctions.maxbidprice NEQ 0>
					<dd>#auctions.maxbidprice#</dd>
				<cfelse>
					<dd>$#auctions.startingprice#</dd>
				</cfif>
			</div>
		</div>
	</cfloop>
</cfoutput>