<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户注册</title>


<link rel="stylesheet" href="./resources/layui/layui-v2.5.6/layui/css/layui.css">
<script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.js"></script>
    <style>
        .back{
            width:100%;
            height:100%;
            background-image:url(./resources/image/success.jpg);
            background-repeat:no-repeat;
            position:absolute;
            z-index:100;
        }
        .div{
            border-radius: 30px;
            width: 400px;
            height:420px;
            background-color: #FFFFFF;
            position:center;
            margin:100px auto;
            /*z-index:100;*/
            -moz-box-shadow:2px 2px 10px #f8faeb;
            -webkit-box-shadow:2px 2px 10px #F0FFFF;
            box-shadow:2px 2px 10px #000000;
        }
    </style>
</head>

<body class="back">
<%
    String errorInfo = (String)session.getAttribute("registerMsg");         // 获取错误属性
    if(errorInfo != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=errorInfo%>");                                            // 弹出错误信息
</script>
<%
        session.setAttribute("registerMsg",null);
    }
%>

<br>
<br>
<br>



<div style="text-align: center;" class="div">
    <br>
    <br>
    <br>
    <div class="layui-inline">
        <h1> <p style="text-align: center">竞价升舱系统</p></h1><br><br>
    <form action="user/register" class="layui-form-pane">

        <div class="layui-form-item">
            <label class="layui-form-label">手机号:</label>
            <div class="layui-input-block" style="width: 200px">
                <input type="text" name="phone" required  lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">密码:</label>
            <div class="layui-input-block"style="width: 200px">
                <input type="password" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">确认密码:</label>
            <div class="layui-input-block"style="width: 200px">
                <input type="password" name="repassword" required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">邮箱:</label>
            <div class="layui-input-block" style="width: 200px">
                <input type="email" name="email" required  lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-inline" style="width: 100%">
                <button class="layui-btn" lay-submit lay-filter="formDemo">注册</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                <button type="reset" class="layui-btn layui-btn-primary"><a href="index.jsp" class="font-set">登录</a></button>
            </div>
        </div>
    </form>
</div>
</div>
</body>


</body>
</html>