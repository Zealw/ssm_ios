<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  count: Administrator
  Date: 2019/9/30
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处理结果信息</title>
</head>
<c:if test="${result.result}">
    <body style="background: url('${pageContext.request.contextPath}/img/index/success.jpg'); background-size: 100%">
    <h1>${result.message}</h1>
    </body>
</c:if>
<c:if test="${!result.result}">
    <body style="background: url('${pageContext.request.contextPath}/img/index/fail.jpg');background-size: 100%;">
    <h1>${result.message}</h1>
    </body>
</c:if>
</html>
