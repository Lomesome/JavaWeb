<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/4/8
  Time: 9:50 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="vo.Book" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table border="1">
        <tr bgcolor="#ffc0cb">
            <td>书本名称</td>
            <td>书本价格</td>
            <td>剩余数量</td>
            <td>购买</td>
        </tr>
        <%
            HashMap<String, Book> bookHashMap = (HashMap<String, Book>) session.getAttribute("allbook");
            if (bookHashMap != null){
                for(Book book : bookHashMap.values()){
        %>
            <tr bgcolor="yellow">
                <td><%=book.getBookname()%></td>
                <td><%=book.getBookprice()%></td>
                <td><%=book.getBooknumber()%></td>
            </tr>
        <%
                }
            }
        %>

    </table>
</body>
</html>
