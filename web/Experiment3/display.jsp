<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/18
  Time: 9:06 上午
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
<table align="center">
    <caption>欢迎给老师投票</caption>
    <tr bgcolor="yellow">
        <td>编号</td>
        <td>姓名</td>
        <td>得票数</td>
        <td>投票</td>
    </tr>
    <%
        SqlHelper sqlHelper = new SqlHelper();
        String sql = "SELECT id, name, num from teachervote";
        ResultSet resultSet = sqlHelper.queryExecute(sql);
        while (resultSet.next()){
            String teacherno = resultSet.getString("id");
            String teachername = resultSet.getString("name");
            int vote = resultSet.getInt("num");
    %>
        <tr bgcolor="#ffc0cb">
            <td><%=teacherno%></td>
            <td><%=teachername%></td>
            <td><img src="imgs/bar.jpg" width="<%=vote%>" height="10"> <%=vote%> </td>
            <td><a href="vote.jsp?teacherno=<%=teacherno%>">投票</a> </td>
        </tr>
    <%
        }
        sqlHelper.close();
    %>

</table>
</body>
</html>
