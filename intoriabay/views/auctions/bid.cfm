<cfoutput>
    <div class="row">
        <cfscript>
			for (error in bid.allErrors()) {
				WriteDump(error);
			}
		</cfscript>
    </div>
</cfoutput>