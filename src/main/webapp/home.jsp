<jsp:include page="header.jsp"/>
<jsp:include page="navigation.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    temp {
        font-size: 0.5em;
    }
</style>
<c:if test ="${cityName != null}">
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
        
        
    <h1 class = "city" style = "line-height: normal; margin: 10px 10px;">${fullName}</h1>
    <h2 class="current" style="font-size: 130px;padding-top: 5px;margin-bottom: 40px;margin-top: 0px;"><br>${current}<sup><sup><temp>&#xb0</>F</temp></sup></sup></h2>
    <h3 class = "high">${high}<sup>&#xb0</sup> / ${low}<sup>&#xb0</sup></h3>
    
    
    <br><br>
    <c:if test = "${weather.equals('Clouds')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/overcast.png" alt = "Clouds"  width = 250  height = 250 style = "height: 70%; width: 70%; align: center; margin-right: auto; margin-left: auto"><h2 style="font-size: 40px; margin-top: 10px">Cloudy</h2><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br>
    </c:if>
    <c:if test = "${weather.equals('Rain')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/rainy.png" alt = "Rain"  width = 250  height = 250 style = "height: 70%; width: 70%; align: center; margin-right: auto; margin-left: auto"><h2 style="font-size: 40px; margin-top: 10px">Rain</h2><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>
    <c:if test = "${weather.equals('Clear')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/clear.png" alt = "Clear"  width = 250  height = 250 style = "height: 70%; width: 70%; align: center; margin-right: auto; margin-left: auto"><h2 style="font-size: 40px; margin-top: 10px">Clear</h2><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>    
    <c:if test = "${weather.equals('Snow')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/snow.png" alt = "Snow"  width = 250  height = 250 style = "height: 70%; width: 70%; align: center; margin-right: auto; margin-left: auto"><h2 style="font-size: 40px; margin-top: 10px">Snow</h2><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>
    <c:if test = "${weather.equals('Drizzle')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/drizzle.png" alt = "Drizzle"  width = 250  height = 250 style = "height: 70%; width: 70%; align: center; margin-right: auto; margin-left: auto"><h2 style="font-size: 40px; margin-top: 10px">Drizzle</h2><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>    
    <c:if test = "${weather.equals('Thunderstorm')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/thunder.png" alt = "Thunderstorm"  width = 250  height = 250 style = "height: 70%; width: 70%; align: center; margin-right: auto; margin-left: auto"><h2 style="font-size: 40px; margin-top: 10px">Thunderstorms</h2><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>
    <c:if test = "${weather.equals('Mist')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/mist.png" alt = "Mist"  width = 250  height = 250 style = "height: 70%; width: 70%; align: center; margin-right: auto; margin-left: auto"><h2 style="font-size: 40px; margin-top: 10px">Mist</h2><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>  
    <c:if test = "${weather.equals('Haze')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/haze.png" alt = "haze"  width = 250  height = 250 style = "height: 70%; width: 70%; align: center; margin-right: auto; margin-left: auto"><h2 style="font-size: 40px; margin-top: 10px">Haze</h2><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>
    <c:if test = "${weather.equals('Fog')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/fog.png" alt = "fog"  width = 250  height = 250 style = "height: 70%; width: 70%; align: center; margin-right: auto; margin-left: auto"><h2 style="font-size: 40px; margin-top: 10px">Fog</h2><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>


</c:if>
<br>
<jsp:include page="footer.jsp"/>