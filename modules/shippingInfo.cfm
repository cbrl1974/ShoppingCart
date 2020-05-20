<table>
    <h2>Shipping Info</h2>
        <thead>
            <tr>
                <th>Shipping ID</th>
                <th>Shipping name</th>
            </tr>
        </thead>
        <tbody>
            <cfoutput query="getShippingInfo">
            <tr>
                <td>#shippingID#</td>
                <td>#name_1#</td>
            </tr>
            </cfoutput>
        </tbody>
    </table>

    <cfoutput>
        <cfif isQuery(getShippingByQuantity) and getShippingByQuantity.recordcount neq 0>
            <table>
            <h2>Shipping Info By quantities</h2>					
                <thead>
                    <tr>						
                        <th>ID</th>
                        <th>Shipping ID</th>
                        <th>Merchant Zone ID</th>
                        <th>From Quantity</th>
                        <th>To Quantity</th>
                        <th>Base Price</th>
                        <th>Per Item Price</th>
                    </tr>
                </thead>
                <tbody>
                    <cfloop query="getShippingByQuantity">
                    <tr>						
                        <td>#merchantShippingID#</td>
                        <td>#merchantzoneID#</td>
                        <td>#fromQuantity#</td>
                        <td>#fromQuantity#</td>
                        <td>#ToQuantity#</td>
                        <td>#numberFormat(baseprice,"$_.__")#</td>
                        <td>#numberFormat(perItemprice,"$_.__")#</td>
                    </tr>
                </cfloop>
                </tbody>				
            </table>
        </cfif>
        <cfif isQuery(getShippingByValueRanges) and getShippingByValueRanges.recordcount neq 0>
            <table>
                <h2>Shipping Info By value range</h2>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Shipping ID</th>
                        <th>Low Price</th>
                        <th>High Price</th>
                        <th>cost</th>
                        <th>Zone ID</th>
                        <th>Percentage per cost</th>
                    </tr>
                </thead>
                <tbody>
                    <cfloop query="getShippingByValueRanges">
                    <tr>
                        <td>#id#</td>
                        <td>#merchantShippingID#</td>
                        <td>#lowPrice#</td>
                        <td>#highPrice#</td>
                        <td>#numberFormat(cost,"$_.__")#</td>
                        <td>#merchantZoneId#</td>
                        <td>#numberFormat(percentcost,"$_.__")#</td>
                    </tr>
                </cfloop>
                </tbody>
            </table>
        </cfif>
        <cfif isQuery(getShippingByShippingPrices) and  getShippingByShippingPrices.recordcount neq 0>
            <table>
                <h2>Shipping Info By price</h2>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>cat ID</th>
                        <th>Collection ID</th>
                        <th>High Price</th>
                        <th>Low Price</th>
                        <th>Department ID</th>
                        <th>Shipping ID</th>
                        <th>Zone ID</th>
                        <th>Price</th>
                        <th>productID</th>
                        <th>subcat id</th>
                    </tr>
                </thead>
                <tbody>
                    <cfloop query="getShippingByShippingPrices">
                    <tr>
                        <td>#id#</td>
                        <td>#catId#</td>
                        <td>#Brandid#</td>
                        <td>#collectionId#</td>
                        <td>#lowPrice#</td>
                        <td>#highPrice#</td>
                        <td>#merchantDepartmentId#</td>
                        <td>#merchantShippingId#</td>
                        <td>#merchantZoneId#</td>
                        <td>#numberFormat(price,"$_.__")#</td>
                        <td>#productId#</td>
                        <td>#subCatId#</td>
                    </tr>
                </cfloop>
                </tbody>
            </table>
        </cfif>
        <cfif isQuery(getShippingByRadio) and getShippingByRadio.recordcount neq 0>
            <table>
                <h2>Shipping Info By radio single</h2>
                <thead>
                    <tr>
                        <th>Shipping ID</th>
                        <th>Store ID</th>
                        <th>Radius</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <cfloop query="getShippingByRadio">
                    <tr>
                        <td>#merchantShippingID#</td>
                        <td>#merchantstoreID#</td>
                        <td>#radio#</td>
                        <td>#numberFormat(price,"$_.__")#</td>
                    </tr>
                </cfloop>
                </tbody>
            </table>
        </cfif>
        <cfif isQuery(getShippingByLocRings) and getShippingByLocRings.recordcount neq 0>
            <table>
                <h2>Shipping Info By radiuses</h2>
                <thead>
                    <tr>
                        <th>Shipping ID</th>
                        <th>Store ID</th>
                        <th>Initial Radius</th>
                        <th>Final Radius</th>
                        <th>Price</th>
                        <th>Price Per km</th>
                    </tr>
                </thead>
                <tbody>
                    <cfloop query="getShippingByLocRings">
                    <tr>
                        <td>#merchantShippingID#</td>
                        <td>#merchantstoreID#</td>
                        <td>#initialRadius#</td>
                        <td>#finalRadius#</td>
                        <td>#numberFormat(pricebase,"$_.__")#</td>
                        <td>#numberFormat(pricePerKM,"$_.__")#</td>
                    </tr>
                </cfloop>
                </tbody>
            </table>
        </cfif>
    </cfoutput>