<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/25/2022
  Time: 12:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ID</title>
</head>
<body>
<h1>Search customer</h1>
<p>
    <a href="/customers">Back to customer list</a>
</p>
<form method="post">
    <input type="text" placeholder="Input id" name="id">
    <button type="submit">Search</button>
</form>

</body>
</html>
