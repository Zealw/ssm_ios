<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


  <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
  <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
  <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
  <!--[if lt IE 9]>-->
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <title>首页</title>

    <style>
      .icon{
        width: 100px;
        height: 130px;
        text-align: center;
      }
      .commodity{
        width: 400px;
        height: 440px;
        text-align: center;
      }
      .ul_list>li{
        display: inline-block;
        margin-left: 8%;
      }
      .ul_list1>li{
        display: inline-block;
        margin-left: 18%;
      }
      .ul_list2>li{

        display: inline-block;
        margin-left: 9%;
      }
      .ul_li{

          display: inline-block;
          margin-left: 9%;
      }
      .icon>a>img{
        width: 100px;
        height: 100px;
      }
      #showCoin{
        height: 150px;
        width: 100%;
        background: darkgreen;
        border-radius: 20px;
          color: whitesmoke;
          font-size: 30px;
      }
      #location{
        height: 70px;
      }
      #topLocat{
        width: 30px;
        height: 30px;

      }
      #topScan{
        width: 30px;
        height: 30px;
        float: right;

      }

      #notice{
        height: 60px;
        background: #7F8490;
      }
      .coinColor{
        font-size: 12px;
        color:#009377;
      }
      .commoditySize{
        width: 100%;

      }
      #bottom{
        width: 1140px;
        position: fixed;
        top: 830px;
        background: #E7EAED;
        height: 150px;

      }
    </style>
  </head>
  <body>
  <div class="container">
    <br>
    <div id="location">
        <img src="/img/topLocat.png"id="topLocat" alt="">山西省 太原市 小店区
      <img src="/img/topScan.png" id="topScan" alt="">
    </div>
    <div id="showCoin">
        <p id="myCoin">我的趣豆:${sessionScope.user.coin.coinNum}</p>
        <p>环保值:${sessionScope.user.coin.evrValue}</p>
        <a href="">
            <input type="button" name=""  value="答题" onclick="getCoin();" style="margin-left: 45%;color: black;border-radius: 2px" >
        </a>
        <br>
    </div>
    <br>
    <br>
    <div>
      <ul style="list-style: none" class="ul_list1">
        <li><div class="icon"><a href="/home.jsp" class=""id="new"><img src="/img/lending.png" alt="">新手指南</a></div></li>
        <li><div class="icon"><a href="/store.jsp" class=""><img src="/img/sort.png" alt="">分类指导</a></div></li>
        <li><div class="icon"><a href="javascript:void(0);" id="check" onclick="checkInCoin();"><img src="/img/sign.png" alt="">每日签到</a></div></li>
          <br>
          <br>
        <li><div class="icon"><a class="" id="answer" onclick="getCoin();"><img src="/img/answer.png" alt="">答题</a></div></li>
        <li><div class="icon"><a href="/mine.jsp" class=""><img src="/img/scan.png" alt="">扫码投递</a></div></li>
        <li><div class="icon"><a href="${pageContext.request.contextPath}/user/buyTask" class=""><img src="/img/activeness.png" alt="">环保计划</a></div></li>
      </ul>
    </div>
    <div id="notice">

    </div>
    <div id="commodity">
      <h2>趣淘吧</h2>
            <ul style="list-style: none" class="ul_list2">
                <c:forEach items="${commodities}" var="commodity">
                    <li class="ul_li"><div class="commodity">
                            <a href="${pageContext.request.contextPath}/user/buyCom?id=${commodity.id}" class="">
                                <img src="${commodity.cimg}" alt="" class="commoditySize">
                                <h5 name="cname">${commodity.cname}</h5>
                                <input type="text" name="cname" id="" hidden value="${commodity.cname}">
                                <img src="/img/coin.png" alt=""><span class="coinColor" name="cprice">${commodity.cprice}</span>
                                <input type="text" name="cprice" id="" hidden value="${commodity.cprice}">
                                <span style="font-size: 12px">趣豆</span>
                            </a>

                        </div></li>
                </c:forEach>
            </ul>
        <div style="height: 150px; background-color: #ffffff"></div>
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
    $(function () {
        // $("#check").click(function () {
        //     checkInCoin();
        // })
        // $("#answer").click(function () {
        //     getCoin();
        // })


    })
    //usercument.getElementById("new").onclick = dianji();
    $("#new").click(dianji) ;
    function dianji() {
        alert(111)

    }
    function getCoin() {
        $.get("${pageContext.request.contextPath}/count/answer", function (data) {
                console.log(data)
                $("#myCoin").html("我的趣豆:" + data.coin.coinNum)
            },"json")
        alert("答题获得趣豆" + ${sessionScope.user.coin.dailyProduct})

    }
    function checkInCoin() {
        $.get("${pageContext.request.contextPath}/count/checkIn",function (data) {
            console.log(data)
                $("#myCoin").html("我的趣豆:" + data.coin.coinNum)
            },"json")
        alert("签到成功！")
    }



</script>
