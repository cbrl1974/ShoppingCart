<cfif getInstallationInfo.recordcount EQ 0>
    <h2>No Installations found</h2>
<cfelse>
    <cfset column_names= getInstallationInfo.getColumnNames()>
    <table class="tableresults">
        <h2>Installations</h2>
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
        <cfset column_names= getInstallationwithZones.getColumnNames()>
        <h2>Installation Prices with Zones</h2>
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

    <cfif isQuery(getInstallationPrices) and getInstallationPrices.recordcount GT 0>
        <cfset column_names= getInstallationPrices.getColumnNames()>
        <table>
            <h2>Installation prices no zones</h2>
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
                <cfoutput query="getInstallationPrices">
                    <cfset thisCode = code eq ""? "Null": code>
                <tr>
                    <td>#ID#</td>
                    <td>#merchantinstallationid#</td>
                    <td>#MerchantZoneID#</td>
                    <td>#thisCode#</td>
                    <td>#numberFormat(cost, "$___,__")#</td>
                </tr>
                </cfoutput>
            </tbody>
        </table>
    <cfelse>
        <h2>No Records found for Installations Prices</h2>
    </cfif>

    <cfif isQuery(getInstallationFilters) and getInstallationFilters.recordcount GT 0>
        <cfset column_names= getInstallationFilters.getColumnNames()>
        <table>
            <h2>Installation filters no zones</h2>
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
            <cfoutput query="getInstallationFilters">
                    <tr>
                        <td>#merchantInstallationID#</td>
                        <td>#id_product#</td>
                        <td>#model#</td>
                        <td>#id_cie#</td>
                        <td>#cie#</td>
                        <td>#id_category#</td>
                        <td>#category#</td>
                        <td>#id_subcategory#</td>
                        <td>#subcategory#</td>
                        <td>#id#</td>
                        <td>#collection_1#</td>
                    </tr>
            </cfoutput>
            </tbody>
        </table>
    <cfelse>
        <h2>No Records found for Installations Prices</h2>
    </cfif>
</cfif>
