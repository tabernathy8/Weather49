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
        left: 0;
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


    .locLoader {
        border: 6px solid #f3f3f3; /* Light Gray */
        border-top: 6px solid #303030; /* Dark Gray */
        border-radius: 50%;
        width: 20px;
        height: 20px;
        animation: spin 2s linear infinite;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
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
            <form style ="padding: 3px 3px; display: block; width: 100%; text-align: left; margin-left: 0px;" class = "active" method="get" action= "weather"><input type="submit" value = "Home" name="action"><input type="hidden" value="UNCC" name="city"/></form>
            </c:if>
            <c:if test="${city != null}">
            <form style ="padding: 3px 3px; display: block; width: 100%; text-align: left; margin-left: 0px;" class = "active" method="get" action= "weather"><input type="submit" value = "Home" name="action"><input type="hidden" value="${city}" name="city"/></form>
            </c:if>

        <c:if test="${city == null}">
            <form style ="padding: 3px 3px; display: block; width: 100%; text-align: left; margin-left: 0px;" method="get" action="radar"><input type="submit" value = "Radar" name="action"><input type="hidden" value="UNCC" name="city"/></form>
            </c:if>
            <c:if test="${city != null}">
            <form style ="padding: 3px 3px; display: block; width: 100%; text-align: left; margin-left: 0px;" method="get" action="radar"><input type="submit" value = "Radar" name="action"><input type="hidden" value="${city}" name="city"/></form>
            </c:if>

        <c:if test="${city == null}">
            <form style ="padding: 3px 3px; display: block; width: 100%; text-align: left; margin-left: 0px;" method="get" action="fourday"><input type="submit" value = "4 Day Forecast" name="action"><input type="hidden" value="UNCC" name="city"/></form>
            </c:if>
            <c:if test="${city != null}">
            <form style ="padding: 3px 3px; display: block; width: 100%; text-align: left; margin-left: 0px;" method="get" action="fourday"><input type="submit" value = "4 Day Forecast" name="action"><input type="hidden" value="${city}" name="city"/></form>
            </c:if>
        <div style="padding: 11px 11px;display: inline-block;width: 100%;text-align: left;margin-left: 10px;">
            <c:choose>
                <c:when test = "${act == null}">
                    <form style ="padding: 0px 0px; display: inline-block; margin-right: 0px; margin-left: 0px;" class = "right" method = "get" action="weather" style="padding-top: 15px; background-color: #101010">
                        <input style = "padding: 7px 7px; border-style: ridge; background-color: black; color: white; border-color: #303030;" type="text" name="city" placeholder = "Please Enter a Location">
                        <input type="hidden" value="${action}" name ="action">    
                    </form>
                    <form id="geo" class="right" method="get" action="weather" style="display: inline-block; margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;">
                        <img src="media/loc.png" onclick="getLocation()" alt="Locate" width="25" height="25" style="display: inline-block;position: absolute;padding-top: 4px;padding-left: 4px;">
                        <input type="hidden" value="" name="city" id="city">
                        <input type="hidden" value="${action}" name ="action">
                    </form>
                    <div id="loadLoc" class="locLoader" style="margin: 2px 0px 0px 35px; display:none"/></div>
                </c:when>
                <c:otherwise>
                <form style ="padding: 0px 0px; display: inline-block; margin-right: 0px; margin-left: 0px;" class = "right" method = "get" action="${act}" style="padding-top: 15px; background-color: #101010">
                    <input style = "padding: 7px 7px; border-style: ridge; background-color: black; color: white; border-color: #303030;" type="text" name="city" placeholder = "Please Enter a Location">
                    <input type="hidden" value="${action}" name ="action">
                </form>
                <form id="geo" class="right" method="get" action="${act}" style="display: inline-block; margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;">
                    <img src="media/loc.png" onclick="getLocation()" alt="Locate" width="25" height="25" style="display: inline-block;position: absolute;padding-top: 4px;padding-left: 4px;">
                    <input type="hidden" value="" name="city" id="city">
                    <input type="hidden" value="${action}" name ="action">                 
                </form>
                <div id="loadLoc" class="locLoader" style="margin: 2px 0px 0px 35px; display:none"/></div> 
            </c:otherwise>
        </c:choose>
</div>
</div>

<form onclick ="navFunction()" action="javascript:void(0);" class="icon">
    <i class="fa fa-bars" style="font-size: 35px;"></i>
</form>


</div>
<script>
    function navFunction() {
        var x = document.getElementById("links");
        if (x.style.display === "inline-block") {
            x.style.display = "none";
        } else {
            x.style.display = "inline-block";
            x.style.width = "100%";
        }
    }
    var pStart = {x: 0, y: 0};
    var pStop = {x: 0, y: 0};

    function swipeStart(e) {
        if (typeof e['targetTouches'] !== "undefined") {
            var touch = e.targetTouches[0];
            pStart.x = touch.screenX;
            pStart.y = touch.screenY;
        } else {
            pStart.x = e.screenX;
            pStart.y = e.screenY;
        }
    }

    function swipeEnd(e) {
        if (typeof e['changedTouches'] !== "undefined") {
            var touch = e.changedTouches[0];
            pStop.x = touch.screenX;
            pStop.y = touch.screenY;
        } else {
            pStop.x = e.screenX;
            pStop.y = e.screenY;
        }

        swipeCheck();
    }

    function swipeCheck() {
        var changeY = pStart.y - pStop.y;
        var changeX = pStart.x - pStop.x;
        if (isPullDown(changeY, changeX)) {
            location.reload();
        }
    }

    function isPullDown(dY, dX) {
        // methods of checking slope, length, direction of line created by swipe action 
        return dY < 0 && (
                (Math.abs(dX) <= 100 && Math.abs(dY) >= 300)
                || (Math.abs(dX) / Math.abs(dY) <= 0.3 && dY >= 60)
                );
    }

    document.addEventListener('touchstart', function (e) {
        swipeStart(e);
    }, false);

    document.addEventListener('touchend', function (e) {
        swipeEnd(e);
    }, false);

    function getLocation() {
        var x = document.getElementById("loadLoc");
        x.style.display = "inline-block";
        
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(sendPosition);
        } else
        {
            alert("Location could not be found!");
            x.style.display = "none";
        }
    }

    function sendPosition(position) {
        document.getElementById("city").setAttribute('value', (position.coords.latitude + " " + position.coords.longitude));

        document.getElementById("geo").submit();
    }
</script>

<main>