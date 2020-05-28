
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑页面</title>
</head>
<body>
欢迎你：${currentUser}
<hr>
<form:form action="ticketSave" method="post" modelAttribute="returnTicket">
    <form:hidden path="id"/>
    tic_code:<form:input path="ticCode" /><br>
    identity:<form:input path="identity" /><br>
    用户名:<form:input path="userName" /><br>
    buy_way:<form:input path="buyWay" /><br>
    air_company_name:<form:input path="airCompanyName" /><br>
    flight_num:<form:input path="flightNum" /><br>
    start:<form:input path="start" /><br>
    destination:<form:input path="destination" /><br>
    flight_date:<form:input path="flightTime" /><br>
    flight_date:<form:input path="flightDate" /><br>
    berth_name:<form:input path="berthName" /><br>
    gate_num:<form:input path="gateNum" /><br>
    seat_mum:<form:input path="seatNum" /><br>
    remark:<form:input path="remark" /><br>
    <br>
    <input type="submit" value="提交"/>
</form:form>
</body>
</html>