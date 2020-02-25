    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <div class ="topnav" id = "myTopnav">
                <c:choose>
                    <c:when test = "${city == null}">
                        <form method = "get" action = "weather"><input type = "image" class = 'logo' src = "media/w49logo.png" alt="logo.png"> <input type = "hidden" value = "Home" name = "action"><input type = "hidden" value = "UNCC" name = "city"></form>
                    </c:when>
                    <c:otherwise>
                        <form method = "get" action = "weather"><input type = "image" class = 'logo' src = "media/w49logo.png" alt="logo.png"> <input type = "hidden" value = "Home" name = "action"><input type = "hidden" value = "${city}" name = "city"></form>
                    </c:otherwise>
                </c:choose>
                
                <c:if test="${city == null}">
                    <form class = "active" method="get" action= "weather"><input type="submit" value = "Home" name="action"><input type="hidden" value="UNCC" name="city"/></form>
                </c:if>
                <c:if test="${city != null}">
                        <form class = "active" method="get" action= "weather"><input type="submit" value = "Home" name="action"><input type="hidden" value="${city}" name="city"/></form>
                </c:if>
                <c:if test="${city == null}">
                <form method="get" action="radar"><input type="submit" value = "Radar" name="action"><input type="hidden" value="UNCC" name="city"/></form>
                </c:if>
                <c:if test="${city != null}">
                <form method="get" action="radar"><input type="submit" value = "Radar" name="action"><input type="hidden" value="${city}" name="city"/></form>
                </c:if>
                <c:if test="${city == null}">
                    <form method="get" action="fourday"><input type="submit" value = "4 Day Forecast" name="action"><input type="hidden" value="UNCC" name="city"/></form>
                </c:if>
                <c:if test="${city != null}">
                <form method="get" action="fourday"><input type="submit" value = "4 Day Forecast" name="action"><input type="hidden" value="${city}" name="city"/></form>
                </c:if>
                
                <c:choose>
                    <c:when test = "${act == null}">
                        <form class = "right" method = "get" action="weather" style="padding-top: 15px;"><input style = "padding-top: 15px; padding-bottom: 15px; border-style: none; background-color: black; color: white; border-color: white;" type="text" name="city" placeholder = "Please Enter a Location"><input type="hidden" value="${action}" name="action"></form>
                    </c:when>
                    <c:otherwise>
                        <form class = "right" method = "get" action="${act}" style="padding-top: 15px;"><input style = "padding-top: 15px; padding-bottom: 15px; border-style: none; background-color: black; color: white; border-color: white;" type="text" name="city" placeholder = "Please Enter a Location"><input type="hidden" value="${action}" name="action"></form>
                    </c:otherwise>
                </c:choose>
                <form onclick ="myFunction()" action="javascript:void(0);" class="icon">
                    <i class="fa fa-bars"></i>
                </form>
            </div>
            
            
    <main>