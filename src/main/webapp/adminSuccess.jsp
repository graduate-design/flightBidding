<%--
  Created by IntelliJ IDEA.
  User: liber
  Date: 2020/5/28
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员</title>

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
            <a href="javascript:;">用户管理</a>
            <dl class="layui-nav-child">
                <dd><a href="javascript:window.location = 'admin/userMain'">用户信息</a></dd>
                <%--<dd><a href="javascript:window.location = 'bid/flights'">所有航班</a></dd>--%>
            </dl>
        </li>
        <li class="layui-nav-item" >
            <a href="javascript:;">航班信息管理</a>
            <dl class="layui-nav-child">
                <%--<dd><a href="javascript:window.location = 'user/checkAdd'">添加机票信息</a></dd>--%>
                <%--<dd><a href="javascript:window.location = 'user/checkTicket'">机票信息</a></dd>--%>
                <%--<dd><a href="javascript:window.location = 'bid/showBid'">竞价信息</a></dd>--%>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">竞价信息查看</a>
            <dl class="layui-nav-child">
                <%--<dd><a href="javascript:window.location = 'user/checkAuth'">身份认证</a></dd>--%>
                <%--<dd><a href="changePsd.jsp">修改密码</a></dd>--%>
                <%--<dd><a href="javascript:window.location = 'user/finishCheck'">注销</a></dd>--%>
                <%--<dd><a href="index.jsp">退出</a></dd>--%>
            </dl>
        </li>
        <span class="layui-layout-right">
            <li class="layui-nav-item"><a href="adminSuccess.jsp">返回首页</a></li>
        </span>

    </ul>
</div>
</body>
</html>
