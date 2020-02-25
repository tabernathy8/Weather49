<!DOCTYPE html>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <html lang="en">
        <head>
            <c:choose>
                <c:when test="${city == null}">
                    <meta charset="UTF-8" http-equiv="refresh" content="0;url=weather?action=Home&city=UNCC"/>
                </c:when>
                <c:otherwise>
                    <meta charset="UTF-8" http-equiv="refresh" content="0;url=weather?action=Home&city=${city}"/>
                </c:otherwise>
            </c:choose>
            
            <link rel= "stylesheet" type="text/css" href="style/weather49.css">
            <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
            <link rel="icon" href="https://cdn.discordapp.com/attachments/639578276494573596/642136095051481109/w49-final2.png">
            <script type="text/javascript"src="https://maps.googleapis.com/maps/api/js?client=AIzaSyDGL6-ZSUPdBuLicSgof-DveoPL2bdwHFw"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" />
            <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
            <script src="script/radar.js"></script>
            <script src="script/navigation.js"></script>
            <!-- Global site tag (gtag.js) - Google Analytics -->
            <script async src="https://www.googletagmanager.com/gtag/js?id=UA-150915423-2"></script>
            <script>
                window.dataLayer = window.dataLayer || [];
                function gtag(){dataLayer.push(arguments);}
                gtag('js', new Date());

                gtag('config', 'UA-150915423-2');
            </script>
            <title>Weather49</title>
        </head>
        <body>

<jsp:include page="navigation.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="footer.jsp"/>