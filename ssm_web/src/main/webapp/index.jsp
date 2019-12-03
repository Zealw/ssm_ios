<%--
  Created by IntelliJ IDEA.
  count: Administrator
  Date: 2019/10/12
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/css/drag.css" rel="stylesheet" type="text/css">
<script src="/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="/js/drag.js" type="text/javascript"></script>
<script src="/js/jquery-1.10.2.js"></script>
<script src="/js/img_ver.js"></script>
<html>
<head>
    <title>登录注册</title>
    <link type="text/css" rel="stylesheet" href="/css/style.css">

    <style>
        #form {
            width: 400px;
            margin: 200px auto 0px;


        }
        .word{
            font-size: 16px;
            color: whitesmoke;
        }
        input {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            outline: 0;
            border: 1px solid rgba(255, 255, 255, 0.4);
            background-color: rgba(255, 255, 255, 0.2);
            width: 250px;
            border-radius: 3px;
            padding: 10px 15px;
            margin: 0 auto 10px auto;
            display:block;
            text-align: center;
            font-size: 18px;
            color: purple;
            -webkit-transition-duration: 0.25s;
            transition-duration: 0.25s;
            font-weight: 300;

        }
        body{

            background: url("/img/index/bgground.gif") ;
            background-size: 100%;

        }
        a{
            font-size: 16px;
            color:black;
            text-decoration: none;

        }
        hr{
            color: gray;
        }
        #login{
            background-color:rgba(255, 255, 255, 0.7) ;
        }
        #unbind{
            background-color:rgba(255, 255, 255, 0.7) ;
        }

    </style>
</head>
<body>
<div class="container " style="background: rgba(255, 255, 255, 0.4) ">
    <form action="${pageContext.request.contextPath}/user/login" id="form" method="post">
        <h1>欢迎来到趣分类</h1>
        <br>
        <br>
        <label for="phoneNum" class="word">手机号</label>
        <br>
        <input type="text" name="phoneNum" id="phoneNum" placeholder="请输入手机号">
        <hr>
        <br>
        <label for="password" class="word">密码</label>
        <br>
        <input type="password" name="password" id="password" placeholder="请输入密码">
        <hr>
        <br>
        <div id="imgVer" style="display:inline-block;margin-left: 48px">
            <div style="position:relative;padding:16px 16px 28px;border:1px solid #ddd;background:#f2ece1;border-radius:16px;">
                <div style="position:relative;overflow:hidden;width:260px;margin: 0px auto;">
                    <div style="position:relative;width:260px;height:116px;">
                        <img id="scream" src="/img/index/ver-2.png" style="width:260px;height:116px;">
                        <canvas id="puzzleBox" width="260" height="116" style="position:absolute;left:0;top:0;z-index:22;">
                        </canvas></div><div class="puzzle-lost-box" style="position:absolute;width:260px;height:116px;top:0;left:-80px;z-index:111;">
                    <canvas id="puzzleShadow" width="260" height="116" style="position: absolute; left: 0px; top: 0px; z-index: 22; transition: left 0.5s ease 0s;"></canvas>
                    <canvas id="puzzleLost" width="260" height="116" style="position: absolute; left: 0px; top: 0px; z-index: 33; transition: left 0.5s ease 0s;"></canvas></div>
                    <p class="ver-tips"></p></div><div class="re-btn"><a></a></div></div>
            <br><div style="position:relative;width:260px;margin:auto;">
            <div style="border:1px solid #c3c3c3;border-radius:24px;background:#ece4dd;box-shadow:0 1px 1px rgba(12,10,10,0.2) inset;">
                <p style="font-size:12px;color: #486c80;line-height:28px;margin:0;text-align:right;padding-right:22px;">按住左边滑块，拖动完成上方拼图</p></div>
            <div class="slider-btn" style="background-position: 0px -84px; left: 0px; transition: left 0.5s ease 0s;"></div></div></div>

        <div style="clear: both"></div>


        <a href="${pageContext.request.contextPath}/register.jsp"style=" clear:both;">注册帐号</a>
        <a href="${pageContext.request.contextPath}/forgetPassword.jsp" style="float: right;">忘记密码</a>
        <br>
        <br>
        <input type="submit" name="" id="login" value="登录" >
        <input type="button" name="" id="unbind" value="解绑">
    </form>


</div>


</body>
</html>
<script type="text/javascript">


</script>
<script>
    $(function () {
        change();
        $("#phoneNum").blur(checkPhoneNum);
        $("#password").blur(checkPassword);
        $("#form").submit(function () {
            return checkPhoneNum() && checkPassword();// && flag
        })

    })
    function change() {
        var date = new Date().getTime();
        $("#img").attr("src", "${pageContext.request.contextPath}/checkCode?"+date);
    }
    function checkPhoneNum() {
        var phoneNum = $("#phoneNum").val();
        var reg =/^1[3456789]\d{9}$/;
        var flag = reg.test(phoneNum);
        if(flag){
            $("#phoneNum").css({
                border:"1px solid rgba(255, 255, 255, 0.4)"
            })
        }else{
            $("#phoneNum").css({
                border:"1px solid red"
            })
        }
        return flag;

    }
    function checkPassword() {
        var password = $("#password").val();
        var reg =/^\w{6,12}$/;
        var flag = reg.test(password);
        if(flag){
            $("#password").css({
                border:"1px solid rgba(255, 255, 255, 0.4)"
            })
        }else{
            $("#password").css({
                border:"1px solid red"
            })
        }
        return flag;
    }

    var flag = false;
    imgVer({
        el: '$("#imgVer")',
        width: '260',
        height: '116',
        img: [
            '/img/index/ver.png',
            '/img/index/ver-1.png',
            '/img/index/ver-2.png',
            '/img/index/ver-3.png'
        ],
        success: function () {
            flag = true;
        },
        error: function () {
            flag = false;

        }
    });
    function checkCode() {
       var flag = imgVer().val();
       console.log(flag)
        if (flag) {
            $("#imgVer").css({
                border: "1px solid red"
            })
        } else {
            $("#imgVer").css({
                border: "1px solid rgba(255, 255, 255, 0.4)"
            })
        }
        return flag;

    }


</script>
