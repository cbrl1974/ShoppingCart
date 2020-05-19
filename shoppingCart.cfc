<cfcomponent  displayName="Shopping Cart CFC">

	<cfset variables.instance ={
		dsn = '',
		thisShippingID = '',
		retailerID=''
	}/>

	<cfset variables.instance.dsn = "datatail"/>
	<cfset variables.instance.retailerID = structKeyExists(form,"retailerID") and form.retailerID neq ""?form.retailerID: 0>
	<cfset getShippingInfo = getRetailerShippingForCart()/>
	<cfset variables.instance.thisShippingID  = valueList(getShippingInfo.shippingID)/>



	<cffunction name="getRetailerInfoForCart" access="public" returntype="query">
		<cfquery name="getRetailerInfo" datasource="#variables.instance.dsn#">
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
				m.id = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.instance.retailerID#">
				AND mwf.featurecode in('shippingOptionTypes', 'shoppingCartType')
		</cfquery>
		<cfreturn getRetailerInfo>
	</cffunction>

	<cffunction name="getRetailerShippingForCart" access="public" returntype="query">
		<cfquery name="getShippingInfo" datasource="#variables.instance.dsn#">
			select
			 	ms.id as shippingID,
			  	ms.name_1
			from
				merchantShipping ms
			where
				ms.merchant_id = <cfqueryparam cfsqltype="cf_sql_integer"  value="#variables.instance.retailerID#">
		</cfquery>
		<cfreturn getShippingInfo>
	</cffunction>

	<cffunction name="getShippingByQuantity" access="public" returntype="any">
		<cfset shippingOptionType = getRetailerInfoForCart()/>
		<cfset data = 0/>

		<cfif structKeyExists(shippingOptionType,"shippingOption") and listFindNocase(shippingOptionType.shippingOption,"merchantShippingByCartTotalItemQuantities") and variables.instance.thisShippingID neq "">
			<cfquery name="data" datasource="#variables.instance.dsn#">
				SELECT
					*
				FROM
					MerchantShippingPricesByQuantity
				where
					merchantshippingid in (#variables.instance.thisShippingID#)
			</cfquery>
		</cfif>

		<cfreturn data>

	</cffunction>

	<cffunction name="getShippingByValueRanges" access="public" returntype="any">
		<cfset shippingOptionType = getRetailerInfoForCart()/>
		<cfset data = 0/>

		<cfif structKeyExists(shippingOptionType,"shippingOption") and listFindNocase(shippingOptionType.shippingOption,"merchantShippingByCartTotalItemsValueRange") and variables.instance.thisShippingID neq "">
			<cfquery name="data" datasource="#variables.instance.dsn#">
				SELECT
					*
				FROM
					MerchantShippingPricesByValueRanges
				where
					merchantshippingid in (#variables.instance.thisShippingID#)
			</cfquery>
		</cfif>

		<cfreturn data>

	</cffunction>

	<cffunction name="getShippingByShippingPrices" access="public" returntype="any">
		<cfset shippingOptionType = getRetailerInfoForCart()/>
		<cfset data = 0/>

		<cfif structKeyExists(shippingOptionType,"shippingOption") and listFindNocase(shippingOptionType.shippingOption,"merchantShippingByItem3") and variables.instance.thisShippingID neq "">
			<cfquery name="data" datasource="#variables.instance.dsn#">
				SELECT
					*
				FROM
					merchantshippingprices
				where
				merchantshippingid in (#variables.instance.thisShippingID#)
			</cfquery>
		</cfif>

		<cfreturn data>

	</cffunction>

	<cffunction name="getShippingByLocRings" access="public" returntype="any">
		<cfset shippingOptionType = getRetailerInfoForCart()/>
		<cfset data = 0/>

		<cfif structKeyExists(shippingOptionType,"shippingOption") and listFindNocase(shippingOptionType.shippingOption,"merchantShippingByStoreLocationRings") and variables.instance.thisShippingID neq "">
			<cfquery name="data" datasource="#variables.instance.dsn#">
				SELECT
					*
				FROM
					MerchantShippingPricesByStoreLocRings
				where
					merchantshippingid in (#variables.instance.thisShippingID#)
			</cfquery>
		</cfif>

		<cfreturn data>

	</cffunction>

	<cffunction name="getShippingByRadio" access="public" returntype="any">
		<cfset shippingOptionType = getRetailerInfoForCart()/>

		<cfif structKeyExists(shippingOptionType,"shippingOption") and listFindNocase(shippingOptionType.shippingOption,"merchantShippingByStoreLocationRadio") and variables.instance.thisShippingID neq "">
			<cfquery name="data" datasource="#variables.instance.dsn#">
				SELECT
					*
				FROM
					MerchantShippingPricesByStoreLocRadio
				where
					merchantshippingid in (#variables.instance.thisShippingID#)
			</cfquery>
		</cfif>
		<cfreturn data>

	</cffunction>

	<cffunction name="getRetailertaxesForCart" access="public" returntype="query">
		<cfquery name="getTaxInfo" datasource="#variables.instance.dsn#">
			select
				mt.id as taxID,
				mt.name_1,
				mt.amount,
				mt.taxableItems,mtz.*
			from
				merchanttaxes mt
			inner join merchantTaxZones mtz on mtz.merchanttaxID = mt.id
			where
				mt.merchant_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.instance.retailerID#">
		</cfquery>
		<cfreturn getTaxInfo>
	</cffunction>

	<cffunction name="getInstallationInfoForCart" access="public" returntype="query">
		<cfquery name="getInstallationInfo" datasource="#variables.instance.dsn#">
			select *
			from merchantinstallations
			where
				merchantid = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.instance.retailerID#">
		</cfquery>
		<cfreturn getInstallationInfo>
	</cffunction>

	<cffunction name="getMerchantZonesInfoforCart" access="public" returntype="query">

		<cfquery name="getMerchantZones" datasource="#variables.instance.dsn#">
			select *
			from merchantzones
			where
			merchantid = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.instance.retailerID#">
		</cfquery>
		<cfreturn getMerchantZones>
	</cffunction>

	<cffunction name="getInstallationwithZonesInfoForCart" access="public" returntype="any">
		<cfset installationID = 0>
		<cfset getInstallationwithZones ="">
		<cfset getInstallation= getInstallationInfoForCart()>
		<cfif getInstallation.recordcount GT 0>
			<cfset installationID = getInstallation.id>
			<cfquery name="getInstallationwithZones" datasource="#variables.instance.dsn#">
				select miz.ID,
				miz.MerchantInstallationID,
				miz.MerchantZoneID,
				mz.name_1,
				mzc.countrycode,
				mzc.statecode,
				mzc.postalcode,
				miz.code,
				miz.cost
				from merchantinstallationzones miz
				join merchantzones mz on mz.id = miz.MerchantZoneID
				join merchantzonecodes mzc on mzc.merchantzoneid = miz.merchantZoneid
				where
				miz.merchantinstallationID = <cfqueryparam cfsqltype="cf_sql_integer" value="#installationID#">
			</cfquery>
		</cfif>
		<cfreturn getInstallationwithZones>
	</cffunction>

	<cffunction name="getInstallationPicesInfoForCart" access="public" returntype="any">
		<cfset installationID = 0>
		<cfset getInstallationPrices ="">
		<cfset getInstallation= getInstallationInfoForCart()>
		<cfif getInstallation.recordcount GT 0>
			<cfset installationID = getInstallation.id>
			<cfquery name="getInstallationPrices" datasource="#variables.instance.dsn#">
				select ID,
				MerchantInstallationID,
				code,
				cost
				from merchantinstallationprices
				where
				merchantinstallationID = <cfqueryparam cfsqltype="cf_sql_integer" value="#installationID#">
			</cfquery>
		</cfif>
		<cfreturn getInstallationPrices>
	</cffunction>

	<cffunction name="getInstallationFiltersInfoForCart" access="public" returntype="any">
		<cfset installationID = 0>
		<cfset getInstallationFilters ="">
		<cfset getInstallation= getInstallationInfoForCart()>
		<cfif getInstallation.recordcount GT 0>
			<cfset installationID = getInstallation.id>
			<cfquery name="getInstallationFilters" datasource="#variables.instance.dsn#">
				select *
				from merchantinstallationfilters
				where
				merchantinstallationID = <cfqueryparam cfsqltype="cf_sql_integer" value="#installationID#">
			</cfquery>
		</cfif>
		<cfreturn getInstallationFilters>
	</cffunction>

</cfcomponent>