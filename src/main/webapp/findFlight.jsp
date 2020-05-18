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

<style>
    #subMenu {
        display: none;
        position: fixed;
        top: 55px;
        left: 10px;
    }
</style>
<script>
    function showSubMenu() {
        var m = document.getElementById("subMenu");
        m.style.display = "block";
    }

    function hiddenSubMenu() {
        var m = document.getElementById("subMenu");
        m.style.display = "none";
    }

    $(document).ready(function () {
        var element = layui.element;
        element.render();
    });
</script>

<script>
    $.get("/flight/getAirCompany",{},function (data) {
        var list = data;
        var select = document.getElementById('airCompanyName');
        if (list != null || list.size() > 0) {
            for (var c in list) {
                var option = document.createElement("option");
                option.setAttribute("value", list[c].id);
                option.innerText = list[c].name;
                select.appendChild(option)
            }
        };
        form.render('select');
    },"json");
</script>
<script>
    $(function(){
        $("#addpeop").click(function(){
            var peop=$("#addpeod");
            var t=$(['<label class="layui-form-label"></label>',
                '<div style="width: 150px;display: inline-block;">',
                ' <select name="airCompanyName" >',
                ' <option value="">请选择</option>',
                '</select>',
                '</div>'].join(''));
            t.find('#del').on('click', function(){
                t1.remove();
            });
            peop.append(t);

        })
    })

    //渲染select的下拉框
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //……
        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
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
                    <input type="text" name="airCompanyName"   lay-verify="text" placeholder="请输入航空公司" autocomplete="off" class="layui-input">
                    <%--<select name="airCompanyName" id="airCompanyName" lay-verify="text">--%>
                        <%--<option value="">请选择</option>--%>
                    <%--</select>--%>
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