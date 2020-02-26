<jsp:include page="header.jsp"/>
<jsp:include page="navigation.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center style="color: whitesmoke; padding-right: 10px; padding-left: 10px">
    <h1 style="font-size: 30px; line-height: 1.2">Weather Alert in effect for ${cityName}</h1>
    <div>
    <c:forEach  var = "i" begin = "0" end = "${alert.NumberOfAlerts() - 1}">
        <h1 style = "font-size: 45px; line-height: 1.2">
            ${alert.getAlertTitle(i)}
        </h1>
        <h2 style = "font-size: 25px">Begins at ${alert.getAlertTime(i)} and ends at ${alert.getAlertExpireTime(i)}</h2>
        <p style = "font-size: 12px; margin-left: 10%; margin-right: 10%;">${alert.getAlertDescription(i)}</p>
        <br><br>
    </c:forEach>
    </div>
</center>
<jsp:include page="footer.jsp"/>