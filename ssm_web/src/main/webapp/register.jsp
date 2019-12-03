<%--
  Created by IntelliJ IDEA.
  count: Administrator
  Date: 2019/10/12
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="css/drag.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="js/drag.js" type="text/javascript"></script>
<html>
<head>
    <title>注册</title>
    <style>
        #form {
            width: 400px;
            margin: 100px auto 0px;


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
            border: 1px solid rgba(255, 255, 255, 0.8);
            background-color: rgba(255, 255, 255, 0.3);
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
        #login{
            background-color:rgba(255, 255, 255, 0.7) ;
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
        #checkCode{
            width: 150px;
            margin-left: 76px;
            float: left;

        }
        #img{
            float: left;
            width: 100px;
            height: 43px;
        }
        #look {
            color: red;
            font-size: 24px;
            position: relative;
            left: 338px;
            top: -69px;
            z-index: -1;
        }
        #tick{
            width: 43px;
            height: 43px;
            margin-left: -3px;

        }


    </style>
</head>
<body>
<div class="container " style="background: rgba(255, 255, 255, 0.4) ">
    <form action="${pageContext.request.contextPath}/user/register" id="form">
        <br>
        <h1>新用户注册</h1>
        <br>
        <br>
        <label for="phoneNum" class="word">手机号</label>
        <br>
        <div style="height: 52px">
            <input type="text" name="phoneNum" id="phoneNum" placeholder="请输入手机号">
            <p id="look"></p>
        </div>
        <hr>
        <br>
        <label for="checkCode" class="word">验证码</label>
        <br>
        <input type="text" name="checkCode" id="checkCode" placeholder="请输入验证码">
        <img id="img" src="${pageContext.request.contextPath}/checkCode" onclick="change()">
        <hr style="clear: both">
        <br>
        <label for="password" class="word">登录密码</label>
        <br>
        <input type="password" name="password" id="password" placeholder="请输入登录密码">
        <hr>
        <label for="password1" class="word">密码确认</label>
        <br>
        <input type="password" id="password1" placeholder="请再次输入登录密码">
        <hr>
        <label for="inviter" class="word">推荐人推荐码</label>
        <br>
        <input type="text" name="inviter" id="inviter" placeholder="请输入推荐码">
        <hr>
        <p>点击“注册”即表示同意《 <a href="#">服务协议</a>》</p>
        <br>
        <input type="submit" name="" id="login" value="注册">
        <br>
        <br>


    </form>
</div>
</body>
</html>
<script type="text/javascript">
    $('#drag').drag();
</script>
<script>
    $(function () {
        change();
        $("#phoneNum").blur(function () {
            return checkPhoneNum() && checkPhoneNumRepeat()
        });
        $("#password").blur(checkPassword);
        $("#password1").blur(checkPasswordConfirm);
        $("#form").submit(function () {
            return checkPhoneNum() && checkPassword() && checkPhoneNumRepeat() && checkPasswordConfirm();
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
    function checkPhoneNumRepeat() {
        var phoneNum = $("#phoneNum").val();
        $.get("/count/checkPhoneNum",{"phoneNum":phoneNum},function (data) {
            console.log(data)

            if(data.result){
                {
                    $("#look").html("<img src=\"/img/index/tick.png\" id=\"tick\">")
                }
            }else{
                console.log(data)
                $("#look").html("<span>" + data.message + "</span>")
            }
        },"json")

    }
    function checkPassword() {
        // var password = $("#password").val();
        // var reg =/^\w{6,12}$/;
        // var flag = reg.test(password);
        // if(flag){
        //     $("#password").css({
        //         border:"1px solid rgba(255, 255, 255, 0.4)"
        //     })
        // }else{
        //     $("#password").css({
        //         border:"1px solid red"
        //     })
        // }
        // return flag;
        return true
    }
    function checkPasswordConfirm() {
        var flag = $("#password").val()== $("#password1").val();
        if(flag){
            $("#password").css({
                border: "1px solid rgba(255, 255, 255, 0.4)"
            })
            $("#password1").css({
                border: "1px solid rgba(255, 255, 255, 0.4)"
            })
        }else{
            $("#password").css({
                border: "1px solid red"
            })
            $("#password1").css({
                border: "1px solid red"
            })

        }
        return flag;

    }
</script>
