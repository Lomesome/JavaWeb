<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/11
  Time: 9:33 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="zh-CN" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UCM</title>
    <link rel="shortcut icon" href="<%=basePath%>/Experiment2/imgs/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>/Experiment2/iconfont/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>/Experiment2/css/UCM.css">
</head>

<body>
<%
    String username="";
    String password="";
    Cookie [] cookies=request.getCookies();
    if(cookies!=null){
        for(Cookie cookie:cookies){
            if(cookie.getName().equals("user")){
                username=cookie.getValue().split("-")[0];
                password=cookie.getValue().split("-")[1];
            }
        }
    }else{
        out.println("null");
    }
    //判断记住密码复选框的状态
    String check="";
    if(!username.equals("")&&!password.equals("")){
        check = "checked";
    }
%>
<a href="login.jsp">
    <h1>
        <img src="<%=basePath%>/Experiment2/imgs/logo.png" alt="">
        <p style="color: black">UCM</p>
    </h1>
</a>
<div class="lunbo">
    <div class="side" style="background-image: url('<%=basePath%>/Experiment2/imgs/banner12.jpg'););">
    </div>
    <div class="side" style="background-image: url('<%=basePath%>/Experiment2/imgs/banner22.jpg'););">
    </div>
    <div class="side" style="background-image: url('<%=basePath%>/Experiment2/imgs/banner32.jpg'););">
    </div>
    <div class="side" style="background-image: url('<%=basePath%>/Experiment2/imgs/banner42.jpg'););">
    </div>
</div>
<div class="top">
    <ul>
        <li class="vip">
            <img src="<%=basePath%>/Experiment2/imgs/logo.png" alt="">
            <div>UCM靓号</div>
        </li>
        <li>
            <div>简体中文 <span></span></div>
            <ul>
                <li>繁體中文</li>
                <li>English</li>
            </ul>
        </li>
        <li>
            <div onclick="">找回帐号</div>
        </li>
    </ul>
</div>
<div class="main-wraper">
    <div class="main">
        <form method="post" action="login_process.jsp" id="test_form" class="form">
            <div class="title">
                <h2>欢迎登录UCM</h2>
                <h3>
                    每一天,乐在沟通。
                    <span>免费靓号</span>
                </h3>
            </div>
            <div class="username">
                <input type="text" name="account" value="<%=username%>" placeholder="帐号">
            </div>
            <div class="userpaw">
                <input type="password" name="password" value="<%=password%>" placeholder="密码">
            </div>
            <div class="register">
                <button type="submit" onclick="">立即登录</button>
            </div>
            <div class="agree" style="float: right">
                <input type="checkbox" name="remeber" value="remeber" style="width: 15px;height: 15px;" <%=check%>><label>记住密码</label>
            </div>
        </form>
    </div>
</div>
</body>
<script src="<%=basePath%>/Experiment2/js/ucm.js"></script>
</html>
