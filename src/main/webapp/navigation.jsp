<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
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

    .navclick {
        float: right;
        margin-top: 28px;
        margin-right: 20px;
    }
</style>

<script>
    var x = document.getElementById("demo");
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            x.innerHTML = "Geolocation is not supported by this browser.";
        }
    }

    function showPosition(position) {
        x.innerHTML = "Latitude: " + position.coords.latitude +
                "<br>Longitude: " + position.coords.longitude;
    }
</script>

<div class ="topnav" id = "myTopnav">
    <c:choose>
        <c:when test = "${city == null}">
            <form method = "get" action = "weather"><input type = "image" class = 'logo' src = "media/w49logo.png" alt="logo.png"> <input type = "hidden" value = "Home" name = "action"><input type = "hidden" value = "UNCC" name = "city"></form>
            </c:when>
            <c:otherwise>
            <form method = "get" action = "weather"><input type = "image" class = 'logo' src = "media/w49logo.png" alt="logo.png"> <input type = "hidden" value = "Home" name = "action"><input type = "hidden" value = "${city}" name = "city"></form>
            </c:otherwise>
        </c:choose>
    <div class = "navclick">
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

        <div style="padding-top: 10px; display: flex">
            <c:choose>
                <c:when test = "${act == null}">
                    <form style ="display: inline-block; margin-right: 0px; padding-right: 0px;" class = "right" method = "get" action="weather" style="padding-top: 15px; background-color: #101010">
                        <input style = "padding: 7px 7px;border-style: ridge;background-color: black;color: white;border-color: #303030;" type="text" name="city" placeholder = "Please Enter a Location">
                        <input type="hidden" value="${action}" name ="action">    
                    </form>
                    <form id="geo" class="right" method="get" action="weather" style="display: inline-block;margin-left: 0px;padding-left: 0px;">
                        <img src="media/loc.png" onclick="getLocation()" alt="Locate" width="25" height="25" style="display: inline-block;position: absolute;padding-top: 4px;padding-left: 4px;">
                        <input type="hidden" value="" name="city" id="city">
                        <input type="hidden" value="${action}" name ="action">
                    </form>
                </c:when>
                <c:otherwise>
                    <form style ="display: inline-block; margin-right: 0px; padding-right: 0px;" class = "right" method = "get" action="${act}" style="padding-top: 15px; background-color: #101010">
                        <input style = "padding: 7px 7px;border-style: ridge;background-color: black;color: white;border-color: #303030;" type="text" name="city" placeholder = "Please Enter a Location">
                        <input type="hidden" value="${action}" name ="action">
                    </form>
                    <form id="geo" class="right" method="get" action="${act}" style="display: inline-block;margin-left: 0px;padding-left: 0px;">
                        <img src="media/loc.png" onclick="getLocation()" alt="Locate" width="25" height="25" style="display: inline-block;position: absolute;padding-top: 4px;padding-left: 4px;">
                        <input type="hidden" value="" name="city" id="city">
                        <input type="hidden" value="${action}" name ="action">

                    </form>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
    <form onclick ="myFunction()" action="javascript:void(0);" class="icon">
        <i class="fa fa-bars"></i>
    </form>
</div>

<script>
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
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(sendPosition);
        } else
        {
            alert("Location could not be found!");
        }
    }

    function sendPosition(position) {
        document.getElementById("city").setAttribute('value', (position.coords.latitude + " " + position.coords.longitude));

        document.getElementById("geo").submit();
    }
</script>

<main>