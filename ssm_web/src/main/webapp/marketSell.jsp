<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>-->
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <title>卖场</title>
    <%--<link rel="stylesheet" href="/css/style1.css">--%>
    <style>
        .icon {
            width: 100px;
            height: 130px;
            text-align: center;
        }

        .commodity {
            width: 400px;
            height: 650px;
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

        #showCoin {
            height: 150px;
            width: 100%;
            background: darkgreen;
            border-radius: 20px;
        }

        #location {
            height: 70px;
        }

        #topLocat {
            width: 30px;
            height: 30px;

        }

        #topScan {
            width: 30px;
            height: 30px;
            float: right;

        }

        #notice {
            height: 60px;
            background: #7F8490;
        }

        .coinColor {
            font-size: 12px;
            color: #009377;
        }

        .commoditySize {
            width: 100%;

        }

        #bottom {
            width: 1140px;
            position: fixed;
            top: 830px;
            background: #E7EAED;
            height: 150px;
            padding-left: 42px;

        }

        .hr1 {
            background-color: #E7EAED;
            height: 1px;
            border: none;
            margin: 0px;
            padding: 0px;

        }

        .hr2 {
            background-color: #87939A;
            height: 1px;
            border: none;
            margin: 0px;
            padding: 0px;
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
            margin-right: 16px;
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
            /*border: 1px solid #d3d3d3;*/
        }

        .tab_menu {
            overflow: hidden;
        }

        .tab_menu li {
            border: 1px #d3d3d3 solid;
            border-radius: 10px;
            width: 568px;
            float: left;
            height: 50px;
            line-height: 50px;
            color: #333;
            background: #fff;
            text-align: center;
            cursor: pointer;
            font-size: 20px;
        }

        .tab_menu li.current {
            color: #fff;
            font-size: 20px;
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
            padding-left: 50px;
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

        .trade {
            width: 100%;
            height: 150px;
            background-color: #00B29C;
            color: #FFFFFF;
            text-align: center;
            border-radius: 10px;
        }
        .trade1 {
            width: 100%;
            height: 150px;
            background-color: #FFA500;
            color: #FFFFFF;
            text-align: center;
            border-radius: 10px;

        }

        .trade_all {
            width: 100%;
            height: 50%;

        }

        .trade_detail {
            width: 100%;
            height: 50%;

        }

        .trade_price {
            width: 50%;
            display: inline-block;
            text-align: center;
            border-right: 1px whitesmoke solid;
        }

        #trade_need  {
            width: 49%;
            display: inline-block;
            text-align: center;
        }
        #trade_sell{
            width: 49%;
            display: inline-block;
            text-align: center;
        }

        h3 {
            color: #FFFFFF;
            font-size: 18px;
            margin: 4px;
        }

        #need_button {
            background-color: orange;
            color: #FFFFFF;
            border-radius: 20px;
            width: 20%;
            height: 40px;
            line-height: 40px;
        }
        #inp{
            width: 70%;
        }
        #inp_sell{
            width: 90%;
        }

        #submit {
              width: 9%;
              height: 40px;
              border-radius: 20px;
          }
        #submit_sell {
            width: 9%;
            height: 40px;
            border-radius: 20px;
        }
        .username{
            font-size: 22px;
            font-weight: bolder;
        }
        #needNum {


        }
        #needPrice{
            font-size: 12px;
            color: #7F8490;

        }
        #sellNum {
            font-size: 12px;
            color: #7F8490;

        }
        #sellPrice{
            font-size: 12px;
            color: #7F8490;
        }
        #need_list{
            width: 100%;
            height: 150px;
        }
        #sell_list{
            width: 100%;
            height: 150px;
        }
        #need_list>ul>li>div>div{
            display: inline-block;
        }
        #need_list>ul>li{
            margin: 0px;
            padding: 0px;
        }
        #sell_list>ul>li>div>div{
            display: inline-block;
        }
        #sell_list>ul>li{
            margin: 0px;
            padding: 0px;
        }

        #sell_inp{
            background-color: #FFFFFF;
            border-radius: 20px;
            border: 1px gray solid;
        }
        #buy_inp{
            background-color: #FFFFFF;
            border-radius: 20px;
            border: 1px gray solid;
        }
    </style>
