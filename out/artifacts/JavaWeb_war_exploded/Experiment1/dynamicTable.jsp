<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/5
  Time: 4:54 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Java程序片段（Scriptlet）和表达式练习</title>
</head>
<body>
<%!
    String[] str = {"Java", "C#", "Python", "C++", "R", "php"};
    int[] rank = {1, 4, 2, 3, 5, 6};
%>
<%
    String str1 = request.getParameter("id");
    out.println(str1);
%>
<table border="1">
    <tr>
        <td>自然编号</td>
        <td>语言名称</td>
        <td>目前排名</td>
    </tr>
    <%
        for(int i = 0; i < str.length;i++){
    %>
    <tr>
        <td><%=i+1%></td>
        <td><%=str[i]%></td>
        <td><%=rank[i]%></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
