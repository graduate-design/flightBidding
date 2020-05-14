<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: liber
  Date: 2020/5/12
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--目录--%>
<script>
    function search(){
        window.location.href = "findFlight.jsp";
    }
</script>
<ul>
    <%--<jsp:forward page="/bidding/findFlight">查询航班</jsp:forward>--%>

    <li><button type="submit" onclick="search()">查询航班</button></li>
    <li><a href="javascript:window.location.href='bidding/toFind'">查询航班</a></li>
    <li><a href="javascript:window.location.href='user.jsp'">个人资料</a></li>
</ul>
</body>
</html>
