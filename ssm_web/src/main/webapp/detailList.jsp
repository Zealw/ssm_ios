<%--
  Created by IntelliJ IDEA.
  count: Administrator
  Date: 2019/10/24
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>详细清单</title>
</head>
<body>
    <table border="1">

        <tr>
            <td>用户名</td>
            <td>${user.username}</td>
        </tr>
        <tr>
            <td>趣豆</td>
            <td>${user.coin}</td>
        </tr>
        <tr>
            <td>环保任务数</td>
            <td>${user.taskNum}</td>
        </tr>
        <tr>
            <td>环保值</td>
            <td>${user.inviteNum * 0.4}</td>
        </tr>
    </table>
</body>
</html>
