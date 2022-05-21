<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/21/2022
  Time: 9:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <title>Title</title>
    <style>
        img {
            height: 70px;
            width: 70px;
        }
    </style>
</head>
<body>
<center>
    <h2 style="font-size: 35px">Danh sách khách hàng</h2>
    <div class="col-md-12">
        <table class="table" style="width: 50%">
            <thead>
            <tr>
                <th c>Tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${customerList}" var="customer">
                <tr>
                    <td>${customer.name}</td>
                    <td>${customer.birthday}</td>
                    <td>${customer.address}</td>
                    <td><img src="${customer.picture}"></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</center>
</body>
</html>
