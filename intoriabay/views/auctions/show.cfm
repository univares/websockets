<cfoutput>
	<!--- No angularjs approach--->
    <div class="row">
		<div class="col-md-3">
			#imageTag(source='#auction.id#.jpg', height="200", width="200")#
		</div>
		<div class="col-md-9">
			<h3>#auction.title#</h3>
			<div class="col-md-12">
				<p>#auction.description#</p>

				<div class="well" style="max-width:500px;">
					<p>Current bid:
						$<span class="price">
							<cfif IsDefined("auction.maxbidprice") AND IsNumeric(auction.maxbidprice) AND auction.maxbidprice NEQ 0>
								#auction.maxbidprice#
							<cfelse>
								#auction.startingprice#
							</cfif>
						</span>
					</p>

					<cfif len(flash('error'))><div class="alert alert-danger" role="alert"><strong>Error!</strong> #flash("error")#</div></cfif>
					<cfif len(flash('success'))><div class="alert alert-success" role="alert"><strong>Congratulation!</strong> #flash("success")#</div></cfif>

					#startFormTag(route="auction_bid", auctionid="#params.auctionid#")#
						<div class="input-group">
						  <span class="input-group-addon">$</span>
						  #textField(label="", objectName="bid", property="amount", class="form-control", autofocus=True, placeholder="price")#
						</div>
						<div style="padding-top: 7px;">
							<button class="btn btn-default" type="submit">Bid</button>
						</div>
					#endFormTag()#
				</div>
			</div>
		</div>
    </div>

	<!--- add socket listener --->
	<cfwebsocket name="mysock" onmessage="bidHandler" subscribeto="#auction.socketchannel#"/>
	#javaScriptIncludeTag("auctions/detail.js")#
</cfoutput>