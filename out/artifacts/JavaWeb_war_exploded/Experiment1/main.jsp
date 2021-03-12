<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/6
  Time: 10:31 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main</title>
</head>
<% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="<%=basePath%>/css/style.css">
<body>
    <jsp:include page="/html/head.html"></jsp:include>
    <%
        String str1 = request.getParameter("id");
        out.println(str1);
    %>
    <jsp:include page="/html/body2.html"></jsp:include>
    <jsp:include page="/html/footer.html"></jsp:include>
</body>
</html>
