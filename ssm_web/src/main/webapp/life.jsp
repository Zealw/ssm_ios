<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
            width: 379px;
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


    </style>
    <link href="css/jquery.slideBox.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.slideBox.js" type="text/javascript"></script>

</head>
<body>
<div class="container" id="bor">

    <div id="rank">

    </div>
    <br>
    <br>
    <div>
        <ul style="list-style: none" class="ul_list3">
            <li>
                <div class="icon"><a href="/home.jsp" class="" id=""><img src="/img/life_1/school.png"
                                                                          alt="">商学院</a></div>
            </li>
            <li>
                <div class="icon"><a href="/store.jsp" class=""><img src="/img/life_1/star.png" alt="">知识星球</a></div>
            </li>
            <li>
                <div class="icon"><a href="/life.jsp" class=""><img src="/img/life_1/material.png" alt="">推广素材</a></div>
            </li>
            <li>
                <div class="icon"><a href="${pageContext.request.contextPath}/coin/release" class=""><img
                        src="/img/life_1/free.png" alt="">释放环保值</a></div>
            </li>
        </ul>
    </div>
    <div>
        <ul style="list-style: none" class="ul_list4">
            <li>
                <div class="button"><a href="/home.jsp" class="" id="">
                    <div class="button_font">
                        <br>
                        <h1>排行榜</h1>
                        <span>看自己的排名</span>
                    </div>
                    <img src="/img/life_1/school.png" alt=""></a></div>
            </li>
            <li>
                <div class="button"><a href="/store.jsp" class="">
                    <div class="button_font">
                        <br>
                        <h1>排行榜</h1>
                        <span>看自己的排名</span>
                    </div>
                    <img src="/img/life_1/star.png" alt=""></a></div>
            </li>
            <li>
                <div class="button"><a href="/life.jsp" class="">
                    <div class="button_font">
                        <br>
                        <h1>排行榜</h1>
                        <span>看自己的排名</span>
                    </div>
                    <img src="/img/life_1/material.png" alt=""></a></div>
            </li>
            <li>
                <div class="button"><a href="/market.jsp" class="">
                    <div class="button_font">
                        <br>
                        <h1>排行榜</h1>
                        <span>看自己的排名</span>
                    </div>
                    <img src="/img/life_1/free.png" alt=""></a></div>
            </li>
        </ul>
    </div>
    <div class="box demo2">
        <ul class="tab_menu">
            <li class="current">环保百科</li>
            <li>生活达人</li>
            <li>环保动态</li>
        </ul>
        <div class="tab_box">

            <div>
                <ul>
                    <c:forEach items="${news}" var="new1">
                        <li><a href="#">
                            <div style="width: 100%;height: 150px">
                                <div style="height: 100%;width: 70%;display: inline-block">
                                    <h1>${new1.title}</h1>
                                    <span style="">
                                            ${new1.date}
                                    </span>
                                </div>
                                <div style="height: 100%;width: 28%;display: inline-block">
                                    <img src="${pageContext.request.contextPath}${new1.nimg}" alt="" width="100%"
                                         height="100%">
                                </div>
                            </div>
                            <hr>
                        </a></li>
                    </c:forEach>
                    <li><a href="#">
                        <div style="width: 100%;height: 150px">
                            <div style="height: 100%;width: 70%;display: inline-block">
                                <h1>1</h1>
                                <span style="">
              2019-10-06 21:38:36
            </span>
                            </div>
                            <div style="height: 100%;width: 28%;display: inline-block">
                                <img src="/img/life_1/comp.png" alt="" width="100%" height="100%">
                            </div>
                        </div>
                        <hr>
                    </a></li>
                </ul>
            </div>
            <div class="hide">
                <ul>


                    <li><a href="#">
                        <div style="width: 100%;height: 150px">
                            <div style="height: 100%;width: 70%;display: inline-block">
                                <h1>武林秘籍之垃圾处理</h1>
                                <span style="">
              2019-10-06 21:38:36
            </span>
                            </div>
                            <div style="height: 100%;width: 28%;display: inline-block">
                                <img src="/img/life_1/comp.png" alt="" width="100%" height="100%">
                            </div>
                        </div>
                        <hr>


                    </a></li>
                </ul>
            </div>
            <div class="hide">
                <ul>

                    <li><a href="#">
                        <div style="width: 100%;height: 150px">
                            <div style="height: 100%;width: 70%;display: inline-block">
                                <h1>武林秘籍之垃圾处理</h1>
                                <span style="">
              2019-10-06 21:38:36
            </span>
                            </div>
                            <div style="height: 100%;width: 28%;display: inline-block">
                                <img src="/img/life_1/comp.png" alt="" width="100%" height="100%">
                            </div>
                        </div>
                        <hr>


                    </a></li>
                </ul>
            </div>


        </div>
    </div><!--demo2 end-->
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <div id="bottom">
        <ul style="list-style: none" class="ul_list">
            <li>
                <div class="icon"><a href="${pageContext.request.contextPath}/home.jsp" class="" id="home"><img
                        src="/img/home.png" alt="">首页</a></div>
            </li>
            <li>
                <div class="icon"><a href="${pageContext.request.contextPath}/commodity/showAllStoreCom" class=""><img
                        src="/img/store.png" alt="">商店</a></div>
            </li>
            <li>
                <div class="icon"><a href="${pageContext.request.contextPath}/news/findAll" class=""><img
                        src="/img/life.png" alt="">生活</a></div>
            </li>
            <li>
                <div class="icon"><a href="${pageContext.request.contextPath}/coinBuyer/all" class=""><img
                        src="/img/market.png" alt="">市场</a></div>
            </li>
            <li>
                <div class="icon"><a href="${pageContext.request.contextPath}/mine.jsp" class=""><img
                        src="/img/mine.png" alt="">我的</a></div>
            </li>
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
