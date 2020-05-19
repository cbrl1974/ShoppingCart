<cfset thisShippingOption = valueList(getRetailerInfo.ShippingOption)/>
<cfset titleList = 'Merchant ID,Merchant,Shipping Option,Payment Gateway'/>
<table class="tableresults">
    <h2>Main Info</h2>
    <thead>
        <tr>
            <cfoutput>
            <cfloop list="#titleList#" index="thisTitle">
                <th>#ucase(thisTitle)#</th>
            </cfloop>
            </cfoutput>
        </tr>
    </thead>
    <tbody>
        <cfoutput query="getRetailerInfo">
        <tr>
            <td>#id#</td>
            <td>#merchant#</td>
            <td>
                <cfloop list="#thisShippingOption#" index="thisOption">
                    #thisOption# <br>
                </cfloop>
            </td>
            <td>#Paymenttype#</td>
        </tr>
        </cfoutput>
    </tbody>
</table>