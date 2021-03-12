<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/5
  Time: 4:57 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>将页面请求转发到其他页面</title>
</head>

<body>
<jsp:forward page="dynamicTable.jsp">
    <jsp:param name="id" value="007"/>
</jsp:forward>
</body>
</html>
