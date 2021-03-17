<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/18
  Time: 1:43 上午
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
    String nickname = request.getParameter("nickname");
    String password = request.getParameter("password");
    String phonenumber = request.getParameter("phonenumber");
    if(nickname != null && password != null && phonenumber != null) {
        SqlHelper sqlHelper = new SqlHelper();
        String sql = "SELECT * FROM user where userid = ?";
        String userid = String.valueOf(System.currentTimeMillis() / 1000 + 1100000000);
        ResultSet resultSet = sqlHelper.queryExecute(sql, new String[]{userid});
        while (resultSet.next()) {
            userid = String.valueOf(System.currentTimeMillis() / 1000 + 1100000000);
            resultSet = sqlHelper.queryExecute(sql, new String[]{userid});
        }
        sql = "INSERT into user (userid, password, nickname, phonenumber) values (?, ?, ?, ?)";
        String[] userinformation = {userid, password, nickname, phonenumber};
        sqlHelper.addAccount(sql, userinformation);
        String savaimage = basePath + "/Experiment3/imgs/save.png";
        out.println(
                        "<div class=success> \n" +
                        "    <span class=\"iconfont success-icon\">&#xe505;</span>\n" +
                        "    <div class=\"success-text\">注册成功</div>\n" +
                        "    <div>\n" +
                        "        <div class=\"number\">\n" +
                        "            <span data-bind=\"text:UCM\"> " + userid + "</span>\n" +
                        " <img src=" + savaimage +" onclick=\"oCopy()\" title=\"复制\" alt=\"\" style=\"cursor: pointer;\">\n" +
                        "        </div>\n" +
                        "<div class=\"tips\">三天内未登录，该号码将会被收回。</div>\n" +
                        "    </div>\n" +
                        "</div>");
    }else {
        response.sendRedirect("register.jsp");
    }
%>
<body>

</body>
</html>
