<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/18/2022
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
  </head>
  <style type="text/css">
    .login {
      height:180px; width:250px;
      margin:0;
      padding:10px;
      border:1px #CCC solid;
    }
    .login input {
      padding: 5px;
      margin: 5px
    }
  </style>
  <body>
  <form action="/login " method="post">
    <div class="login" >
      <h2>Login</h2>
      <input type="text" name="username" width="100%" placeholder="username" />
      <input type="password" name="password" width="100%" placeholder="password" />
      <input type="submit" value="Sign in"/>
    </div>
  </form>
  <h1>${result}</h1>
  </body>
</html>
