<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
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
    <title>首页</title>
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
            margin-left: 12%;
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

        }

        #green {
            background-color: #00B29C;
            width: 100%;
            height: 350px;
            color: whitesmoke;
        }

        #white {
            background-color: whitesmoke;
            width: 100%;
            height: 1300px;
        }

        #username {

            font-size: 26px;
            font-weight: bold;
        }

        #phone {
            font-size: 16px;
        }

        .numSize {
            font-size: 24px;
            font-weight: bold;
        }

        #part1 {
            padding: 20px;
            width: 90%;
            background-color: #FFFFFF;
            margin: -26px auto 0px;
        }

        #part2 {
            padding: 20px;
            width: 90%;
            background-color: #FFFFFF;
            margin: 24px auto 0px;
        }

        #part3 {
            padding: 20px;
            width: 90%;
            background-color: #FFFFFF;
            margin: 24px auto 0px;
        }

        #part2 > ul > li {
            height: 50px;
            line-height: 40px;
            background-color: #FFFFFF;
            padding: 10px 20px;

        }

        #part3 > ul > li {
            height: 50px;
            line-height: 40px;
            background-color: #FFFFFF;
            padding: 10px 20px;

        }

        #bottom_button {
            color: #FFFFFF;
            text-align: center;
            font-size: 40px;
            width: 90%;
            height: 70px;
            line-height: 60px;
            background-color: #00B29C;
            border-radius: 10px;
            margin: 30px auto 0px 5%;
        }

    </style>
</head>
<body>
<div class="container">
    <div id="green">
        <div style="height: 100px">
            <div style="display: inline-block; width: 40%">
                <div style="display: inline-block; margin-left: 30px;">

                    <img src="${user.uimg}" alt=""
                         style="border-radius: 50%;height: 100%;margin-top: -65px;">
                </div>
                <div style="display: inline-block;margin-top: 27px;padding-left: 20px;padding-top: 10px;">
                    <p id="username">${user.username}</p>
                    <p id="phone">${user.phoneNum}</p>
                </div>
            </div>
            <div style="display: inline-block ;float: right;padding: 36px">
                <a href="${pageContext.request.contextPath}/updateUserMsg.jsp">
                    <img src="/img/mine/setting.png" alt="" style="height: 50%;">
                </a>
            </div>
        </div>
        <br>
        <br>
        <div style="height: 250px">
            <div style="width: 60%;display: inline-block;margin-left: 127px">
                <p class="numSize" id="myCoin">${user.coin.coinNum}</p>
                <a href="${pageContext.request.contextPath}/detailList.jsp">
                    <p>当前趣豆<img src="/img/mine/iron.png" alt=""></p>
                </a>
            </div>
            <div style="width: 20%;display: inline-block">
                <div style="width: 50%;border-right: 1px whitesmoke solid;display: inline-block;text-align: center">
                    <p class="numSize">${user.coin.evrValue}</p>
                    <p>环保值</p>
                </div>
                <div style="width: 40%;display: inline-block;text-align: center">
                    <p class="numSize">0.000</p>
                    <p>QFL</p>
                </div>
            </div>

        </div>


    </div>
    <div id="white">
        <div>
            <div id="part1">
                <h1>会员中心</h1>
                <img src="/img/mine/V1.png" alt="">
                <span style="float: right;color: #00B29C">${user.coin.activeness / 500 * 100}% </span>
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
                         aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                         style="width: ${count.coin.activeness / 500 * 100}%">
                        <span class="sr-only">40% Complete (success)</span>
                    </div>
                </div>
                <p>活跃度：${sessionScope.user.coin.activeness}</p>
                <hr>
                <ul style="list-style: none" class="ul_list1">
                    <li>
                        <div class="icon"><a href="${pageContext.request.contextPath}/user/certify"
                                             class="" id=""><img src="/img/mine/modify.png" alt="">实名认证</a>
                        </div>
                    </li>
                    <li>
                        <div class="icon"><a href="/store.jsp" class=""><img src="/img/mine/invite.png" alt="">邀请好友</a>
                        </div>
                    </li>
                    <li>
                        <div class="icon"><a href="/life.jsp" class=""><img src="/img/mine/team.png" alt="">我的团队</a>
                        </div>
                    </li>
                    <li>
                        <div class="icon"><a href="/market.jsp" class=""><img src="/img/mine/task.png" alt="">环保任务</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="part2">
                <ul style="list-style: none">
                    <li>
                        <img src="/img/mine/bill.png" alt="" style=""><span>账单明细</span><img src="/img/mine/arrow.png"
                                                                                            alt=""
                                                                                            style="float: right;margin-top: 10px">

                    </li>
                    <hr>
                    <li>
                        <img src="/img/mine/trans.png" alt="" style=""><span>交易订单</span><img src="/img/mine/arrow.png"
                                                                                             alt=""
                                                                                             style="float: right;margin-top: 10px">
                        <hr>
                    </li>
                    <hr>
                    <li>
                        <img src="/img/mine/shop.png" alt="" style=""><span>商场订单</span><img src="/img/mine/arrow.png"
                                                                                            alt=""
                                                                                            style="float: right;margin-top: 10px">
                        <hr>
                    </li>
                    <hr>
                    <li>
                        <img src="/img/mine/city.png" alt="" style=""><span>城市盟主</span><img src="/img/mine/arrow.png"
                                                                                            alt=""
                                                                                            style="float: right;margin-top: 10px">
                        <hr>
                    </li>
                </ul>

            </div>
            <div id="part3">
                <ul style="list-style: none">
                    <li>
                        <img src="/img/mine/notice.png" alt="" style=""><span>系统公告</span><img src="/img/mine/arrow.png"
                                                                                              alt=""
                                                                                              style="float: right;margin-top: 10px">

                    </li>
                    <hr>
                    <li>
                        <img src="/img/mine/help.png" alt="" style=""><span>在线客服</span><img src="/img/mine/arrow.png"
                                                                                            alt=""
                                                                                            style="float: right;margin-top: 10px">
                        <hr>
                    </li>
                    <hr>
                    <li>
                        <img src="/img/mine/about.png" alt="" style=""><span>关于我们</span><img src="/img/mine/arrow.png"
                                                                                             alt=""
                                                                                             style="float: right;margin-top: 10px">
                        <hr>
                    </li>
                </ul>
            </div>
                <button id="bottom_button" onclick="clear()">退出登录</button>
        </div>

    </div>


    <div id="bottom">
        <ul style="list-style: none" class="ul_list">
            <li><div class="icon"><a href="${pageContext.request.contextPath}/home.jsp" class=""id="home"><img src="/img/home.png" alt="">首页</a></div></li>
            <li><div class="icon"><a href="${pageContext.request.contextPath}/commodity/showAllStoreCom" class=""><img src="/img/store.png" alt="">商店</a></div></li>
            <li><div class="icon"><a href="${pageContext.request.contextPath}/news/findAll" class=""><img src="/img/life.png" alt="">生活</a></div></li>
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
</html>
<script>
    $("#bottom_button").click(function () {
        clear()
    })
    function clear() {
        location.href = "${pageContext.request.contextPath}/count/clear"

    }
</script>
