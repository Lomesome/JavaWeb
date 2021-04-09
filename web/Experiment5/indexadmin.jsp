<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/26
  Time: 5:03 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    out.print( "管理员: " + session.getAttribute("name") + " 登录成功<br>");
    out.print( "这是您第" + session.getAttribute("count") + "次登录");
    out.print( "<div><a href=\"logout.jsp\">注销</a></div>");
%>
</body>
</html>
