<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:rest="www.tastytreats.com/fooddeliverywebsite"
    exclude-result-prefixes="rest">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- Root template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Food Delivery</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    table, th, td {
                        border: 1px solid black;
                    }
                    th, td {
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <h2>Menu</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Hours</th>
                        <th>Dish</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Reviews</th>
                    </tr>
                    <!-- Loop through each restaurant -->
                    <xsl:for-each select="rest:fooddeliverywebsite/rest:restaurant">
                        <xsl:variable name="restaurant-id" select="@id"/>
                        <xsl:variable name="restaurant-name" select="rest:restaurant-name"/>
                        <xsl:variable name="hours" select="rest:hours"/>
                        <xsl:variable name="reviews" select="rest:reviews/rest:review"/>
                        <xsl:for-each select="rest:menu/rest:dish">
                            <tr>
                                <td><xsl:value-of select="$restaurant-id"/></td>
                                <td><xsl:value-of select="$restaurant-name"/></td>
                                <td><xsl:value-of select="$hours"/></td>
                                <td><xsl:value-of select="rest:dish-name"/></td>
                                <td><xsl:value-of select="rest:description"/></td>
                                <td>$<xsl:value-of select="rest:price"/></td>
                                <td>
                                    <!-- Loop through each review -->
                                    <xsl:for-each select="$reviews">
                                        <div><xsl:value-of select="."/></div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
