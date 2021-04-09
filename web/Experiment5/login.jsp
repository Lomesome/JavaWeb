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
    <link rel="shortcut icon" href="<%=basePath%>/Experiment5/imgs/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>/Experiment5/iconfont/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>/Experiment5/css/UCM.css">
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
    }
    //判断记住密码复选框的状态
    String check="";
    if(!username.equals("")&&!password.equals("")){
        check = "checked";
    }
%>
<a href="login.jsp">
    <h1>
        <img src="<%=basePath%>/Experiment5/imgs/logo.png" alt="">
        <p style="color: black">UCM</p>
    </h1>
</a>
<script src="<%=basePath%>/Experiment5/js/jquery.js"></script>
<div class="lunbo">
    <div class="side" style="background-image: url('<%=basePath%>/Experiment5/imgs/banner12.jpg'););">
    </div>
    <div class="side" style="background-image: url('<%=basePath%>/Experiment5/imgs/banner22.jpg'););">
    </div>
    <div class="side" style="background-image: url('<%=basePath%>/Experiment5/imgs/banner32.jpg'););">
    </div>
    <div class="side" style="background-image: url('<%=basePath%>/Experiment5/imgs/banner42.jpg'););">
    </div>
</div>
<div class="top">
    <ul>
        <li class="vip">
            <img src="<%=basePath%>/Experiment5/imgs/logo.png" alt="">
            <div>UCM靓号</div>
        </li>
        <li>
            <div onclick="deleteaccount()">删除帐号</div>
        </li>
        <li>
            <div>简体中文 <span></span></div>
            <ul>
                <li>繁體中文</li>
                <li>English</li>
            </ul>
        </li>
        <li>
            <div onclick="findcount()">找回帐号</div>
        </li>
    </ul>
</div>
<div class="main-wraper">
    <div class="main">
        <form method="post" action="checklogin.jsp" id="test_form" class="form">
            <div class="title">
                <h2>欢迎登录UCM</h2>
                <h3>
                    每一天,乐在沟通。
                    <span>免费靓号</span>
                </h3>
            </div>
            <div class="username in">
                <input type="text" name="account" value="<%=username%>" placeholder="帐号">
            </div>
            <div class="userpaw in">
                <input type="password" name="password" value="<%=password%>" placeholder="密码">
            </div>
            <div class="register in">
                <button type="submit" onclick="">立即登录</button>
            </div>
            <div class="perm">
                <input type="radio" value="root" name="perm"><label>管理员</label>
                <input type="radio" value="user" name="perm" checked> <label>普通用户</label>
            </div>
            <div class="find-password-"  style="float: left"><label onclick="findpassword()">找回密码</label></div>
            <div class="agree in" style="float: right">
                <input type="checkbox" name="remeber" value="remeber" style="width: 15px;height: 15px;" <%=check%>><label>记住密码</label>
            </div>
        </form>
    </div>
</div>
</body>
<script src="<%=basePath%>/Experiment5/js/ucm.js"></script>
<script>
    function findcount(){
        var tmpHtml = ""
        tmpHtml = '<div class="find-account">\n' +
            '                <div>找回帐号</div>\n' +
            '                <h2>每一天,乐在沟通。</h2>\n' +
            '                <input class="find" type="text" placeholder="手机号">\n' +
            '                <button onclick="retrieve()">查询</button>\n' +
            '                <div class="zhanghao"></div>\n'
        '            </div>'

        $('.main').empty()
        $(".main").append(tmpHtml);
    }

    function findpassword(){
        var tmpHtml = ""
        tmpHtml = '<div class="find-password">\n' +
            '                <div>找回密码</div>\n' +
            '                <h2>每一天,乐在沟通。</h2>\n' +
            '                <input id="findaccount" type="text" placeholder="帐号">\n' +
            '                <input id="findphone" type="text" placeholder="手机号">\n' +
            '                <div><button onclick="retrieve_password()">修改</button>\n </div>' +
        '            </div>'

        $('.main').empty()
        $(".main").append(tmpHtml);
    }

    function deleteaccount(){
        var tmpHtml = ""
        tmpHtml = '<div class="find-password">\n' +
            '                <div>删除帐号</div>\n' +
            '                <h2>每一天,乐在沟通。</h2>\n' +
            '                <input id="findaccount" type="text" placeholder="帐号">\n' +
            '                <input id="findphone" type="text" placeholder="手机号">\n' +
            '                <div><button onclick="delete_account()">删除</button>\n </div>' +
            '            </div>'

        $('.main').empty()
        $(".main").append(tmpHtml);
    }

    function retrieve(){
        var phone = $('.find').val();
        var reg = /^1[3-9]\d{9}$/
        if(reg.test(phone)){
            $.ajax({
                cache: false,
                type: 'get',
                url: "retrieve_account.jsp?phonenumber="+phone,
                async: true,
                success: function (data) {
                    $('.zhanghao').remove();
                    $(".find-account").append(data);
                }
            });
        }else {
            alert('手机号错误');
        }
    }

    var aaccount;

    function retrieve_password(){
        var phone = $('#findphone').val();
        var account = $('#findaccount').val();
        aaccount = account;
        var reg = /^1[3-9]\d{9}$/
        if(reg.test(phone)){
            $.ajax({
                cache: false,
                type: 'get',
                url: "retrieve_password.jsp?phonenumber="+phone + "&account=" +account,
                async: true,
                success: function (data) {
                    $('.main').empty()
                    $(".main").append(data);
                }
            });
        }else {
            alert('手机号错误');
        }
    }

    function delete_account(){
        var phone = $('#findphone').val();
        var account = $('#findaccount').val();
        aaccount = account;
        var reg = /^1[3-9]\d{9}$/
        if(reg.test(phone)){
            $.ajax({
                cache: false,
                type: 'get',
                url: "delete_account.jsp?phonenumber="+phone + "&account=" +account,
                async: true,
                success: function (data) {
                    $('.main').empty()
                    $(".main").append(data);
                }
            });
        }else {
            alert('手机号错误');
        }
    }

    function sure_password() {
        var password = $('#newpassword').val();
        if (true) {
            $.ajax({
                url: "change_password.jsp?account=" + aaccount + "&password=" + password,
                type: "post",
                success: function (data) {
                    $('.main').empty()
                    $(".main").append(data);
                },
                error: function (e) {
                    alert("error");
                }
            })
        }
    }
</script>
</html>
