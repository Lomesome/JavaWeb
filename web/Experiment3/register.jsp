<%--
  Created by IntelliJ IDEA.
  User: leiyunhong
  Date: 2021/3/12
  Time: 4:12 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="zh-CN" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UCM注册</title>
    <link rel="shortcut icon" href="<%=basePath%>/Experiment3/imgs/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>/Experiment3/iconfont/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>/Experiment3/css/UCM.css">
</head>
<body>
<a href="register.jsp">
    <h1>
        <img src="<%=basePath%>/Experiment3/imgs/logo.png" alt="">
        <p style="color: black">UCM</p>
    </h1>
</a>
<div class="lunbo">
    <div class="side" style="background-image: url(<%=basePath%>/Experiment3/imgs/banner12.jpg);">
    </div>
    <div class="side" style="background-image: url(<%=basePath%>/Experiment3/imgs/banner22.jpg);">
    </div>
    <div class="side" style="background-image: url(<%=basePath%>/Experiment3/imgs/banner32.jpg);">
    </div>
    <div class="side" style="background-image: url(<%=basePath%>/Experiment3/imgs/banner42.jpg);">
    </div>
</div>
<div class="top">
    <ul>
        <li class="vip">
            <img src="<%=basePath%>/Experiment3/imgs/logo.png" alt="">
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
            <div onclick="findcount()">找回帐号</div>
        </li>
    </ul>
</div>
<div class="main-wraper">
    <div class="main">
        <form method="post" id="test_form" class="form">
            <div class="title">
                <h2>欢迎注册UCM</h2>
                <h3>
                    每一天,乐在沟通。
                    <span>免费靓号</span>
                </h3>
            </div>
            <div class="username">
                <input type="text" id="nickname" name="nickname" placeholder="昵称">
                <span class="iconfont dui" style="display: none;">&#xe505;</span>
                <p class="usernamepoint" style="display: none;">
                    <span class="iconfont"></span>
                </p>
            </div>
            <div class="userpaw">
                <input type="password" id="password" name="password" placeholder="密码">
                <span class="iconfont dui1" style="display: none;">&#xe505;</span>
                <p class="kongtip iconfont" style="display: none; color: red;">&#xe50b;密码不能为空或出现空格</p>
                <p class="userpawpoint" style="display: none;">
                    <span class="iconfont nr1">&#xe50b;</span><span>不能包括空格</span><br>
                    <span class="iconfont nr2">&#xe50b;</span><span>长度为8-16个字符</span><br>
                    <span class="iconfont nr3">&#xe50b;</span><span>必须包含字母、数字、符号中至少2种</span>
                </p>
            </div>
            <div class="userphone">
                <select name="countrycode" id="sele">
                    <option value="+86">+86</option>
                    <option value="+886">+886</option>
                </select>
                <input type="text" id="phonenumber" name="phonenumber" placeholder="手机号">
                <span class="iconfont dui2" style="display: none;">&#xe505;</span>
                <p class="userphonepoint" style="display: none;">
                    <span class="iconfont">&#xe50b;请输入正确的手机号码</span>
                </p>
            </div>
            <div class="yzm">
                <input type="text" placeholder="验证码">
                <input type="text" class="yzmnum" readonly>
                <span class="iconfont sjm" style="display: none;">&#xe505;</span>
                <i class="nosee" style="color: #3386ff;text-decoration: none">看不清,换一张</i>
            </div>
            <div class="register">
                <button type="button" onclick="ajaxForm()">立即注册</button>
            </div>
            <div class="agree">
                <input name="notice" value="I have read and agree to the terms of service" type="checkbox" style="width: 15px;height: 15px;" checked="checked"><label>我已阅读并同意相关服务条款和隐私政策</label>
            </div>
        </form>
    </div>
</div>
</body>
<script src="<%=basePath%>/Experiment3/js/ucm.js"></script>
<script src="<%=basePath%>/Experiment3/js/jquery.js"></script>
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

    function ajaxForm() {
        var nickname = $('#nickname').val();
        var password = $('#password').val();
        var phonenumber = $('#phonenumber').val();
        var agreexy = document.querySelector(".agree input");
        if (usernamepointfh.style.color === "lightgreen" &&
            userpawpointfh.style.color === "lightgreen" &&
            userphonefh.style.color === "lightgreen" &&
            yzmfh.style.color === "lightgreen" &&
            agreexy.checked === true
        ) {
            var form = new FormData(document.getElementById("test_form"));
            $.ajax({
                url: "register_success.jsp?nickname=" + nickname + "&password=" + password  + "&phonenumber=" + phonenumber,
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