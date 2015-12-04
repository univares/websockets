<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <title>IntoriaBay</title>

	<!-- Latest compiled and minified CSS -->
	<!---link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"--->
	<cfoutput>
		#styleSheetLinkTag("bootstrap.min.css")#
		#styleSheetLinkTag("theme.css")#
	</cfoutput>
  </head>
<!-- NAVBAR
================================================== -->

  <body role="document">

    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Intoria-Bay</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
			<li class="active"><cfoutput>#linkTo(text="Home", route="home")#</cfoutput></li>
			<cfif StructKeyExists(session, "user")>
				<li><cfoutput>#linkTo(text="Auctions", Controller="Auctions", action="list")#</cfoutput></li>
				<li><cfoutput>#linkTo(text="Logout", controller="Customer", action="logout")#</cfoutput></li>
	            <li><a href="http://dealers.meridianmfg.com">Chat Example</a></li>
			<cfelse>
				<li><cfoutput>#linkTo(text="Login", controller="Customer", action="login")#</cfoutput></li>
			</cfif>

          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container theme-showcase" role="main">

    	<cfoutput>
			#includeContent()#
		</cfoutput>

    </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

  </body>
</html>