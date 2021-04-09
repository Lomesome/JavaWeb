<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/18
  Time: 5:23 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="db.SqlHelper" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    String account = request.getParameter("account");
    String password = request.getParameter("password");
    if(account != null && password != null) {
        boolean flag = false;
        SqlHelper sqlHelper = new SqlHelper();
        String sql = "update user set password=? where userid=? ";
        sqlHelper.changeMsg(sql, new String[]{password, account});
        out.print("<div class=success> \n" +
                "    <span class=\"iconfont success-icon\">&#xe505;</span>\n" +
                "    <div class=\"success-text\">更改成功</div>\n" +
                "</div>");
    }else {
        response.sendRedirect("login.jsp");
    }
%>
<body>

</body>
</html>
