<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
    <!--CDN上引入bootstrap样式和插件，可以不使用，自己写一样有效果-->
    <link href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./resources/layui/layui-v2.5.6/layui/css/layui.css">
    <script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.js"></script>
    <script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.all.js"></script>

    <style>
        .back{
            width:100%;
            height:100%;
            background-image:url(./resources/image/index.jpg);
            background-repeat:no-repeat;
            position:absolute;
            z-index:100;
        }
    </style>

    <script>
        $(document).ready(function () {
            var element = layui.element;
            element.render();
        });
    </script>
</head>

<body class="back">

<%
    String errorInfo = (String)session.getAttribute("ticketInfo");         // 获取错误属性
    String loginInfo = (String)session.getAttribute("loginMsg");
    String userAuth = (String)session.getAttribute("authInfo");
    if(errorInfo != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=errorInfo%>");                                            // 弹出错误信息

    // window.location='findFlight' ;                            // 跳转到登录界面
</script>
<%
        session.setAttribute("ticketInfo",null);
    }
    if (loginInfo!=null ){
        %>
<script type="text/javascript" language="javascript">
    alert("<%=loginInfo%>");                                            // 弹出错误信息

</script>
<%
        session.setAttribute("loginMsg",null);
    }
    if (userAuth!=null){
 %>
<script type="text/javascript" language="javascript">
    alert("<%=userAuth%>");                                            // 弹出错误信息

</script>
<%
        session.setAttribute("authInfo",null);
    }
%>

<%
    String addTicketInfo = (String) session.getAttribute("addTicketInfo");

    if(addTicketInfo != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=addTicketInfo%>");                                            // 弹出错误信息
</script>
<%
        session.setAttribute("addTicketInfo",null);
    }
%>

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
                <%--<dd><a href="javascript:window.location = 'user/finishCheck'">注销</a></dd>--%>
                <dd><a href="index.jsp">退出</a></dd>
            </dl>
        </li>
        <span class="layui-layout-right">
            <li class="layui-nav-item"><a href="success.jsp">返回首页</a></li>
        </span>

    </ul>
</div>


</body>
</html>