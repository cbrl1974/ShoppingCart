<table class="tableresults">
    <h2>Installation</h2>
    <thead>
        <tr>
            <th>ID</th>
            <th>description EN</th>
            <th>description FR</th>
            <th>Required</th>
            <th>Selected By Default?</th>
        </tr>
    </thead>
    <tbody>
        <cfoutput query="getInstallationInfo">
            <cfset default = selectedByDefault eq 1? "Yes":"No">
            <cfset mandatory = required eq 1? "Yes":"No">
        <tr>
            <td>#id#</td>
            <td>#description_1#</td>
            <td>#description_2#</td>
            <td>#mandatory#</td>
            <td>#default#</td>
        </tr>
        </cfoutput>
    </tbody>
</table>

<cfset column_names= getInstallationwithZones.getColumnNames()>
<cfif isQuery(getInstallationwithZones) and getInstallationwithZones.recordcount GT 0>
    <table>
        <thead>
            <tr>
            <cfoutput>
                <cfloop array="#column_names#" index="column">
                <th>#column#</th>
                </cfloop>
            </cfoutput>
            </tr>
        </thead>
        <tbody>
            <cfoutput query="getInstallationwithZones">
                <cfset thisCode = code eq ""? "Null": code>
            <tr>
                <td>#ID#</td>
                <td>#merchantinstallationid#</td>
                <td>#MerchantZoneID#</td>
                <td>#name_1#</td>
                <td>#countryCode#</td>
                <td>#stateCode#</td>
                <td>#postalcode#</td>
                <td>#thisCode#</td>
                <td>#numberFormat(cost, "$___,__")#</td>
            </tr>
            </cfoutput>
        </tbody>
    </table>
<cfelse>
    <h2>No Records found for Istallations zones</h2>
</cfif>