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
            height: 430px;
            text-align: center;
        }

        .ul_list > li {
            display: inline-block;
            margin-left: 8%;
        }
        .ul_li{

            display: inline-block;
            margin-left: 9%;
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

        #bor {
        }

        #demo1 {

        }
    </style>
    <link href="/css/jquery.slideBox.css" rel="stylesheet" type="text/css"/>
    <script src="/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="/js/jquery.slideBox.js" type="text/javascript"></script>
    <script>
        jQuery(function ($) {
            $('#demo1').slideBox();
            $('#demo2').slideBox({
                direction: 'top', //left,top#方向
                duration: 0.3, //滚动持续时间，单位：秒
                easing: 'linear', //swing,linear//滚动特效
                delay: 5, //滚动延迟时间，单位：秒
                startIndex: 1//初始焦点顺序
            });
            $('#demo3').slideBox({
                duration: 0.3, //滚动持续时间，单位：秒
                easing: 'linear', //swing,linear//滚动特效
                delay: 5, //滚动延迟时间，单位：秒
                hideClickBar: false, //不自动隐藏点选按键
                clickBarRadius: 10
            });
            $('#demo4').slideBox({
                hideBottomBar: true//隐藏底栏
            });
        });
    </script>
</head>
<body>
<div class="container" id="bor">
    <%--轮播图--%>
    <div style="margin:0 auto;width:1100px;height: 400px;">
        <div id="demo1" class="slideBox" style=" width: 1100px;
      height: 400px;">
            <ul class="items">
                <li><a href="#" title="最后一波红酒限时秒杀"><img src="/img/life/1.jpg"></a></li>
                <li><a href="#" title="最后一波红酒限时秒杀"><img src="/img/life/2.jpg"></a></li>
                <li><a href="#" title="最后一波红酒限时秒杀"><img src="/img/life/3.jpg"></a></li>
                <li><a href="#" title="最后一波红酒限时秒杀"><img src="/img/life/4.jpg"></a></li>
                <li><a href="#" title="最后一波红酒限时秒杀"><img src="/img/life/5.jpg"></a></li>
            </ul>
        </div>
    </div>


    <div id="commodity">
        <h2>趣淘吧</h2>
        <form action="${pageContext.request.contextPath}/commodity/showAllStoreCom">
            <ul style="list-style: none" class="ul_list2">
                <c:forEach items="${pageCom.list}" var="commodity">
                    <li class="ul_li">
                        <div class="commodity">
                            <a href="#" class="">
                                <img src="${commodity.cimg}" alt="" class="commoditySize">
                                <h5>${commodity.cname}</h5>
                                <img src="/img/coin.png" alt=""><span class="coinColor">${commodity.cprice}</span>
                                <span style="font-size: 12px">趣豆</span>
                            </a></div>
                    </li>
                </c:forEach>
            </ul>
            <div style="margin:0px auto;display: block;width: 200px;height: 100px ">
                <br>
                <br>
                <br>
                <nav aria-label="Page navigation">
                    <ul class="pagination">

                        <c:if test="${pageCom.pageNum == 1}">
                            <li class="disabled">
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${pageCom.pageNum != 1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/commodity/showAllStoreCom?pageNum=${pageCom.pageNum - 1}&pageSize=${pageCom.pageSize}&cname=${callback.cname}&cprice=${callback.cprice}&cimg=${callback.cimg}"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach begin="1" end="${pageCom.pageCount}" step="1" var="i">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/commodity/showAllStoreCom?pageNum=${i}&pageSize=${pageCom.pageSize}&cname=${callback.cname}&cprice=${callback.cprice}&cimg=${callback.cimg}">${i}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${pageCom.pageNum == pageCom.pageCount}">
                            <li class="disabled">
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${pageCom.pageNum != pageCom.pageCount}">
                            <li>
                                <a href="${pageContext.request.contextPath}/commodity/showAllStoreCom?pageNum=${pageCom.pageNum + 1}&pageSize=4&cname=${callback.cname}&cprice=${callback.cprice}&cimg=${callback.cimg}"
                                   aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                    </ul>
                </nav>
                <h3 style="text-align: center">共${pageCom.dataCount}条</h3>
            </div>
        </form>
        <div style="height: 300px"></div>
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
