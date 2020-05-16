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