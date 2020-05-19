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



    $(document).ready(function () {
        $.ajax({
            timeout: 3000,
            async: false,
            type: "GET",
            url: "flight/getCity",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#destination").empty();//清空下拉框
                $("#start").empty();//清空下拉框
                for (var i = 0; i < data.length; i++) {
                    console.log(data[i]);

                    $("#destination").append("<option value="+data[i]+">" + data[i]+ "</option>");
                    $("#start").append("<option value="+data[i]+">" + data[i]+ "</option>");
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
<body>

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

<%
    String addTicketInfo = (String) session.getAttribute("addTicketInfo");

    if(addTicketInfo != null /*&& "您需要进行身份认证，才能进行下一步操作".equals(errorInfo)*/) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=addTicketInfo%>");                                            // 弹出错误信息

    // window.location='Authentication' ;                            // 跳转到登录界面
</script>
<%
        session.setAttribute("addTicketInfo",null);
    }
%>

<div style="text-align: center;">
    <div class="layui-inline">
    <h2> <p >添加购票信息</p></h2><br><br>
    <form action="${pageContext.request.contextPath}/user/addTicket" class="layui-form-pane" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">航空公司:</label>
            <div class="layui-input-block" style="width: 80%;">
                    <select name="airCompanyName" id="airCompanyName" lay-verify="text">
                        <option value="">请选择</option>
                    </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">航班号:</label>
            <div class="layui-input-block"  style="width: 80%;">
                <input type="text" name="flightNum" required  lay-verify="required" placeholder="请输入航班号" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">起飞时间:</label>
            <div class="layui-input-inline" style="width: 150px;">
                <input type="date"  name="flightDate" required  lay-verify="required" placeholder="请输入起飞日期" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid"></div>
            <div class="layui-input-inline"style="width: 100px;">
                <input type="number" name="flightHour" step="1" min="0" max="23" required lay-verify="required" placeholder="请输入起飞时间" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline"style="width: 100px;">
                <input type="number" name="flightMin" step="1" min="0" max="59" required lay-verify="required" placeholder="请输入起飞时间" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">起飞地:</label>
            <div class="layui-input-block" style="width: 80%;">
                <%--<input type="text" name="start" required  lay-verify="required" placeholder="请输入起飞地" autocomplete="off" class="layui-input">--%>
                    <select name="start" id="start" lay-verify="text">
                    </select>
            </div>
        </div>



        <div class="layui-form-item">
            <label class="layui-form-label">目的地:</label>
            <div class="layui-input-block" style="width: 80%;">
                <%--<input type="text" name="destination" required  lay-verify="required" placeholder="请输入目的地" autocomplete="off" class="layui-input">--%>
                    <select name="destination" id="destination" lay-verify="text">
                    </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">舱位:</label>
            <div class="layui-input-block" style="width: 80%;">
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
            <div class="layui-input-block" style="width: 80%;">
                <input type="text" name="gateNum" required  lay-verify="required" placeholder="请输入登机口" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">座位号:</label>
            <div class="layui-input-block" style="width: 80%;">
                <input type="text" name="seatNum" required  lay-verify="required" placeholder="请输入座位号" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block" style="width: 60%;">
                <button class="layui-btn" lay-submit lay-filter="formDemo" onchange="changeDate(this)">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                <%--<button type="reset" class="layui-btn layui-btn-primary"><a href="success.jsp" class="font-set">返回首页</a></button>--%>
            </div>
        </div>

    </form>
</div>
</div>


</body>
</html>