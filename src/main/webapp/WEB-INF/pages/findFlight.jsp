<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <%
        String errorInfo = (String)request.getAttribute("msg");         // 获取错误属性
        if(errorInfo != null) {
    %>
    <script type="text/javascript" language="javascript">
        alert("<%=errorInfo%>");                                            // 弹出错误信息

        // window.location='findFlight' ;                            // 跳转到登录界面
    </script>
    <%
        }
    %>
    <form action="bidding/findFlight" method="post">
        航空公司：<input type="text" name="airCompanyName"><br>
        航&nbsp;班&nbsp;号：<input type="text" name="flightNum"><br>
        起飞日期：<input type="date" name="startDate"><br>
        <%--截止日期：<input type="date" name="endDate"><br>--%>
        <input type="submit" value="查询">
    </form>
</div>
</body>
</html>