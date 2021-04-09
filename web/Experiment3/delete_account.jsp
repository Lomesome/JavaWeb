<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/21
  Time: 4:06 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="db.SqlHelper" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String account = request.getParameter("account");
    String phonenumber = request.getParameter("phonenumber");
    if(phonenumber != null) {
        boolean flag = false;
        SqlHelper sqlHelper = new SqlHelper();
        String sql = "SELECT * FROM user where userid = ?";
        ResultSet resultSet = sqlHelper.queryExecute(sql, new String[]{account});
        while (resultSet.next()) {
            if (resultSet.getString("phonenumber").equals(phonenumber)){
                flag = true;
            }
        }
        if(flag){
            out.print("<div class=success> \n" +
                    "    <span class=\"iconfont success-icon\">&#xe505;</span>\n" +
                    "    <div class=\"success-text\">删除成功</div>\n" +
                    "</div>");
        }else {
            out.print("<div class=success> \n" +
                    "    <div class=\"success-text\">信息不正确</div>\n" +
                    "  <div>\n");
        }
    }else {
        response.sendRedirect("login.jsp");
    }
%>
</body>
</html>
