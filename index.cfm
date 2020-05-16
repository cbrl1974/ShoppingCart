

<html>
<head>
	<title>Shopping cart Information</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="js/script.js"></script>
	<link rel="stylesheet" href="styles/style.css" type="text/css" />	
</head>
<body>	

	<h1>Shopping cart Information</h1>

	<div id="mainContent">
					
		<cfinclude template="modules/cfcDefinition.cfm">
		<cfif structKeyExists(form, "setRetailer")>
			<div>
				<cfif getRetailerInfo.recordcount eq 0>
					<h2>No info for cart available at this moment</h2>
				<cfelse>	
					<h2>You've chosen to inquire about cart info for:<br>
					 <cfoutput>#getRetailerInfo.merchant#(#getRetailerInfo.id#)</cfoutput></h2>
				</cfif>	 
			</div>
		</cfif>	
		<div class="formContent">
			<table>	
				<cfform	action="index.cfm" method="post">	
					<thead>
						<tr>
							<th>Retailer:</th>
							<td><cfinput id="retailerID" type="text" name="retailerID"></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><cfinput type="submit" name="setRetailer" value="Set Retailer"></td>
						</tr>
					</tbody>
				</cfform>
			</table>
		</div>
		
		<div class="tab">
			<button class="tablinks" onclick="openCity(event, 'Features')">Features</button>
			<button class="tablinks" onclick="openCity(event, 'Shipping')">Shipping</button>
			<button class="tablinks" onclick="openCity(event, 'Tax')">Tax</button>
		</div>
		
		<cfif isDefined('form.setRetailer')>

			<include template="modules/mainInfo.cfm">
			
			<div class="resultsContent">
				<div id="Features" class="tabcontent">
					<cfinclude template="modules/mainInfo.cfm">
				</div>
				<div id="Shipping" class="tabcontent">
					<cfinclude template="modules/ShippingInfo.cfm">									
				</div>
				<div id="Tax" class="tabcontent">
					<cfinclude template="modules/taxInfo.cfm">			
				</div>
		</cfif>
		</div>
			
	</div>
</body>
</html>