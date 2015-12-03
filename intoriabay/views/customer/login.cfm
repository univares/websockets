<cfoutput>
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Sign in to continue to Intoria's Auction Site</h1>


				<cfif len(flash("error"))>
					<div class="btn-block btn-lg btn-primary alert alert-danger alert-dismissable">
					   <button type="button" class="close" data-dismiss="alert"
					      aria-hidden="true">
					      &times;
					   </button>
					   #flash("error")#
					</div>
				</cfif>
            <div class="account-wall">
			    #startFormTag(action="signin", class="form-signin")#
					#textField(label="username", objectName="customer", property="username", class="form-control", placeholder="username", autofocus=True)#
					#passwordField(label="password", objectName="customer", property="password", class="form-control", placeholder="password")#
					<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                #endFormTag()#
            </div>
        </div>
    </div>
</cfoutput>