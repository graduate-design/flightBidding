<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
    <link rel="stylesheet" href="./resources/layui/layui-v2.5.6/layui/css/layui.css">
    <script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.js"></script>
</head>
<body>

<%
    String errorInfo = (String)session.getAttribute("loginMsg");         // 获取错误属性
    if(errorInfo != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=errorInfo%>");                                            // 弹出错误信息
</script>
<%
        session.setAttribute("loginMsg",null);
    }
%>
<div style="text-align: center;">
    <div class="layui-inline">
    <h2> 登录</h2><br><br>
    <form action="user/login" class="layui-form-item">
        <div class="layui-form-item">
            <label class="layui-form-label">手机号:</label>
            <div class="layui-input-block" style="width: 50%;">
                <input type="text" name="phone" required  lay-verify="required" placeholder="请输入用户" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">密码:</label>
            <div class="layui-input-block" style="width: 50%;">
                <input type="password" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                <button type="reset" class="layui-btn layui-btn-primary"><a href="register.jsp" class="font-set">注册</a></button>
            </div>
        </div>
    </form>
    </div>
</div>
</body>
</html>