<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/5
  Time: 5:22 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page errorPage="pageTest_error.jsp" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>自定义错误测试页面</title>
</head>
<body>
    <%//此页面会向pageTest_error抛出异常，让其来处理
        int num1=10;
        int num2=0;
        int num3=num1/num2;
    %>
</body>
</html>
