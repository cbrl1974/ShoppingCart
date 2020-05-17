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
<cfif isQuery(getInstallationwithZones) and getInstallationwithZones.recordcount GT 0>
    <table class="tableresults">
        <h2>Installation with Zones</h2>					
        <thead>
            <tr>						
                <th>ID</th>
                <th>ZoneID</th>
                <th>code</th>
                <th>cost</th>
            </tr>
        </thead>
        <tbody>
            <cfoutput query="getInstallationwithZones">
            <tr>						
                <td>#ID#</td>
                <td>#MerchantZoneID#</td>
                <td>#code#</td>
                <td>#cost#</td>
            </tr>
            </cfoutput>
        </tbody>				
    </table>
<cfelse>
    <h2>No Records found for Istallations zones</h2>
</cfif>