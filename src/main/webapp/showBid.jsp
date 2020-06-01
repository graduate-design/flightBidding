<%@ page import="njtech.design.flightBerth.entity.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="njtech.design.flightBerth.entity.dto.ShowBidDTO" %>
<%@ page import="njtech.design.flightBerth.entity.Flight" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: liber
  Date: 2020/5/19
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>竞价信息</title>

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
                <dd><a href="javascript:window.location = 'user/exit'">退出</a></dd>
            </dl>
        </li>
        <span class="layui-layout-right">
            <li class="layui-nav-item"><a href="success.jsp">返回首页</a></li>
        </span>
    </ul>
</div>


<%
    String user = (String) session.getAttribute("phone");
    if(StringUtils.isEmpty(user)){
        request.getRequestDispatcher("index.jsp").forward(request, response);
%>
<%--<jsp:forward page="index.jsp" />;--%>
<%
    }
%>

<table lay-filter="parse-table-demo" class="layui-table" style="align-content: center">
    <thead>
    <tr>
        <th lay-data="{field:'airCompanyName', minWidth:2000}">航空公司</th>
        <th lay-data="{field:'flightNum', minWidth:2000}">航班号</th>
        <th lay-data="{field:'flightDate', minWidth: 2000}">起飞时间</th>
        <th lay-data="{field:'start', minWidth: 2000}">起飞地</th>
        <th lay-data="{field:'destination', minWidth: 2000}">目的地</th>
        <th lay-data="{field:'berthClass', minWidth: 2000}">竞价舱位</th>
        <th lay-data="{field:'price', minWidth: 2000}">竞价金额</th>
        <th lay-date="{fieId:'rank',minWidth: 2000}">实时排名</th>
        <th lay-date="{fieId:'button1',minWidth: 200}"></th>
        <th lay-date="{fieId:'button2',minWidth: 200}"></th>
    </tr>
    </thead>
    <tbody>
    <%--<c:forEach items="${allTickets}" var="ticket">--%>
    <%--<form action="${pageContext.request.contextPath}/bid/check" method="get">--%>
    <%
        List<ShowBidDTO> showBids = (List<ShowBidDTO>) session.getAttribute("showBid");
        if (showBids!=null)
        for (ShowBidDTO showBid:showBids){
            Flight flight = showBid.getFlight();
    %>

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
                <%out.print(flight.getStartPlace());%>
            </td>
            <td>
                <%out.print(flight.getTargetPlace());%>
            </td>
            <td>
                <%
                    if ("BusinessClass".equalsIgnoreCase(showBid.getBidClass())){
                        out.print("商务舱");
                    }
                    if ("FirstClass".equalsIgnoreCase(showBid.getBidClass())){
                        out.print("头等舱");
                    }
                    %>
            </td>
            <td>
                <%out.print(showBid.getPrice());%>
            </td>
            <td>
                <%out.print(showBid.getRank());%>
            </td>
            <td>
                <form action="${pageContext.request.contextPath}/bid/addBid" method="get">
                    <input type="hidden" name = "flightId" value="<%=flight.getId()%>" readonly>
                    <input type="hidden" name = "flightCode" value="<%=flight.getFlightCode()%>" readonly>
                    <button class="layui-btn" lay-submit lay-filter="formDemo">增加竞价</button>
                </form>
            </td>
            <td>
                <form action="${pageContext.request.contextPath}/bid/exitBid" method="get">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <input type="hidden" name = "flightId" value="<%=flight.getId()%>" readonly>退出竞价</button>
                </form>
            </td>

    <%   }

    %>

    </tbody>
</table>


</body>
</html>
