<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/4/8
  Time: 9:05 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:useBean id="book" scope="page" class="beans.Book"></jsp:useBean>
    <jsp:setProperty name="book" property="id" value="book001"/>
    <jsp:setProperty name="book" property="name" value="百年孤独"/>
    <jsp:setProperty name="book" property="price" value="50.0"/>
    <jsp:setProperty name="book" property="num" value="20"/>
    编号: <jsp:getProperty name="book" property="id"/><br>
    名称: <jsp:getProperty name="book" property="name"/><br>
    价格: <jsp:getProperty name="book" property="price"/><br>
    数量: <jsp:getProperty name="book" property="num"/> 本<br>
</body>
</html>
