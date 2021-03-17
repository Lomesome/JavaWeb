<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/13
  Time: 10:15 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style></style>
<body>
<%
    out.print("<div id = loading >");
    out.print("<div id= loader class = heart></div>");
    out.print("</div>");
    out.print("<style>" +
            "    #loading{" +
            "        width: 100%;" +
            "        height: 100px;" +
            "    }" +
            "    #loader{" +
            "        position: relative;" +
            "        margin-left: calc(50% - 25px);" +
            "        width: 50px;" +
            "        height: 50px;" +
            "        animation: loader-4 1s ease-in-out alternate infinite;" +
            "    }" +
            "    .heart:before{" +
            "        position: absolute;" +
            "        left: 11px;" +
            "        content: \"\";" +
            "        width: 50px;" +
            "        height: 80px;" +
            "        transform: rotate(45deg);" +
            "        background-color: rgb(230, 6, 6);" +
            "        border-radius: 50px 50px 0 0;" +
            "    }" +
            "    .heart:after{" +
            "        position: absolute;" +
            "        right: 11px;" +
            "        content: \"\";" +
            "        width: 50px;" +
            "        height: 80px;" +
            "        background-color: rgb(230, 6, 6);" +
            "        transform: rotate(-45deg);" +
            "        border-radius: 50px 50px 0 0;" +
            "    }" +
            "    @keyframes loader-4 {" +
            "        0%{" +
            "            transform: scale(0.2);" +
            "            opacity: 0.5;" +
            "        }" +
            "        100%{" +
            "            transform: scale(1);" +
            "            opacity: 1;" +
            "        }" +
            "    }" +
            "</style>");
%>
</body>
</html>
