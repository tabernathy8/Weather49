<jsp:include page="header.jsp"/>
<jsp:include page="navigation.jsp"/>
<div class="location">
    <h1>Please Enter the City You would like to Find the Weather About: </h1>
    <form method = "get" action="weather"><input type="text" name="city"><input type="hidden" value="home" name="action"></form>
</div>

<jsp:include page="footer.jsp"/>
