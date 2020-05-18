<%--
  Created by IntelliJ IDEA.
  User: liber
  Date: 2020/5/18
  Time: 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加购票信息</title>
</head>
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

    //获取select选中的内容
    function test(){
        var selectedComs = document.getElementById("berthClass");
        for(var i=0;i<selectedComs.length;i++){
            if (selectedComs.options[i].selected)
                return true;
        }
        return false;
    }

</script>
<body>

<div>
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

<div style="text-align: center;">
    <div class="layui-inline">
    <h1> <p style="text-align: center">添加购票信息</p></h1><br><br>
    <form action="${pageContext.request.contextPath}/user/addTicket" class="layui-form-pane" method="get">
        <div class="layui-form-item">
            <label class="layui-form-label">航空公司:</label>
            <div class="layui-input-block">
                <input type="text" name="airCompanyName" required  lay-verify="required" placeholder="请输入航空公司" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">航班号:</label>
            <div class="layui-input-block">
                <input type="text" name="flightNum" required  lay-verify="required" placeholder="请输入航班号" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">起飞时间:</label>
            <div class="layui-input-block">
                <input type="datetime" name="flightTime" required  lay-verify="required" placeholder="请输入起飞时间" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">起飞地:</label>
            <div class="layui-input-block">
                <input type="text" name="start" required  lay-verify="required" placeholder="请输入起飞地" autocomplete="off" class="layui-input">
            </div>
        </div>



        <div class="layui-form-item">
            <label class="layui-form-label">目的地:</label>
            <div class="layui-input-block">
                <input type="text" name="destination" required  lay-verify="required" placeholder="请输入目的地" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">舱位:</label>
            <div class="layui-input-block">
                <%--<input type="text" name="berthClass" required  lay-verify="required" placeholder="请输入您的舱位" autocomplete="off" class="layui-input">--%>
                    <select name="berthClass" id="berthClass" lay-verify="required">
                        <option value="BusinessClass">商务舱</option>
                        <option value="FirstClass">头等舱</option>
                        <option value="EconomyClass">经济舱</option>
                    </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">登机口:</label>
            <div class="layui-input-block">
                <input type="text" name="gateNum" required  lay-verify="required" placeholder="请输入登机口" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">座位号:</label>
            <div class="layui-input-block">
                <input type="text" name="seatNum" required  lay-verify="required" placeholder="请输入座位号" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                <button type="reset" class="layui-btn layui-btn-primary"><a href="success.jsp" class="font-set">返回首页</a></button>
            </div>
        </div>

    </form>
</div>
</div>


</body>
</html>