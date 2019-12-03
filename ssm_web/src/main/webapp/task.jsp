<%--
  Created by IntelliJ IDEA.
  count: Administrator
  Date: 2019/10/23
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>环保计划</title>
    <style>
    </style>
</head>
<body>
<div style="text-align: center; background-color: whitesmoke">
    购买
    <p>一级环保任务</p>
    <p>兑换所需：10 趣豆</p>
    <a href="${pageContext.request.contextPath}/do/buyTask">
        <input type="submit" name="" id="" value="兑换" onclick="buyTask()">
    </a>
</div>
<hr>
<div style="text-align: center; background-color: whitesmoke">
    我的
    <table border="1" style="margin: 0px auto">
        <tr>
            <td>一级环保任务个数</td>
            <td>${sessionScope.user.taskNum}个</td>
        </tr>
    </table>

</div>

</body>
</html>
<script>
    function buyTask() {
        alert("购买成功！剩余趣豆${sessionScope.user.coin - 10}")
    }
</script>
