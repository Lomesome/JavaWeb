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
    String perm = request.getParameter("perm");
    String[] remeber =request.getParameterValues("remeber");
    Cookie cookie=new Cookie("user",account+"-"+password);
    if (session.getAttribute("name") == null) {
        if(account != null && password != null) {
            boolean flag = false;
            SqlHelper sqlHelper = new SqlHelper();
            String sql = "SELECT * FROM user where userid = ?";
            ResultSet resultSet = sqlHelper.queryExecute(sql, new String[]{account});
            int logincount = 0;
            String nickname = null;
            while (resultSet.next()) {
                if (resultSet.getString("password").equals(password)){
                    flag = true;
                    logincount = resultSet.getInt("logincount") + 1;
                    nickname = resultSet.getString("nickname");
                }
            }
            if(flag){
                sql = "update user set logincount=? where userid=? ";
                sqlHelper.changeMsg(sql, new String[]{String.valueOf(logincount), account});
                session.setAttribute("name", nickname);
                session.setAttribute("count", logincount);
                session.setAttribute("perm", perm);
                if(remeber !=null && remeber[0].equals("remeber")){
                    cookie.setMaxAge(Integer.MAX_VALUE);
                    response.addCookie(cookie);
                }else{
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
                if(perm.equals("user")) {
                    response.sendRedirect("index.jsp");
                }
                else if(perm.equals("root")) {
                    response.sendRedirect("indexadmin.jsp");
                }

            }else {
                out.print("<div><h2>帐号或密码不正确</h2></div>" +
                        "<div><h3>即将返回</h3></div>");
                response.setHeader("Refresh","3");
            }
        }else {
            response.sendRedirect("login.jsp");
        }
    }
    else {
        response.sendRedirect("index.jsp");
    }

%>
</body>
</html>
