<cfset shoppingCartCfcObject = createObject("component","shoppingCart")/>

<cfset getRetailerInfo =shoppingCartCfcObject.getRetailerInfoForCart()>
<cfset getTaxInfo =shoppingCartCfcObject.getRetailertaxesForCart()>
<cfset getShippingInfo =shoppingCartCfcObject.getRetailerShippingForCart()>
<cfset getShippingByQuantity =shoppingCartCfcObject.getShippingByQuantity()>
<cfset getShippingByValueRanges =shoppingCartCfcObject.getShippingByValueRanges()>
<cfset getShippingByShippingPrices =shoppingCartCfcObject.getShippingByShippingPrices()>
<cfset getShippingByLocRings =shoppingCartCfcObject.getShippingByLocRings()>
<cfset getShippingByRadio =shoppingCartCfcObject.getShippingByRadio()>
<cfset getInstallationInfo =shoppingCartCfcObject.getInstallationInfoForCart()>
<cfset getInstallationwithZones =shoppingCartCfcObject.getInstallationwithZonesInfoForCart()>
<cfset getInstallationPrices =shoppingCartCfcObject.getInstallationPicesInfoForCart()>
<cfset getInstallationFilters =shoppingCartCfcObject.getInstallationFiltersInfoForCart()>
<cfset getInfoTexts =shoppingCartCfcObject.getInfoTextsForCart()>



