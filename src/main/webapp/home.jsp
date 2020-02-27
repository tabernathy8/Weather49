<jsp:include page="header.jsp"/>
<jsp:include page="navigation.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    temp {
        font-size: 0.5em;
    }
    .column {
        float: left;
        width: 50%;
    }

    /* Clear floats after the columns */
    .row:after {
        content: "";
        display: table;
        clear: both;
    }
</style>



<c:if test ="${cityName != null}">
    <c:if test="${alert.NumberOfAlerts() > 0}">
        <br>
        <form style ="padding-top: 10px; padding-bottom: 10px; background-color: red; width: 100%; color: black; font-family: Open Sans; margin: 0%"><div>
                <h1 style = "color: whitesmoke; text-align: center;">Special Weather Alert</h1>
                <c:forEach var = "i" begin = "0" end = "${alert.NumberOfAlerts() - 1}">
                    <center>
                        <p style="color: whitesmoke;">A ${alert.getAlertTitle(i)} begins at ${alert.getAlertTime(i)} and  will expire at ${alert.getAlertExpireTime(i)}</p>
                    </center>
                    <br>

                </c:forEach>
                <center><input style ="align-content: center; background-color: red;" type = "submit" value = "Click here to see more on the Alert(s)" name = "alert" ></center><input type="hidden" value = "alerts" name = "action"></div></form>
                </c:if>
        
        
        
    <h1 class = "city" style = "font-size: 60px; margin-top: 0px;">${cityName}</h1>
    
    <div class="row">
        <div class="column">
    <h2 class = "current" style = "font-size: 150px; margin-top: 40px; margin-bottom: 60px; text-align: right;"><br>${current}<sup><sup><temp>&#xb0</>F</temp></sup></sup></h2>
    <h3 class = "high" style = "margin-bottom: 80px; padding-right: 80px; text-align: right;">${high}<sup>&#xb0</sup> / ${low}<sup>&#xb0</sup></h3>
        </div>
        <div class="column">
        <c:if test = "${weather.equals('Clouds')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/overcast.png" alt = "Clouds"  width = 250  height = 250 style = "margin-left: 0px; margin-top: 80px;"><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br>
    </c:if>
    <c:if test = "${weather.equals('Rain')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/rainy.png" alt = "Rain"  width = 250  height = 250 style = "margin-left: 0px; margin-top: 80px;"><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>
    <c:if test = "${weather.equals('Clear')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/clear.png" alt = "Clear"  width = 250  height = 250 style = "margin-left: 0px; margin-top: 80px;"><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>    
    <c:if test = "${weather.equals('Snow')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/snow.png" alt = "Snow"  width = 250  height = 250 style = "margin-left: 0px; margin-top: 80px;"><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>
    <c:if test = "${weather.equals('Drizzle')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/drizzle.png" alt = "Drizzle"  width = 250  height = 250 style = "margin-left: 0px; margin-top: 80px;"><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>    
    <c:if test = "${weather.equals('Thunderstorm')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/thunder.png" alt = "Thunderstorm"  width = 250  height = 250 style = "margin-left: 0px; margin-top: 80px;"><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>
    <c:if test = "${weather.equals('Mist')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/mist.png" alt = "Mist"  width = 250  height = 250 style = "margin-left: 0px; margin-top: 80px;"><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>  
    <c:if test = "${weather.equals('Haze')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/haze.png" alt = "haze"  width = 250  height = 250 style = "margin-left: 0px; margin-top: 80px;"><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>
    <c:if test = "${weather.equals('Fog')}">
        <form style="text-align: center;"><input type="image" id = "clear" src="media/fog.png" alt = "fog"  width = 250  height = 250 style = "margin-left: 0px; margin-top: 80px;"><input type="hidden" value="See More" name="action"/><input type="hidden" value = "${city}" name = "city"></form>
        <br><br><br><br>
    </c:if>
        </div>
    </div>


</c:if>
<br><br><br><br>
<jsp:include page="footer.jsp"/>