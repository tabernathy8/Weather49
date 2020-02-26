<jsp:include page="header.jsp"/>
<jsp:include page="navigation.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<center>
    <h1 style = "color: whitesmoke; font-family: 'Open Sans';">The Radar for ${cityName}</h1>
    <iframe src="https://www.rainviewer.com/map.html?loc=${lat},${lng},15&oFa=0&oC=0&oU=0&oCS=1&oF=0&oAP=0&rmt=2&c=3&o=83&lm=1&th=1&sm=1&sn=1" width="75%" frameborder="0" style="border: 5;height:75vh;" allowfullscreen></iframe>
</center>
    <br><br>
<jsp:include page="footer.jsp"/>