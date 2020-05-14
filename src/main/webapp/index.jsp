<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>竞价升舱系统首页/title></title>
</head>
<body style="text-align: center;">

<div align="center">
    ${msg}
    <form action="bidding/findFlight" method="post">
        航空公司：<input type="text" name="airCompanyName"><br>
        航班号：<input type="text" name="flightNum"><br>
        开始日期：<input type="date" name="startDate"><br>
        <%--截止日期：<input type="date" name="endDate"><br>--%>
        <input type="submit" value="查询">
    </form>
</div>

<%--<h1>欢迎来到无敌舰队竞价升舱系统</h1>--%>
<%--<!--如果获取的session中的user为空，，提示欢迎光临，游客  -->--%>
<%--<!--<c:if test="${sessionScope.user==null }">--%>
    	<%--欢迎光临，游客--%>
    <%--</c:if>-->--%>
<%--<a href="${pageContext.request.contextPath }/regist.jsp">注册</a><br/>--%>
<%--<a href="/login.jsp">登录</a>--%>
<%--<!--如果获取的session中的user不为空，进入跳转页面  -->--%>
<%--<!--<c:if test="${sessionScope.user!=null }">--%>
    	<%--欢迎回来，${sessionScope.user.username};--%>
    	 <%--<a href="/LogoutServlet">注销</a>--%>
    <%--</c:if>-->--%>
<%--<a href="${pageContext.request.contextPath }/regist1.jsp">用户注册</a><br/>--%>
<%--<a href="${pageContext.request.contextPath }/regist.jsp">我的用户注册</a><br/>--%>
<%--<a href="users">显示所有机票信息</a><br/>--%>
</body>
</html>