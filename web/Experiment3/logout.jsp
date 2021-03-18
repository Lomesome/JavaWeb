<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/18
  Time: 8:57 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    String nickname = (String) session.getAttribute("name");
    if (nickname == null){
        response.sendRedirect("login.jsp");
    } else {
        session.invalidate();
    }
%>
<body>
    <h3><%=nickname%>注销成功</h3>
</body>
</html>
