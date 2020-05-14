<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>
<c:forEach items="${allFlights}" var="f">
   ${f.airCompanyName} ${f.flightNum} ${f.flightDate}
</c:forEach>
</body>
</html>
