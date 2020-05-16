<cfcomponent  displayName="Shopping Cart CFC">
	<cfset variables.dsn = 'datatail'>
	<cfset variables.retailerID = structKeyExists(form,"retailerID") and form.retailerID neq ""?form.retailerID: 0>	
		
	<cffunction name="getRetailerInfoForCart" access="public" returntype="query">
		<cfquery name="getRetailerInfo" datasource="#variables.dsn#">
			SELECT
				m.merchant,
				m.id,
				mwf.featurevalue AS ShippingOption,
				mwt.featurevalue AS PaymentType
			FROM
				merchants m
				INNER JOIN merchantwebsitefeatures mwf ON mwf.merchant_id = m.id
					AND mwf.featurecode = 'shippingOptionTypes'
				RIGHT JOIN merchantwebsitefeatures mwt ON mwt.merchant_id = m.id
					AND mwt.featurecode = 'shoppingCartType'
			WHERE
				m.id = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.retailerID#">
				AND mwf.featurecode in('shippingOptionTypes', 'shoppingCartType')
		</cfquery>	
		<cfreturn getRetailerInfo>
	</cffunction>

	<cffunction name="getRetailerShippingForCart" access="public" returntype="query">		
		<cfquery name="getShippingInfo" datasource="#variables.dsn#">
			select
			 	ms.id as shippingID,
			  	ms.name_1
			from
				merchantShipping ms 
			where
				ms.merchant_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.retailerID#">	
		</cfquery>
		<cfreturn getShippingInfo>
	</cffunction>

	<cffunction name="getShippingByQuantity" access="public" returntype="any">
		
		<cfset shippingOptionType = getRetailerInfoForCart()/>
		<cfset shipping = getRetailerShippingForCart()/>
		<cfset data = 0/>

		<cfif structKeyExists(shippingOptionType,"shippingOption") and shippingOptionType.shippingOption neq "">			
			<cfquery name="data" datasource="#variables.dsn#">
				SELECT
					*
				FROM				
					MerchantShippingPricesByQuantity					
				where
					merchantshippingid in (#shipping.shippingID#)
			</cfquery>
		</cfif>	

		<cfreturn data>

	</cffunction>

	<cffunction name="getShippingByValueRanges" access="public" returntype="any">
		
		<cfset shippingOptionType = getRetailerInfoForCart()/>
		<cfset shipping = getRetailerShippingForCart()/>
		<cfset data = 0/>

		<cfif structKeyExists(shippingOptionType,"shippingOption") and shippingOptionType.shippingOption neq "">			
			<cfquery name="data" datasource="#variables.dsn#">
				SELECT
					*
				FROM
					MerchantShippingPricesByValueRanges
					
				where
					merchantshippingid in (#shipping.shippingID#)
			</cfquery>
		</cfif>	

		<cfreturn data>

	</cffunction>

	<cffunction name="getShippingByShippingPrices" access="public" returntype="any">
		
		<cfset shippingOptionType = getRetailerInfoForCart()/>
		<cfset shipping = getRetailerShippingForCart()/>
		<cfset data = 0/>

		<cfif structKeyExists(shippingOptionType,"shippingOption") and shippingOptionType.shippingOption neq "">			
			<cfquery name="data" datasource="#variables.dsn#">
				SELECT
					*
				FROM
					merchantshippingprices					
				where
					merchantshippingid in (#shipping.shippingID#)
			</cfquery>
		</cfif>	

		<cfreturn data>

	</cffunction>

	<cffunction name="getShippingByLocRings" access="public" returntype="any">
		
		<cfset shippingOptionType = getRetailerInfoForCart()/>
		<cfset shipping = getRetailerShippingForCart()/>
		<cfset data = 0/>

		<cfif structKeyExists(shippingOptionType,"shippingOption") and shippingOptionType.shippingOption neq "">			
			<cfquery name="data" datasource="#variables.dsn#">
				SELECT
					*
				FROM
					MerchantShippingPricesByStoreLocRings					
				where
					merchantshippingid in (#shipping.shippingID#)
			</cfquery>
		</cfif>	

		<cfreturn data>

	</cffunction>

	<cffunction name="getShippingByRadio" access="public" returntype="any">
		
		<cfset shippingOptionType = getRetailerInfoForCart()/>
		<cfset shipping = getRetailerShippingForCart()/>
		<cfset data = 0/>

		<cfif structKeyExists(shippingOptionType,"shippingOption") and shippingOptionType.shippingOption neq "">			
			<cfquery name="data" datasource="#variables.dsn#">
				SELECT
					*
				FROM
					MerchantShippingPricesByStoreLocRadio					
				where
					merchantshippingid in (#shipping.shippingID#)
			</cfquery>
		</cfif>	

		<cfreturn data>

	</cffunction>	

	<cffunction name="getRetailertaxesForCart" access="public" returntype="query">
		<cfquery name="getTaxInfo" datasource="#variables.dsn#">
			select 
				mt.id as taxID,
				mt.name_1,
				mt.amount,
				mt.taxableItems,mtz.*
			from
				merchanttaxes mt
			inner join merchantTaxZones mtz on mtz.merchanttaxID = mt.id
			where 
				mt.merchant_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.retailerID#">	
		</cfquery>
		<cfreturn getTaxInfo>
	</cffunction>

	<cffunction name="getInstallationInfoForCart" access="public" returntype="query">
		<cfquery name="getInstallationInfo" datasource="#variables.dsn#">
			select *
			from merchantinstallations
			where 
				merchantid = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.retailerID#">	
		</cfquery>
		<cfreturn getInstallationInfo>
	</cffunction>
</cfcomponent>