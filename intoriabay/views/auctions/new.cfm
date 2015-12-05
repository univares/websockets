<cfoutput>
	<div class="col-md-12">

	<cfif len(errorMessagesFor("auction"))>
		<div class="panel panel-warning">
			<div class="panel-heading">
				<h3 class="panel-title">Errors found with submission</h3>
			</div>
			<div class="panel-body">
				#errorMessagesFor("auction")#
			</div>
		</div>
	</cfif>


	#startFormTag(route="auction_new")#
		<div class="form-group">
			#textField(objectName="auction", property="title", class="form-control", autofocus=True)#
		</div>

		<div class="form-group">
			#textArea(objectName="auction", property="description", class="form-control", rows="3", cols="40")#
		</div>

		<div class="form-group">
			#textField(objectName="auction", property="duration", class="form-control", placeholder="1")#
		</div>

		<div class="form-group">
			<label>Starting Price</label>
			<div class="input-group">
			  <span class="input-group-addon">$</span>
			  #textField(label="", objectName="auction", type="number", step="0.01", property="startingprice", class="form-control", placeholder="1.00")#
			</div>
		</div>


		<div class="form-group">
			<label>Minimum Increment</label>
			<div class="input-group">
			  <span class="input-group-addon">$</span>
			  #textField(label="", objectName="auction", type="number", step="0.01", property="minimumincrement", class="form-control", placeholder="1.00")#
			</div>
		</div>

		<div style="padding-top: 7px;">
			<button class="btn btn-default" type="submit">Add</button>
		</div>
	#endFormTag()#
	</div>
</cfoutput>