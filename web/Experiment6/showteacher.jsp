<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/4/8
  Time: 8:47 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:useBean id="teacher" scope="page" class="beans.Teacher"></jsp:useBean>
    <jsp:setProperty name="teacher" property="name" value="陈立"/>
    <jsp:setProperty name="teacher" property="age" value="43"/>
    <jsp:setProperty name="teacher" property="sex" value="男"/>
    <jsp:setProperty name="teacher" property="professional" value="教授"/>
    姓名: <jsp:getProperty name="teacher" property="name"/><br>
    年龄: <jsp:getProperty name="teacher" property="age"/><br>
    性别: <jsp:getProperty name="teacher" property="sex"/><br>
    职称: <jsp:getProperty name="teacher" property="professional"/><br>
</body>
</html>
