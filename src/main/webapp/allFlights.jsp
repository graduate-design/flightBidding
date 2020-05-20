<%@ page import="njtech.design.flightBerth.entity.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="njtech.design.flightBerth.entity.dto.FlightRespDTO" %>
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
    <title>所有航班信息</title>

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
        <li class="layui-nav-item" >
            <a href="javascript:;">查询航班</a>
            <dl class="layui-nav-child">
                <dd><a href="findFlight.jsp">精确查找</a></dd>
                <dd><a href="javascript:window.location = 'bid/flights'">所有航班</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item" >
            <a href="javascript:;">竞价信息</a>
            <dl class="layui-nav-child">
                <dd><a href="javascript:window.location = 'user/checkAdd'">添加机票信息</a></dd>
                <dd><a href="javascript:window.location = 'user/checkTicket'">机票信息</a></dd>
                <dd><a href="javascript:window.location = 'bid/showBid'">竞价信息</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">个人信息</a>
            <dl class="layui-nav-child">
                <dd><a href="javascript:window.location = 'user/checkAuth'">身份认证</a></dd>
                <dd><a href="changePsd.jsp">修改密码</a></dd>
                <dd><a href="index.jsp">退出</a></dd>
            </dl>
        </li>
        <span class="layui-layout-right">
            <li class="layui-nav-item"><a href="success.jsp">返回首页</a></li>
        </span>
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


    <%
        List<FlightRespDTO> list = (List<FlightRespDTO>) session.getAttribute("allFlights");
        for (FlightRespDTO flight:list){
    %>
    <form action="${pageContext.request.contextPath}/bid/check" method="get">
    <tr>
        <td>
            <%
                out.print(flight.getAirCompanyName());%>
        </td>
        <td>
            <%
                out.print(flight.getFlightNum());%>
        </td>
        <td>
            <%
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                String date = sdf.format(flight.getFlightDate());
                out.print(date);
            %>
        </td>
        <td>
            <button class="layui-btn" lay-submit lay-filter="formDemo"><input type="hidden" name = "flight" value="<%=flight.getId()%>" readonly>竞价</button>
        </td>
        </tr>
    </form>
            <%
        }
    %>

    </tbody>
</table>


</body>
</html>
