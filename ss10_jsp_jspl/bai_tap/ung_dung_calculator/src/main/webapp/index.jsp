<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/21/2022
  Time: 11:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>
        .css {
            font-weight: bold;;
        }
    </style>
</head>
<body>
<center>
    <h2>Simple Calculator</h2>
    <form method="post" action="/calculate" style="width: 25%">
        <fieldset>
            <legend class="css">Calculator</legend>
            <table>
                <tr>
                    <td class="css">First operand:</td>
                    <td><input name="first-operand" type="text"/></td>
                </tr>
                <tr>
                    <td class="css">Operator:</td>
                    <td>
                        <select name="operator">
                            <option value="+">Addition</option>
                            <option value="-">Subtraction</option>
                            <option value="*">Multiplication</option>
                            <option value="/">Division</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="css">Second operand:</td>
                    <td><input name="second-operand" type="text"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input style="background: aqua" type="submit" value="Calculate"/></td>
                </tr>
            </table>
        </fieldset>
    </form>
</center>
</body>
</html>
