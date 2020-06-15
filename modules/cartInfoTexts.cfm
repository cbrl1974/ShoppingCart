<cfif getInfoTexts.recordcount EQ 0>
    <h2>No Installations found</h2>
<cfelse>
    <cfset column_names= getInfoTexts.getColumnNames()>
    <table class="tableresults">
        <h2>Cart Info Texts</h2>
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
            <cfoutput query="getInfoTexts">
            <tr>
                <td>#id#</td>
                <td>#textcode#</td>
                <td>#content_1#</td>
                <td>#content_2#</td>
            </tr>
            </cfoutput>
        </tbody>
    </table>
</cfif>

