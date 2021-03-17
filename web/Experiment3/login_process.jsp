<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/11
  Time: 1:19 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="db.SqlHelper" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String account = request.getParameter("account");
    String password = request.getParameter("password");
    String[] remeber =request.getParameterValues("remeber");
    Cookie cookie=new Cookie("user",account+"-"+password);
    if(account != null && password != null) {
        boolean flag = false;
        SqlHelper sqlHelper = new SqlHelper();
        String sql = "SELECT * FROM user where userid = ?";
        ResultSet resultSet = sqlHelper.queryExecute(sql, new String[]{account});
        while (resultSet.next()) {
            if (resultSet.getString("password").equals(password)){
                flag = true;
            }
        }
        if(flag){
            out.print( "用户: " + account + " 登录成功");
            if(remeber !=null && remeber[0].equals("remeber")){
                cookie.setMaxAge(Integer.MAX_VALUE);
                response.addCookie(cookie);
            }else{
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }else {
            out.print("帐号或密码不正确");
        }
    }else {
        response.sendRedirect("login.jsp");
    }
%>
</body>
</html>
