<%--
  Created by IntelliJ IDEA.
  count: Administrator
  Date: 2019/11/9
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息</title>
    <script src="/js/jquery-3.3.1.js"></script>
    <script src="/js/jquery.form.js"></script>
</head>
<body>
<form id="ajaxForm" enctype="multipart/form-data" action="/user/upload">
    <input type="file" name="file" id="btn">
    <br>
</form>
<img src="${user.uimg}" id="img" style="width: 100px;height: 100px">
<form action="/user/updateMsg" method="post">
    用户名：<input type="text" name="username" id="" value="${user.username}">
    <br>
    密码：<input type="text" name="password" id="">
    <br>
    <input type="hidden" name="uimg" id="uimg">
    <input type="submit" name="" id="">
</form>
</body>
<script>
    $(function () {
        $("#btn").blur(function () {
            $("#ajaxForm").ajaxSubmit({
                url :"/count/upload",
                type:"POST",
                success:function (data) {
                    console.log(data.result)
                    if(data.result){
                        console.log(data)
                        $("#img").attr("src",data.message)
                        $("#uimg").val(data.message)
                    }
                }
            })

        })


    })
</script>
</html>
