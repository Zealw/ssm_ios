<%--
  Created by IntelliJ IDEA.
  count: Administrator
  Date: 2019/10/23
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>求购</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/coinBuyer/add">
    <span>趣豆总值：${user.coin.coinNum * 3.9}</span>
    <span>我的趣豆：${user.coin.coinNum}</span>
    <br>
    <span>支付方式</span><img src="" alt="">
    <br>
    <span>价格</span><input type="text" name="tradePrice" id="" value="3.90" >
    <br>
    <span>数量</span><input type="number" name="tradeNum" id="" value="" >
    <br>
    <span>交易密码</span><input type="password" name="user.password" id="password">
    <br>
    <input type="hidden" name="user.phoneNum"  value="${user.phoneNum}">
    <input type="submit" name=""  value="发布" id="sub">

</form>


</body>
</html>