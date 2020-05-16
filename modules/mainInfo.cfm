
<table class="tableresults">
    <h2>Main Info</h2>					
    <thead>
        <tr>
            <th>Merchant ID</th>
            <th>Merchant</th>
            <th>Shipping Option</th>
            <th>Payment Gateway</th>
        </tr>
    </thead>
    <tbody>
        <cfoutput query="getRetailerInfo">
        <tr>
            <td>#id#</td>
            <td>#merchant#</td>
            <td>#ShippingOption#</td>
            <td>#Paymenttype#</td>
        </tr>
        </cfoutput>
    </tbody>				
</table>