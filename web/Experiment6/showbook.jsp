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
    <jsp:useBean id="book" scope="page" class="vo.Book"></jsp:useBean>
    <jsp:setProperty name="book" property="bookno" value="book001"/>
    <jsp:setProperty name="book" property="bookname" value="百年孤独"/>
    <jsp:setProperty name="book" property="bookprice" value="50.0"/>
    <jsp:setProperty name="book" property="booknumber" value="20"/>
    编号: <jsp:getProperty name="book" property="bookno"/><br>
    名称: <jsp:getProperty name="book" property="bookname"/><br>
    价格: <jsp:getProperty name="book" property="bookprice"/><br>
    数量: <jsp:getProperty name="book" property="booknumber"/> 本<br>
</body>
</html>
