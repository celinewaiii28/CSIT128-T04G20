<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="xml" encoding="UTF-8"/>
    <xsl:template match="/forecast">

        <html>
            <head>
                <title>A2-T04G20-8496018,7907503,8550815(Eldwin,Serene,Celine)</title>

                <style type="text/css">
                    table 
                    {
                        table-layout: fixed; width: 990px; height: 40px;
                    }
                </style>
            </head>

            <body>

                <h1>
                    <xsl:value-of select="@queryLocation"/>
                    <xsl:text> [</xsl:text>
                    <xsl:value-of select="@queryTime"/>
                    <xsl:text>] </xsl:text>
                </h1>

                <table border="1">
                    <tr style="background:blue;">
                        <th style="text-align:centre;">
                            <b>Date</b>
                        </th>
                        <th style="text-align:centre;">
                            <b>Mon</b>
                        </th>
                        <th style="text-align:centre;">
                            <b>Tue</b>
                        </th>
                        <th style="text-align:centre;">
                            <b>Wed</b>
                        </th>
                        <th style="text-align:centre;">
                            <b>Thu</b>
                        </th>
                        <th style="text-align:centre;">
                            <b>Fri</b>
                        </th>
                        <th style="text-align:centre;">
                            <b>Sat</b>
                        </th>
                        <th style="text-align:centre;">
                            <b>Sun</b>
                        </th>
                    </tr>

                    <!-- Get Month and Date in ascending order-->
                    <xsl:for-each select="weather">
                        <xsl:sort select="month" data-type="date" order="ascending"/>
                        <xsl:sort select="date" data-type="number" order="ascending"/>
                        <tr>
                            <!--Get Month number to alphabetical-->
                            <td style="background:blue; text-align:centre; padding:35px;">
                                <xsl:value-of select="date"/>
                                <xsl:choose>
                                    <xsl:when test="month=1"> Jan</xsl:when>
                                    <xsl:when test="month=2"> Feb</xsl:when>
                                    <xsl:when test="month=3"> Mar</xsl:when>
                                    <xsl:when test="month=4"> Apr</xsl:when>
                                    <xsl:when test="month=5"> May</xsl:when>
                                    <xsl:when test="month=6"> Jun</xsl:when>
                                    <xsl:when test="month=7"> Jul</xsl:when>
                                    <xsl:when test="month=8"> Aug</xsl:when>
                                    <xsl:when test="month=9"> Sep</xsl:when>
                                    <xsl:when test="month=10"> Oct</xsl:when>
                                    <xsl:when test="month=11"> Nov</xsl:when>
                                    <xsl:when test="month=12"> Dec</xsl:when>
                                </xsl:choose>
                            </td>

                            <xsl:choose>
                                <xsl:when test="dayOfWeek='Tue'">
                                    <td></td>
                                </xsl:when>

                                <xsl:when test="dayOfWeek='Wed'">
                                    <td></td>
                                    <td></td>
                                </xsl:when>

                                <xsl:when test="dayOfWeek='Thu'">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </xsl:when>

                                <xsl:when test="dayOfWeek='Fri'">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </xsl:when>

                                <xsl:when test="dayOfWeek='Sat'">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </xsl:when>

                                <xsl:when test="dayOfWeek='Sun'">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </xsl:when>
                            </xsl:choose>

                            <td align="center">
                                <p>
                                    <xsl:value-of select="highest"/>
                                    <xsl:text>° </xsl:text>
                                    <xsl:text> - </xsl:text>
                                    <xsl:value-of select="lowest"/>
                                    <xsl:text>° </xsl:text>
                                </p>

                                <!--Insert image-->
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="overallCode"/>
                                        <xsl:text>.png</xsl:text>
                                    </xsl:attribute>
                                </img>

                                <p>
                                    <!--Color based on overall code -->
                                    <xsl:choose>
                                        <xsl:when test="overallCode='cloudy'">
                                            <span style="color:blue">
                                                <xsl:value-of select="overall"/>
                                            </span>
                                        </xsl:when>

                                        <xsl:when test="overallCode='thunderstorm'">
                                            <span style="color:red">
                                                <xsl:value-of select="overall"/>
                                            </span>
                                        </xsl:when>

                                        <xsl:when test="overallCode='rain'">
                                            <span style="color:red">
                                                <xsl:value-of select="overall"/>
                                            </span>
                                        </xsl:when>

                                        <xsl:when test="overallCode='sunny'">
                                            <span style="color:pink">
                                                <xsl:value-of select="overall"/>
                                            </span>
                                        </xsl:when>

                                        <xsl:when test="overallCode='partlySunny'">
                                            <span style="color:pink">
                                                <xsl:value-of select="overall"/>
                                            </span>
                                        </xsl:when>
                                    </xsl:choose>
                                </p>
                            </td>

                            <!-- Align day of week, fill the remaining box at the back -->
                            <xsl:choose>
                                <xsl:when test="dayOfWeek='Mon'">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </xsl:when>

                                <xsl:when test="dayOfWeek='Tue'">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </xsl:when>

                                <xsl:when test="dayOfWeek='Wed'">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </xsl:when>

                                <xsl:when test="dayOfWeek='Thu'">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </xsl:when>

                                <xsl:when test="dayOfWeek='Fri'">
                                    <td></td>
                                    <td></td>
                                </xsl:when>

                                <xsl:when test="dayOfWeek='Sat'">
                                    <td></td>
                                </xsl:when>
                            </xsl:choose>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
