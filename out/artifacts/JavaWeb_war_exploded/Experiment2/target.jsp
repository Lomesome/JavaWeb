<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/12
  Time: 5:12 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String username = (String)request.getAttribute("username");
        out.print(username);
    %>
</body>
</html>
