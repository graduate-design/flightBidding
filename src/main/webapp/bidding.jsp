<%@ page import="njtech.design.flightBerth.entity.Flight" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %><%--
  Created by IntelliJ IDEA.
  User: liber
  Date: 2020/5/15
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>竞价</title>

<link href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/layui/layui-v2.5.6/layui/css/layui.css">
<script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.js"></script>
<script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.all.js"></script>

    <script type="text/javascript" language="javascript">
    //获取select选中的内容
    function test(){
        var selectedComs = document.getElementById("berthClass");
        for(var i=0;i<selectedComs.length;i++){
            if (selectedComs.options[i].selected)
             return true;
        }
        return false;
    }

    //得到导航下拉框
        $(document).ready(function () {
            var element = layui.element;
            element.render();
        });



    $(document).ready(function () {
        $.ajax({
            timeout: 3000,
            async: false,
            type: "GET",
            url: "flight/getBerth",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#berthClass").empty();//清空下拉框
                for (var i = 0; i < data.length; i++) {

                    var berth = data[i];
                    console.log(berth);
                    if (berth == "头等舱"){
                        $("#berthClass").append("<option value=FirstClass>" + data[i]+ "</option>");
                    }
                    if (berth == "商务舱"){
                        $("#berthClass").append("<option value=BusinessClass>" + data[i]+ "</option>");
                    }
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

<%
    String bidInfo = (String)session.getAttribute("bidInfo");         // 获取错误属性
    if(bidInfo != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=bidInfo%>");                                            // 弹出错误信息
</script>
<%
        session.setAttribute("bidInfo",null);
    }
    String ticketInfo = (String) session.getAttribute("ticketInfo");
    if (ticketInfo!=null){
%>
<script type="text/javascript" language="javascript">
    alert("<%=ticketInfo%>");                                            // 弹出错误信息
</script>
<%      session.setAttribute("ticketInfo",null);
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
                <dd><a href="javascript:window.location = 'user/exit'">退出</a></dd>
            </dl>
        </li>
        <span class="layui-layout-right">
            <li class="layui-nav-item"><a href="success.jsp">返回首页</a></li>
        </span>
    </ul>
</div>


<%
    String user = (String) session.getAttribute("phone");
    if(StringUtils.isEmpty(user)){
%>
<jsp:forward page="index.jsp" />;
<%
    }
%>

<table lay-filter="parse-table-demo" class="layui-table">
    <thead>
    <tr>
        <th lay-data="{field:'airCompanyName', minWidth:2000}">航空公司</th>
        <th lay-data="{field:'flightNum', minWidth:2000}">航班号</th>
        <th lay-data="{field:'flightDate', minWidth: 2000}">起飞时间</th>
        <th lay-data="{field:'startPlace', minWidth: 2000}">起飞地点</th>
        <th lay-data="{field:'targetPlace', minWidth: 2000}">目的地点</th>
        <th lay-date="{fieId:'redundantBusinessClass',minWidth: 2000}">可竞价商务舱数</th>
        <th lay-date="{fieId:'redundantFirstClass',minWidth: 2000}">可竞价头等舱数</th>
    </tr>
    </thead>
    <tbody>
            <tr>
                    <%--显示点击的具体航班信息--%>
                   <td> ${accurateFlight.airCompanyName}</td>
                        <td>${accurateFlight.flightNum}</td>
                    <%--${accurateFlight.flightDate}<br>--%>
                        <td><%
                    Flight flight = (Flight) session.getAttribute("accurateFlight");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    if (flight!=null){
                        String date = sdf.format(flight.getFlightDate());
                        out.print(date);
                    }

                %></td>
                        <td>${accurateFlight.startPlace}</td>
                        <td>${accurateFlight.targetPlace}</td>
                        <td>${accurateFlight.redundantBusinessClass}</td>
                        <td>${accurateFlight.redundantFirstClass}</td>
            </tr>
    </tbody>
</table>

<br>
<br>

<div style="text-align: center;">
    <div class="layui-inline">
    <form action="${pageContext.request.contextPath}/bid/subPrice" method="get" onsubmit="return test()" class="layui-form">

        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 150px">升舱舱位：</label>
            <div class="layui-input-inline">
                <select name="berthClass" id="berthClass" lay-verify="required">
                    <%--<option value="BusinessClass">商务舱</option>--%>
                    <%--<option value="FirstClass">头等舱</option>--%>
                </select>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 150px">竞价：</label>
            <div class="layui-input-inline">
                <input type="number" name="price" required  step ="1" min="0" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''" lay-verify="required" placeholder="请输入您的竞价金额" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                <%--<button type="reset" class="layui-btn layui-btn-primary"><a href="success.jsp" class="font-set">返回首页</a></button>--%>
            </div>
        </div>

    </form>
        <%--<%--%>
            <%--//取得提交的数字，并显示  --%>
            <%--String n = (String) request.getParameter("berthClass");--%>
            <%--out.print("选的值是：" + n);--%>
        <%--%>--%>
</div>
</div>
</body>
</html>
