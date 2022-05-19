<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/19/2022
  Time: 12:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/translate" method="post">
  <h2>Vietnamese Dictionary</h2>
    <input type="text" placeholder="Enter your word: " name="input">
    <button type="submit">Search</button>
  </form>
  <h3>Result: ${result} </h3>
  </body>
</html>
