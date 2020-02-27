<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    .topnav {
        overflow: hidden;
        position: relative;
    }

    .topnav #links {
        display: none;
        float: right;
    }

    .topnav form {
        color: black;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
        display: block;
    }

    .topnav form.icon {
        background: black;
        color: white;
        display: block;
        position: absolute;
        right: 0;
        top: 0;
        margin: 0px;
    }

    .topnav form:hover {
        background-color: black;
        color: white;
    }

    .active {
        background-color: #4CAF50;
        color: white;
    }
    
    ::placeholder {
        color: white;
        opacity: 1;
    }

    :-ms-input-placeholder {
        color: white;
        opacity: 1;
    }

    ::-ms-input-placeholder {
        color: white;
        opacity: 1;
    }
</style>


<div class ="topnav" id = "myTopnav">

    <c:choose>
        <c:when test = "${city == null}">
            <form method = "get" action = "weather" style = "margin-left: 0px; padding-left: 0px; width: 100%"><input type = "image" class = 'logo' src = "media/w49logo.png" alt="logo.png"> <input type = "hidden" value = "Home" name = "action"><input type = "hidden" value = "UNCC" name = "city"></form>
            </c:when>
            <c:otherwise>
            <form method = "get" action = "weather" style = "margin-left: 0px; padding-left: 0px; width: 100%"><input type = "image" class = 'logo' src = "media/w49logo.png" alt="logo.png"> <input type = "hidden" value = "Home" name = "action"><input type = "hidden" value = "${city}" name = "city"></form>
            </c:otherwise>
        </c:choose>



    <div id="links">

        <c:if test="${city == null}">
            <form style ="padding: 3px 3px; display: block; width: 100%; text-align: right; margin-left: 0px;" class = "active" method="get" action= "weather"><input type="submit" value = "Home" name="action"><input type="hidden" value="UNCC" name="city"/></form>
            </c:if>
            <c:if test="${city != null}">
            <form style ="padding: 3px 3px; display: block; width: 100%; text-align: right; margin-left: 0px;" class = "active" method="get" action= "weather"><input type="submit" value = "Home" name="action"><input type="hidden" value="${city}" name="city"/></form>
            </c:if>

        <c:if test="${city == null}">
            <form style ="padding: 3px 3px; display: block; width: 100%; text-align: right; margin-left: 0px;" method="get" action="radar"><input type="submit" value = "Radar" name="action"><input type="hidden" value="UNCC" name="city"/></form>
            </c:if>
            <c:if test="${city != null}">
            <form style ="padding: 3px 3px; display: block; width: 100%; text-align: right; margin-left: 0px;" method="get" action="radar"><input type="submit" value = "Radar" name="action"><input type="hidden" value="${city}" name="city"/></form>
            </c:if>

        <c:if test="${city == null}">
            <form style ="padding: 3px 3px; display: block; width: 100%; text-align: right; margin-left: 0px;" method="get" action="fourday"><input type="submit" value = "4 Day Forecast" name="action"><input type="hidden" value="UNCC" name="city"/></form>
            </c:if>
            <c:if test="${city != null}">
            <form style ="padding: 3px 3px; display: block; width: 100%; text-align: right; margin-left: 0px;" method="get" action="fourday"><input type="submit" value = "4 Day Forecast" name="action"><input type="hidden" value="${city}" name="city"/></form>
            </c:if>

        <c:choose>
            <c:when test = "${act == null}">
                <form style ="padding: 11px 11px; display: block; width: 100%; text-align: right; margin-left: 0px;" class = "right" method = "get" action="weather" style="padding-top: 15px; background-color: #101010"><input style = "padding: 7px 7px; border-style: ridge; background-color: black; color: white; border-color: #303030; margin-right: 26px" type="text" name="city" placeholder = "Please Enter a Location"><input type="hidden" value="${action}" name="action"></form>
                </c:when>
                <c:otherwise>
                <form style ="padding: 11px 11px; display: block; width: 100%; text-align: right; margin-left: 0px;" class = "right" method = "get" action="${act}" style="padding-top: 15px; background-color: #101010"><input style = "padding: 7px 7px; border-style: ridge; background-color: black; color: white; border-color: #303030; margin-right: 26px" type="text" name="city" placeholder = "Please Enter a Location"><input type="hidden" value="${action}" name="action"></form>
                </c:otherwise>
            </c:choose>
    </div>

    <a href="javascript:void(0);" class="icon" onclick="myFunction()">
        <i class=""fa fa-bars"></i>
    </a>


    <form onclick ="navFunction()" action="javascript:void(0);" class="icon">
        <i class="fa fa-bars"></i>
    </form>


</div>

<script>
    function navFunction() {
        var x = document.getElementById("links");
        if (x.style.display === "inline-block") {
            x.style.display = "none";
        } else {
            x.style.display = "inline-block";
        }
    }
</script>

<main>