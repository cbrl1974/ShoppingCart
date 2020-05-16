<table class="tableresults">
    <h2>Tax Info</h2>					
    <thead>
        <tr>						
            <th>Tax ID</th>
            <th>Tax Name</th>
            <th>Tax Amount</th>
            <th>Taxable Items</th>
            <th>Country Code</th>
            <th>Province/State Code</th>
            <th>Postal Code/ZipCode</th>
        </tr>
    </thead>
    <tbody>
        <cfoutput query="getTaxInfo">
        <tr>						
            <td>#taxID#</td>
            <td>#name_1#</td>
            <td>#amount#</td>
            <td>#taxableItems#</td>
            <td>#countryCode#</td>
            <td>#provinceCode#</td>
            <td>#postalCode#</td>
        </tr>
        </cfoutput>
    </tbody>				
</table>