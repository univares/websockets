<cfoutput>
    <div class="row">
		<div class="col-md-3">
			#imageTag(source='#auction.id#.jpg', height="200", width="200")#
		</div>
		<div class="col-md-9">
			<h3>#auction.title#</h3>
			<div class="col-md-12">
				<p>#auction.description#</p>

				<div class="well" style="max-width:400px;">
					<p>Current bid:
						$<span class="price">
							<cfif IsDefined("auction.maxbidprice") AND IsNumeric(auction.maxbidprice) AND auction.maxbidprice NEQ 0>
								#auction.maxbidprice#
							<cfelse>
								#auction.startingprice#
							</cfif>
						</span>
					</p>
					#startFormTag(route="auction_bid", auctionid="#params.auctionid#")#
					<div class="input-group">
					  <span class="input-group-addon">$</span>
					  <input type="text" class="form-control" placeholder="price">
					</div>
					<div style="padding-top: 7px;">
						<button type="button" class="btn btn-default">Bid</button>
					</div>
					#endFormTag()#
				</div>
			</div>
		</div>
    </div>
</cfoutput>