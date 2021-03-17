<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/18
  Time: 3:51 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="db.SqlHelper" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String phonenumber = request.getParameter("phonenumber");
    if(phonenumber != null) {
        boolean flag = false;
        SqlHelper sqlHelper = new SqlHelper();
        String sql = "SELECT * FROM user where phonenumber = ?";
        ResultSet resultSet = sqlHelper.queryExecute(sql, new String[]{phonenumber});
        out.print("<div class=\"zhanghao\">");
        out.print("<div style=\"font-size:25px;padding: 20px 0 20px 0\"> 找到以下帐号:</div>");
        while (resultSet.next()) {
            out.print("<p style=\"font-size:20px;padding: 10px 0 10px 50px;\">" + resultSet.getString("userid") + "</p>");
            flag = true;
        }
        if (!flag){
            out.print("<div style=\"font-size:40px;padding: 40px 0 20px 34%;\"> 未找到帐号</div>");
        }
        out.print("</div>");

    }else {
        response.sendRedirect("register.jsp");
    }
%>
<body>

</body>
</html>
