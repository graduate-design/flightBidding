<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>注销确认</title>
    <!--CDN上引入bootstrap样式和插件，可以不使用，自己写一样有效果-->
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

<body >



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


<br>
<br>

<div style="text-align: center;">
    <div class="layui-inline">
        <table lay-filter="parse-table-demo" class="layui-table" style="width: 120%;">
            <thead>
            <tr>
                <th lay-data="{field:'text', width:1500}"></th>
                <th lay-data="{field:'data', width:2000}"></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>用户名： </td>
                <td>${userInfo.phone}</td>
            </tr>
            <tr>
            <tr>
                <td>姓名:  </td>
                <td>${userInfo.userName}</td>
            </tr>
            <tr>
                <td>性别：</td>
                <td>${userInfo.userSex}</td>
            </tr>
            <tr>
                <td>身份证号：</td>
                <td>${userInfo.identity}</td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td>${userInfo.email}</td>
            </tr>
            </tbody>
        </table>


        <form action="${pageContext.request.contextPath}/user/finish" class="layui-form-pane" method="get">

            <div class="layui-form-item">
                <div class="layui-input-inline"style="width: 125%;">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">确认注销</button>
                    </div>
            </div>
        </form>

    </div>
</div>


</body>
</html>