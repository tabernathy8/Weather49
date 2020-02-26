<%@page contentType="text/html" pageEncoding="utf-8"%>
    </main>
    <br><br><br>
    <style>
        footer {
            position: static;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 100px;
        }
    </style>
        <footer>
            <form action="weather" method="get"><input type="submit" value="About Us" name="action"/> <input type="submit" value="Contact Us" name="action"/></form>
            <p>© Weather49 2020</p>
            <form action="weather" method="get"><a href="/weather?action=Home&city=UNCC" style="color:whitesmoke">Desktop</a></form>
        </footer>
</body>
</html>