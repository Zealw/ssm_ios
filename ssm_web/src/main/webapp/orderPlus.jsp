<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12/3/2019
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单详情</title>
    <style>
        .icon {
            width: 100px;
            height: 130px;
            text-align: center;
        }

        .ul_list > li {
            display: inline-block;
            margin-left: 8%;
        }

        .ul_list1 > li {
            display: inline-block;
            margin-left: 18%;
        }

        .ul_list2 > li {

            display: inline-block;
            margin-left: 9%;
        }

        .icon > a > img {
            width: 100px;
            height: 100px;
        }

        #bottom {
            width: 1140px;
            position: fixed;
            top: 830px;
            background: #3c3c3c;
            height: 150px;
            padding-left: 43px;

        }

        #bor {
        }

        .ul_list1 > li {
            display: inline-block;
            margin-left: 18%;
        }

        .ul_list2 > li {

            display: inline-block;
            margin-left: 9%;
        }

        .ul_list3 > li {

            display: inline-block;
            margin-left: 12%;
        }

        .ul_list4 > li {

            display: inline-block;
            margin-left: 5%;
        }

        .icon > a > img {
            width: 100px;
            height: 100px;
        }

        #bottom {
            width: 1140px;
            position: fixed;
            top: 830px;
            background: #E7EAED;
            height: 150px;
        }

        #rank {
            width: 90%;
            height: 150px;
            margin: 0px auto;
            background-color: skyblue;
            border-radius: 15px;
        }

        .button {
            width: 450px;
            height: 200px;
            background-color: #DAECFE;
            margin: 10px 17px;
            border-radius: 20px;

        }

        .button > a > img {
            width: 150px;
            height: 80%;

        }

        .button_font {
            width: 250px;
            height: 100%;
            display: inline-block;
            margin-left: 15px;

        }

        .button_font > h1 {

        }

        .button_font > span {
            color: #7F8490;
            font-size: 20px;

        }

        * {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        a, img {
            border: 0;
        }

        body {
            background: #ffffff;
            height: 100%;
            font: normal normal 12px/24px "Microsoft yahei", Arial;
            padding-bottom: 30px;
        }

        a {
            color: #333;
            text-decoration: none;
        }

        a:hover {
            color: #093;
            text-decoration: none;
        }

        #title {
            width: 300px;
            margin: 3% auto 0;
        }

        #title h2 {
            font-size: 18px;
        }

        #wrapper {
            width: 980px;
            margin: 0 auto;
            background: #f8f8f8;
            border: 1px solid #a3a3a3;
            padding: 20px 20px 50px;
            border-radius: 5px;
            -moz-border-radius: 5px;
        }

        h3 {
            color: #333;
            font-size: 14px;
            text-align: center;
            margin: 20px 0;
        }

        /* box */
        .box {
            width: 1139px;
            margin: 10px auto 0;
        }

        .tab_menu {
            overflow: hidden;
        }

        .tab_menu li {
            border: 1px #d3d3d3 solid;
            border-radius: 10px;
            width: 49%;
            float: left;
            height: 50px;
            line-height: 50px;
            color: #333;
            background: #fff;
            text-align: center;
            cursor: pointer;
        }

        .tab_menu li.current {
            color: #fff;
            background: #00B29C;
        }

        .tab_menu li a {
            color: #fff;
            text-decoration: none;
        }

        .tab_menu li.current a {
            color: #333;
        }

        .tab_box {
        }

        .tab_box li {
            line-height: 24px;
            overflow: hidden;
            padding:0px 50px;
            margin: 10px 0px;
        }

        .tab_box li span {
            font-family: "宋体";
            font-size: 12px;
            font-weight: 400;
            color: #ddd;
        }

        .tab_box .hide {
            display: none;
        }
        h4{
            margin-left: 8%;
            line-height: 36px;
            width: 34%;
            display: inline-block;
        }


    </style>
</head>
<body>
<div class="box demo2  ">
    <h1 align="center">我的订单</h1>
    <br>
    <ul class="tab_menu">
        <li   onclick="location.href = '${pageContext.request.contextPath}/coinBuyer/findByUid?id=${user.id}'">求购订单</li>
        <li class="current"  onclick="location.href = '${pageContext.request.contextPath}/order/findByUid?id=${user.id}'">交易订单</li>
    </ul>
    <div    class="tab_box">
        <div class="hide">
            <ul>
                <c:forEach items="${buyers}" var="buyer">
                    <li>
                        <div style="width: 100%;height: 150px">
                            <h2>订单编号:${buyer.iid}</h2>
                            <h4>买家：--</h4>
                            <h4>卖家：${user.username}</h4>
                            <h4>交易时间：--</h4>
                            <h4>交易趣豆个数：${buyer.tradeNum}</h4>
                            <h4>交易趣豆总值：${buyer.tradeNum * buyer.tradePrice}</h4>
                            <h4>交易状态：未匹配</h4>
                        </div>
                        <hr>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div>
            <ul>
                <c:forEach items="${orders}" var="order">
                    <li>
                        <div style="width: 100%;height: 150px">
                            <h2>订单编号:${order.id}</h2>
                            <h4>买家：${order.buyerId}</h4>
                            <h4>卖家：${order.sellerId}</h4>

                            <h4>交易时间:${order.orderTimeStr}</h4>
                            <h4>交易趣豆个数：${order.tradeNum}</h4>
                            <h4>交易趣豆总值：${order.tradeNum * order.tradePrice}</h4>
                            <h4>交易状态：${order.orderStatusStr}</h4>
                            <c:if test="${user.id == order.buyerId && order.orderStatus == 0}">
                                <input style="margin: 0px auto" type="button" value="付款" onclick="location.href = '${pageContext.request.contextPath}/order/pay?id=${order.id}'">

                            </c:if>
                        </div>
                        <hr>
                    </li>
                </c:forEach>
            </ul>
        </div >



    </div>
</div>
</body>
</html>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.tabs.js"></script>
<script type="text/javascript">
    $(function () {
        $('.demo2').Tabs({
            event: 'click'
        });

    });
</script>
