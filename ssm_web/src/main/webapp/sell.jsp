<%--
  Created by IntelliJ IDEA.
  count: Administrator
  Date: 2019/10/23
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>卖出</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/user/sell">
    <span>买家</span>:<input type="text"  disabled value="${coinBuyer.user.username}">
    <span>卖家</span>：<input type="text"  disabled value="${user.username}">
    <input type="text" name="tradeNum"  hidden value="${coinBuyer.tradeNum}">
    <input type="text" name="user.phoneNum"  hidden value="${coinBuyer.user.phoneNum}">
    <input type="hidden" name="iid" value="${coinBuyer.iid}">
    <input type="hidden" name="tradePrice" value="${coinBuyer.tradePrice}">
    <span>交易个数</span>：${coinBuyer.tradeNum}
    <span>交易总额</span>：${coinBuyer.tradeNum * coinBuyer.tradePrice}
    <input type="submit" name="" id="" value="确认交易">
</form>

</body>
</html>
