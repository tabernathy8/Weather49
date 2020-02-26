<jsp:include page="header.jsp"/>
<jsp:include page="navigation.jsp"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:if test = "${cityName != null}">
   <c:if test="${alert.NumberOfAlerts() > 0}">
            <br>
            <form style ="padding-top: 10px; padding-bottom: 10px; background-color: red; width: 100%; color: black; font-family: Open Sans; margin: 0%"><div>
            <h1 style = "color: whitesmoke; text-align: center;">Special Weather Alert</h1>
            <c:forEach var = "i" begin = "0" end = "${alert.NumberOfAlerts() - 1}">
                <center>
                    <p style="color: whitesmoke;">A ${alert.getAlertTitle(i)} begins at ${alert.getAlertTime(i)} and  will expires at ${alert.getAlertExpireTime(i)}</p>
                </center>
                <br>
                    
            </c:forEach>
            <center><input style ="align-content: center; background-color: red;" type = "submit" value = "Click here to see more on the Alert(s)" name = "alert" ></center><input type="hidden" value = "alerts" name = "action"></div></form>
        </c:if>
    </c:if>
    <h1 class = "fiveday">Weather Over the Next Four Days in ${cityName}</h1>
    <ul>
        <c:forEach var = "i" begin = "0" end = "3">
            <li class = "fiveday">
        <p class = "y">${x.get(i).getDt_txt().substring(0,10)}</p>
        <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Clouds')}">
            <img class = "micah" src="media/overcast.png" alt="overcast.png" height = 75 width = 75>
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
                    <p>High: Data Not Available at this Time</p>
                    <p>Low: Data Not Available at this Time</p>
                    <p>Data Not Available at this Time</p>
                </c:otherwise>
            </c:choose>
        </c:if>
        
        <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Clear')}">
            <img class = "micah" src="media/clear.png" alt="clear.png" height = 75 width = 75>
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
                    <p>High: Data Not Available at this Time</p>
                    <p>Low: Data Not Available at this Time</p>
                    <p>Data Not Available at this Time</p>
                </c:otherwise>
            </c:choose>
        </c:if>
        
        <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Rain')}">
            <img class = "micah" src="media/rainy.png" alt="rainy.png" height = 75 width = 75>
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
                    <p>High: Data Not Available at this Time</p>
                    <p>Low: Data Not Available at this Time</p>
                    <p>Data Not Available at this Time</p>
                </c:otherwise>
            </c:choose>
        </c:if>
        <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Thunderstorm')}">
            <img class = "micah" src="media/thunder.png" alt="thunder.png" height = 75 width = 75>
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
                    <p>High: Data Not Available at this Time</p>
                    <p>Low: Data Not Available at this Time</p>
                    <p>Data Not Available at this Time</p>
                </c:otherwise>
            </c:choose>
        </c:if>
        <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Snow')}">
            <img class = "micah" src="media/snow.png" alt="snow.png" height = 75 width = 75>
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
                    <p>High: Data Not Available at this Time</p>
                    <p>Low: Data Not Available at this Time</p>
                    <p>Data Not Available at this Time</p>
                </c:otherwise>
            </c:choose>
        </c:if>
        <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Drizzle')}">
            <img class = "micah" src="media/drizzle.png" alt="drizzle.png" height = 75 width = 75>
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
                    <p>High: Data Not Available at this Time</p>
                    <p>Low: Data Not Available at this Time</p>
                    <p>Data Not Available at this Time</p>
                </c:otherwise>
            </c:choose>
        </c:if>
        <c:if test = "${x.get(i).getWeatherStates().get(0).getWeatherGroup().equals('Mist')}">
            <img class = "micah" src="media/mist.png" alt="mist.png" height = 75 width = 75>
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
                    <p>High: Data Not Available at this Time</p>
                    <p>Low: Data Not Available at this Time</p>
                    <p>Data Not Available at this Time</p>
                </c:otherwise>
            </c:choose>
        </c:if>            
    </li>
        </c:forEach>
    
    </ul>
<jsp:include page="footer.jsp"/>