</head>
<body>
<div class="container">
    <br>
    <div style="width: 100%">
        <div style="width: 44%;display: inline-block">
            <img src="/img/market/mark.png" alt="" style="width: 17px;height: 17px">
            <span style="color:#5593F1 ">须知</span>
        </div>
        <div style="width: 50%;display: inline-block">
            <span style="font-size: 26px;font-weight:bolder;text-align: center">转换中心</span>

        </div>
        <div style="display: inline-block">
            <span style="text-align: right"> <a href="#">我的订单</a></span>
        </div>
    </div>
    <br>
    <hr class="hr1">
    <hr class="hr2">
    <br>
    <div class="box demo2">
        <ul class="tab_menu">
            <li ><a href="${pageContext.request.contextPath}/do/showAllSeller">求购市场</a></li>
            <li class="current">卖场</li>
        </ul>
        <div class="tab_box">
            <div>
                <div class="trade">
                    <div class="trade_all">
                        <br>
                        <h3>交易总量</h3>
                        <h3>23435345</h3>
                    </div>
                    <div class="trade_detail">
                        <div class="trade_price">
                            <h3>3.93</h3>
                            <h3>今日价格</h3>
                        </div>
                        <div id="trade_need">
                            <h3>434641136</h3>
                            <h3>求购总量</h3>
                        </div>
                    </div>
                </div>
                <div id="need">
                    <input type="button" name="" id="need_button" value="我要求购">
                    <input type="text" name="" id="inp" placeholder="输入对方手机号查询溢价单">
                    <input type="submit" name="" id="submit" value="Go">
                </div>
                <div id="need_list">
                    <ul>
                        <li style="height: 100%">
                            <div style="height: 100%">
                                <div style="width: 20%">
                                    <img src="/img/market/user_img.png" alt="" style="width: 100%;height: 100%">
                                </div>
                                <div style="width: 60%">
                                    <p class="username">匿名</p>
                                    <p id="needNum">数量：1</p>
                                    <p id="needPrice">单价：￥3.93</p>
                                </div>
                                <div style="width: 19%;margin: 0px;padding: 0px">
                                    <input type="button" name="" id="sell_inp" value="卖给他" style="width: 60%; float: right">
                                    <img src="/img/market/pay.png" alt="" style="width: 20px;height: 20px">
                                </div>
                            </div>
                            <hr>
                        </li>
                    </ul>

                </div>
            </div>
            <div class="hide">
                <div class="trade1">
                    <div class="trade_all">
                        <br>
                        <h3>交易总量</h3>
                        <h3>23435345</h3>
                    </div>
                    <div class="trade_detail">
                        <div class="trade_price">
                            <h3>3.93</h3>
                            <h3>今日价格</h3>
                        </div>
                        <div id="trade_sell">
                            <h3>0</h3>
                            <h3>出售总量</h3>
                        </div>
                    </div>
                </div>
                <div id="need">
                    <input type="text" name="" id="inp_sell" placeholder="输入对方手机号查询溢价单">
                    <input type="submit" name="" id="submit_sell" value="Go">
                </div>
                <div id="sell_list">
                    <ul>
                        <li style="height: 100%">
                            <div style="height: 100%">
                                <div style="width: 20%">
                                    <img src="/img/market/user_img.png" alt="" style="width: 100%;height: 100%">
                                </div>
                                <div style="width: 60%">
                                    <p class="username">匿名</p>
                                    <p id="sellNum">数量：1</p>
                                    <p id="sellPrice">单价：￥3.93</p>
                                </div>
                                <div style="width: 19%;margin: 0px;padding: 0px">
                                    <input type="button" name="" id="buy_inp" value="卖给他" style="width: 60%; float: right">
                                    <img src="/img/market/pay.png" alt="" style="width: 20px;height: 20px">
                                </div>
                            </div>
                            <hr>
                        </li>
                    </ul>

                </div>
            </div>

        </div>
    </div><!--demo2 end-->

    <div id="bottom">
        <ul style="list-style: none" class="ul_list">
            <li><div class="icon"><a href="${pageContext.request.contextPath}/home.jsp" class=""id="home"><img src="/img/home.png" alt="">首页</a></div></li>
            <li><div class="icon"><a href="${pageContext.request.contextPath}/commodity/showAllStoreCom" class=""><img src="/img/store.png" alt="">商店</a></div></li>
            <li><div class="icon"><a href="${pageContext.request.contextPath}/life.jsp" class=""><img src="/img/life.png" alt="">生活</a></div></li>
            <li><div class="icon"><a href="${pageContext.request.contextPath}/coinBuyer/all" class=""><img src="/img/market.png" alt="">市场</a></div></li>
            <li><div class="icon"><a href="${pageContext.request.contextPath}/mine.jsp" class=""><img src="/img/mine.png" alt="">我的</a></div></li>
        </ul>
    </div>


</div>
</body>
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
</html>
