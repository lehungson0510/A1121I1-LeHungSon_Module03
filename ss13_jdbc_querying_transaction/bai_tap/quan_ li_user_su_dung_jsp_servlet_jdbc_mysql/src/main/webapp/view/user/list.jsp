<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/27/2022
  Time: 8:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap4.6.0/css/bootstrap.min.css">
    <script src="jquery/jquery-3.6.0.min.js"></script>
    <script src="bootstrap4.6.0/js/bootstrap.min.js"></script>
</head>
<style>
    a {
        text-decoration: none;
        color: blue;
    }
</style>
<center>
    <body>
    <h2>User Management</h2>
    <%--    <button  type="button" class="btn btn-outline-primary"><a href="/users?action=create">Add New User</a></button>--%>
    <form action="users">
        <button name="action" value="create" type="submit" class="btn btn-outline-primary">Add New User</button>
        <br><br>
        <input name="country" placeholder=" Input country" type="text" style="height: 30px; font-size: 15px">
        <button name="action" value="search" type="submit" class="btn btn-outline-info">Search</button>
    </form>
    <h3 style="color: #ff896e">${message}</h3>
    <form action="users">
        <select name="sortProperty">
            <option></option>
            <option value="name">name</option>
            <option value="email">email</option>
            <option value="country">country</option>
        </select>
        <button name="action" value="sort" type="submit" class="btn btn-outline-success">sort</button>
    </form>
    <c:if test="${userList != null}">
        <table border="1px" width="50%" height="300px" style="text-align: center">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
            </tr>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td> ${user.id}</td>
                    <td> ${user.name}</td>
                    <td> ${user.email}</td>
                    <td> ${user.country}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <div align="center">
        <table border="1" cellpadding="5" style="width: 50%; height: 300px; text-align: center">
            <h2>List of Users</h2>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.country}"/></td>
                    <td>
                        <a href="/users?action=edit&id=${user.id}">
                            <button type="button" class="btn btn-outline-secondary">edit</button>
                        </a>
                        <button type="button" onclick="showInfo('${user.id}','${user.name}')"
                                class="btn btn-outline-dark"
                                data-toggle="modal"
                                data-target="#exampleModal">
                            delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <%--            **********Thêm thẻ form **************--%>
            <form action="users">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <%--****************************** thêm *************************--%>
                        <input hidden type="text" id="idUser" name="id">
                        <span>Bạn có muốn xóa người dùng </span>
                        <span class="text-danger" id="nameUser"></span> không?<span/>
                        <%--*************************************************************--%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                        <%--*********************** Chuyển type button sang submit **********************--%>
                        <button type="submit" name="action" value="delete" class="btn btn-primary">Có</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
        function showInfo(id, name) {
            document.getElementById("idUser").value = id;
            document.getElementById("nameUser").innerText = name;
        }
    </script>
    </body>
</center>
</html>
