<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>精确查询</title>

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


    $(document).ready(function () {
        $.ajax({
            timeout: 3000,
            async: false,
            type: "GET",
            url: "flight/getAirCompany",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#airCompanyName").empty();//清空下拉框
                for (var i = 0; i < data.length; i++) {
                    console.log(data[i]);
                    $("#airCompanyName").append("<option value="+data[i]+">" + data[i]+ "</option>");
                }

            },
            error: function() {
                layer.msg('获取规则失败');

            }
        });
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render('select');
    });

</script>

</head>

<body>
<div class="box">
    <ul class="layui-nav" lay-filter = "">
        <li class="layui-nav-item">
            <a href="javascript:;">查询航班</a>
            <dl class="layui-nav-child">
                <dd><a href="findFlight.jsp">精确查找</a></dd>
                <dd><a href="javascript:window.location = 'bid/flights'">所有航班</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">个人管理</a>
            <dl class="layui-nav-child">
                <dd><a href="addTicket.jsp">添加机票信息</a></dd>
                <dd><a href="javascript:;">退出</a></dd>
            </dl>
        </li>
    </ul>
</div>

<div align="center">
    <%
        String errorInfo = (String)session.getAttribute("msg");         // 获取错误属性
        if(errorInfo != null) {
    %>
    <script type="text/javascript" language="javascript">
        alert("<%=errorInfo%>");                                            // 弹出错误信息

        // window.location='findFlight' ;                            // 跳转到登录界面
    </script>
    <%
        }
    %>

</div>


<div style="text-align: center;">
    <div class="layui-inline">
    <h2> <p style="text-align: center">精确查找</p></h2><br><br>
    <form action="${pageContext.request.contextPath}/bid/findFlight" class="layui-form-pane" method="post">


            <div class="layui-form-item">
                <label class="layui-form-label">航空公司：</label>
                <div class="layui-input-inline" style="width: 50%;">
                    <%--<input type="text" name="airCompanyName"   lay-verify="text" placeholder="请输入航空公司" autocomplete="off" class="layui-input">--%>
                    <select name="airCompanyName" id="airCompanyName" lay-verify="text">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>

        <div class="layui-form-item">
            <label class="layui-form-label">航&nbsp;班&nbsp;号：</label>
            <div class="layui-input-block" style="width: 50%;">
                <input type="text" name="flightNum"   lay-verify="text" placeholder="请输入航班号" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">起飞日期：</label>
            <div class="layui-input-block" style="width: 50%;">
                <input type="date" name="startDate"    placeholder="请输入起飞日期" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="addpeop" lay-submit lay-filter="formDemo">查找</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                <button type="reset" class="layui-btn layui-btn-primary"><a href="success.jsp" class="font-set">返回首页</a></button>
            </div>
        </div>
    </form>
</div>
</div>
</body>
</html>