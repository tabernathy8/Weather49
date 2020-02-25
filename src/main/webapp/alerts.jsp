<jsp:include page="header.jsp"/>
<jsp:include page="navigation.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center style="color: whitesmoke;">
    <h1 style="font-size: 54px;">Weather Alert in effect for ${cityName}</h1>
    <div>
    <c:forEach  var = "i" begin = "0" end = "${alert.NumberOfAlerts() - 1}">
        <h1 style = "font-size: 45px;">
            ${alert.getAlertTitle(i)}
        </h1>
        <h2 style = "font-size: 25px">Begins at ${alert.getAlertTime(i)} and ends at ${alert.getAlertExpireTime(i)}</h2>
        <p style = "font-size: 12px; margin-left: 35%; margin-right: 35%;">${alert.getAlertDescription(i)}</p>
        <br><br>
    </c:forEach>
    </div>
</center>
<jsp:include page="footer.jsp"/>