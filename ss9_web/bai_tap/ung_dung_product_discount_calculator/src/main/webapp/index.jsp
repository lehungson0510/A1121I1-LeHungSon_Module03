<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/19/2022
  Time: 1:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/input" method="post">
<h3>Product Description</h3>
  <input type="text" name="production" placeholder="Mô tả sản phẩm">
<h3>List Price</h3>
  <input type="text" name="price" placeholder="Giá niêm yết sản phẩm">
<h3>Discount</h3>
  <input type="text" name="discount" placeholder="Tỉ lệ chiết khấu (%)">
 <button type="submit">Result</button>
  </form>
  </body>
</html>
