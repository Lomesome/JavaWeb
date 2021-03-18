<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/18
  Time: 9:06 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="db.SqlHelper" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String teacherno = request.getParameter("teacherno");
        SqlHelper sqlHelper = new SqlHelper();
        String sql = "update teachervote set num = num + 1 where id = ?";
        sqlHelper.changeMsg(sql, new String[]{teacherno});
        sqlHelper.close();
    %>
    <jsp:forward page="display.jsp"></jsp:forward>
</body>
</html>
