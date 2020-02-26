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
<div class="details">
    <h1 style="font-size: 50px">${cityName}</h1>
    <p>Current Temperature: ${current}&#8457</p>
    <p>High: ${high}&#8457</p>
    <p>Low: ${low}&#8457</p>
    <p>Sunrise: ${sunUp}</p>
    <p>Sunset ${sunDown}</p>
    <p>Humidity:  ${humidity}%</p>
    <p>Pressure:  ${pressure} hpa</p>
    <p>Weather: ${weatherDescription}</p>
    <p>Wind Speed: ${wind.getSpeed()} ${wind.getUnit()}</p>
    <c:if test ="${weather.equals('Rain')}">
        <p>Rain Accumulated over the last 3 Hours: ${rain.getRainVolumeLast3Hrs()}${rain.getUnit()}</p>
    </c:if>
    <c:if test="${weather.equals('Snow')}">
        <p>Snow Accumulated over the last 3 Hours: ${snow.getSnowVolumeLast3Hrs()}${snow.getUnit()}</p>
    </c:if>
    

    
</div>

<jsp:include page="footer.jsp"/>