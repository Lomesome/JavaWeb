<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/4/8
  Time: 9:20 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:useBean id="myCounter" scope="request" class="beans.Counter" />
    <jsp:setProperty name="myCounter" property="count" value="<%= myCounter.getCount() + 1%>" />
    <jsp:forward page="reqCounter2.jsp"></jsp:forward>
</body>
</html>
