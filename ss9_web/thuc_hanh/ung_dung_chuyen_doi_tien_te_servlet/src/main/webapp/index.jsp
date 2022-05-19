<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/19/2022
  Time: 12:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="/convert" method="post">
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE" ><br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD" ><br/>
    <input type="submit" id="submit" value="Converter"/>
</form>
<h4>Rate: ${rate}</h4>
<h4>USD: ${usd}</h4>
<h4>VND: ${result}</h4>
</body>
</html>
