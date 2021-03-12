<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/12
  Time: 4:23 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String nickname = request.getParameter("nickname");
    String password = request.getParameter("password");
    String countrycode = request.getParameter("countrycode");
    String phonenumber = request.getParameter("phonenumber");
    String[] notices = request.getParameterValues("notice");
    out.print( "昵称: " + nickname + "<br>");
    out.print( "密码: " + password + "<br>");
    out.print( "手机号: " + countrycode + "  " + phonenumber + "<br>");
    for (String notice:notices){
        out.print(notice + "<br>");
    }
%>
</body>
</html>
