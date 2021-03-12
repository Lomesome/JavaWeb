<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/11
  Time: 1:19 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String account = request.getParameter("account");
    String password = request.getParameter("password");
    if(account.equals("admin") && password.equals("admin")){
        out.print( "用户: " + account + " 登录成功");
    }else {
        out.print("帐号或密码不正确");
    }
%>
</body>
</html>
