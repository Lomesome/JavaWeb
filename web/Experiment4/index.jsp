<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/18
  Time: 8:52 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        if (session.getAttribute("name") == null){
            response.sendRedirect("login.jsp");
        } else {
            out.print( "用户: " + session.getAttribute("name") + " 登录成功<br>");
            out.print( "这是您第" + session.getAttribute("count") + "次登录");
            out.print( "<div><a href=\"Experiment4/logout.jsp\">注销</a></div>");
            out.print("SessionID：" + session.getId());
        }
    %>
</body>
<script>

</script>
</html>
