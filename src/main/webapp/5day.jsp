<jsp:include page="header.jsp"/>
<jsp:include page="navigation.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .column {
        float: left;
        width: 50%;
    }

    /* Clear floats after the columns */
    .row:after {
        content: "";
        display: table;
        clear: both;
        margin-bottom: 30px;

    }
    .detail {
        float: left;
        margin-left: 36px;
        margin-top: 4px;
    }

    .micah {
        display: block;
        margin-top: 0px;
        float: right;
        margin-right: auto;
        height: 125px;
        width: 125px;
        border-radius: 50%;
        text-align: right;
    }
</style>


<c:if test = "${cityName != null}">
    <c:if test="${alert.NumberOfAlerts() > 0}">
        <br>
        <form style ="padding-top: 10px; padding-bottom: 10px; background-color: red; margin: 10px; color: black; font-family: Open Sans;"><div>
                <h1 style = "color: whitesmoke; text-align: center; padding-right: 3px; padding-left: 3px">Special Weather Alert</h1>
                <c:forEach var = "i" begin = "0" end = "${alert.NumberOfAlerts() - 1}">
                    <center>
                        <p style="color: whitesmoke; padding-right: 10px; padding-left: 10px">A ${alert.getAlertTitle(i)} begins at ${alert.getAlertTime(i)} and  will expire at ${alert.getAlertExpireTime(i)}</p>
                    </center>
                    <br>

                </c:forEach>
                <center><input style ="align-content: center; background-color: red; width: 95%; font-size: 20px; padding-left: 10px; padding-right: 10px" type = "submit" value = "Click Here to See More" name = "alert" ></center><input type="hidden" value = "alerts" name = "action"></div></form>
                </c:if>
            </c:if>



<h1 class = "fiveday" style = "padding-right: 20px; padding-left: 20px;">Weather Over the Next Four Days in ${cityName}</h1>



<ul style = "padding-left: 0px">
    <c:forEach var = "i" begin = "0" end = "3">
        <hr style ="width:80%;">
        <li class = "fiveday" style = "width: 100%;">
            <p class = "y" style = "font-size: 30px; margin-top: 8px;">${x.get(i).getDt_txt().substring(0,10)}</p>
            <div class="row">

                <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Clouds')}">
                    <div class="column">
                        <img class = "micah" src="media/overcast.png" alt="overcast.png" height = 75 width = 75>
                    </div>
                    <div class="column">
                        <div class="detail">
                            <c:choose>
                                <c:when test="${lowTemps.get(i) > highTemps.get(i)}">
                                    <p>High: ${lowTemps.get(i)}&#8457</p>
                                    <p>Low: ${highTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:when test = "${lowTemps.get(i) < highTemps.get(i)}">
                                    <p>High: ${highTemps.get(i)}&#8457</p> 
                                    <p>   Low: ${lowTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:otherwise>
                                    <p>High: N/A</p>
                                    <p>Low: N/A</p>
                                    <p>N/A</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:if>

                <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Clear')}">
                    <div class="column">
                        <img class = "micah" src="media/clear.png" alt="clear.png" height = 75 width = 75>
                    </div>
                    <div class="column">
                        <div class="detail">
                            <c:choose>
                                <c:when test="${lowTemps.get(i) > highTemps.get(i)}">
                                    <p>High: ${lowTemps.get(i)}&#8457</p>
                                    <p>Low: ${highTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:when test = "${lowTemps.get(i) < highTemps.get(i)}">
                                    <p>High: ${highTemps.get(i)}&#8457</p> 
                                    <p>   Low: ${lowTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:otherwise>
                                    <p>High: N/A</p>
                                    <p>Low: N/A</p>
                                    <p>N/A</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:if>

                <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Rain')}">
                    <div class="column">
                        <img class = "micah" src="media/rainy.png" alt="rainy.png" height = 75 width = 75>
                    </div>
                    <div class="column">
                        <div class="detail">
                            <c:choose>
                                <c:when test="${lowTemps.get(i) > highTemps.get(i)}">
                                    <p>High: ${lowTemps.get(i)}&#8457</p>
                                    <p>Low: ${highTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:when test = "${lowTemps.get(i) < highTemps.get(i)}">
                                    <p>High: ${highTemps.get(i)}&#8457</p> 
                                    <p>   Low: ${lowTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:otherwise>
                                    <p>High: N/A</p>
                                    <p>Low: N/A</p>
                                    <p>N/A</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:if>

                <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Thunderstorm')}">
                    <div class="column">
                        <img class = "micah" src="media/thunder.png" alt="thunder.png" height = 75 width = 75>
                    </div>
                    <div class="column">
                        <div class="detail">
                            <c:choose>
                                <c:when test="${lowTemps.get(i) > highTemps.get(i)}">
                                    <p>High: ${lowTemps.get(i)}&#8457</p>
                                    <p>Low: ${highTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:when test = "${lowTemps.get(i) < highTemps.get(i)}">
                                    <p>High: ${highTemps.get(i)}&#8457</p> 
                                    <p>   Low: ${lowTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:otherwise>
                                    <p>High: N/A</p>
                                    <p>Low: N/A</p>
                                    <p>N/A</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:if>

                <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Snow')}">
                    <div class="column">
                        <img class = "micah" src="media/snow.png" alt="snow.png" height = 75 width = 75>
                    </div>
                    <div class="column">
                        <div class="detail">
                            <c:choose>
                                <c:when test="${lowTemps.get(i) > highTemps.get(i)}">
                                    <p>High: ${lowTemps.get(i)}&#8457</p>
                                    <p>Low: ${highTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:when test = "${lowTemps.get(i) < highTemps.get(i)}">
                                    <p>High: ${highTemps.get(i)}&#8457</p> 
                                    <p>   Low: ${lowTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:otherwise>
                                    <p>High: N/A</p>
                                    <p>Low: N/A</p>
                                    <p>N/A</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:if>

                <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Drizzle')}">
                    <div class="column">
                        <img class = "micah" src="media/drizzle.png" alt="drizzle.png" height = 75 width = 75>
                    </div>
                    <div class="column">
                        <div class="detail">
                            <c:choose>
                                <c:when test="${lowTemps.get(i) > highTemps.get(i)}">
                                    <p>High: ${lowTemps.get(i)}&#8457</p>
                                    <p>Low: ${highTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:when test = "${lowTemps.get(i) < highTemps.get(i)}">
                                    <p>High: ${highTemps.get(i)}&#8457</p> 
                                    <p>   Low: ${lowTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:otherwise>
                                    <p>High: N/A</p>
                                    <p>Low: N/A</p>
                                    <p>N/A</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:if>

                <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Mist')}">
                    <div class="column">
                        <img class = "micah" src="media/mist.png" alt="mist.png" height = 75 width = 75>
                    </div>
                    <div class="column">
                        <div class="detail">
                            <c:choose>
                                <c:when test="${lowTemps.get(i) > highTemps.get(i)}">
                                    <p>High: ${lowTemps.get(i)}&#8457</p>
                                    <p>Low: ${highTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:when test = "${lowTemps.get(i) < highTemps.get(i)}">
                                    <p>High: ${highTemps.get(i)}&#8457</p> 
                                    <p>   Low: ${lowTemps.get(i)}&#8457</p>
                                    <p>${x.get(i).getWeatherStates().get(0).getDescription()}</p>
                                </c:when>
                                <c:otherwise>
                                    <p>High: N/A</p>
                                    <p>Low: N/A</p>
                                    <p>N/A</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:if>     
            </div>
        </li>
    </c:forEach>
    <hr style ="width:80%;">

</ul>
<jsp:include page="footer.jsp"/>