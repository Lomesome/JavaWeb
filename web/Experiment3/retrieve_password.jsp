<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/18
  Time: 4:47 上午
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
                    "    <div class=\"success-text\">验证成功</div>\n" +
                    "    <div>\n" +
                    "        <div class=\"number\">\n" +
                    "            <input id=\"newpassword\" class=\"change\" type=\"text\" placeholder=\"新密码\">\n" +
                    "            <div class=\"changebutton\"><button onclick=\"sure_password()\">确认修改</button>\n" +
                    "    </div>" +
                    "        </div>\n" +
                    "    </div>\n" +
                    "</div>");
        }else {
            out.print("<div class=success> \n" +
                    "    <div class=\"success-text\">验证失败</div>\n" +
                    "  <div>\n");
        }
    }else {
        response.sendRedirect("register.jsp");
    }
%>
<body>

</body>
</html>
