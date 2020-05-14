<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">

    <c:forEach items="${flights}" var="flight">
        <li>
            航空公司：${flight.airCompanyName}&nbsp; 航班号：${flight.flightNum} &nbsp; 起飞日期：${flight.flightDate}&nbsp;
        </li>
    </c:forEach>
</div>

</body>
</html>
