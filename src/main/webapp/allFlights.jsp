<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: liber
  Date: 2020/5/13
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/layui/layui-v2.5.6/layui/css/layui.css">
<script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.js"></script>
<script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.all.js"></script>

<script>

    $(document).ready(function () {
        var element = layui.element;
        element.render();
    });
</script>

</head>

<body>

<div>
    <ul class="layui-nav" lay-filter = "">
        <li class="layui-nav-item">
            <a href="javascript:;">查询航班</a>
            <dl class="layui-nav-child">
                <dd><a href="findFlight.jsp">精确查找</a></dd>
                <dd><a href="javascript:window.location = 'bid/flights'">所有航班</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">个人管理</a>
            <dl class="layui-nav-child">
                <dd><a href="addTicket.jsp">添加机票信息</a></dd>
                <dd><a href="javascript:;">退出</a></dd>
            </dl>
        </li>
    </ul>
</div>



<table lay-filter="parse-table-demo" class="layui-table">
    <thead>
    <tr>
        <th lay-data="{field:'airCompanyName', minWidth:2000}">航空公司</th>
        <th lay-data="{field:'flightNum', minWidth:2000}">航班号</th>
        <th lay-data="{field:'flightDate', minWidth: 2000}">起飞时间</th>
        <th lay-date="{fieId:'button',minWidth: 2000}"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${allFlights}" var="flight">
        <form action="${pageContext.request.contextPath}/bid/check" method="get">
            <tr>
                <td>${flight.airCompanyName}</td>
                <td>${flight.flightNum}</td>
                <td>${flight.flightDate}</td>
                <td><input type="hidden" name = "flight" value="${flight.id}" readonly><button class="layui-btn" lay-submit lay-filter="formDemo">竞价</button></td>
            </tr>
        </form>

    </c:forEach>
    </tbody>
</table>


</body>
</html>
