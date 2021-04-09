<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/4/8
  Time: 9:13 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.Counter" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:useBean id="myCounter" scope="application" class="beans.Counter" />
    <jsp:setProperty name="myCounter" property="count" value="<%= myCounter.getCount() + 1%>" />
    Current count value is : <jsp:getProperty name="myCounter" property="count"/>
    <%
        String scopeName[] = {"No scope", "page", "request", "session", "application"};
        int scope = pageContext.getAttributesScope("myCounter");
    %>
    <p>scope = <%=scopeName[scope]%></p>
</body>
</html>
