<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/5
  Time: 4:50 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>index</title>
  </head>
  <% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
  <link rel="stylesheet" href="<%=basePath%>/css/style.css">
  <body>
      <jsp:include page="/html/head.html"></jsp:include>
      <jsp:forward page="main.jsp">
        <jsp:param name="id" value=" form index.html"/>
      </jsp:forward>
      <jsp:include page="/html/body1.html"></jsp:include>
      <jsp:include page="/html/footer.html"></jsp:include>
  </body>
</html>
