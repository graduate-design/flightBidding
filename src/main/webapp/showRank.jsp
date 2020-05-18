<%--
  Created by IntelliJ IDEA.
  User: liber
  Date: 2020/5/16
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>竞价排名</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./resources/layui/layui-v2.5.6/layui/css/layui.css">
    <script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.js"></script>
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

<%
    String errorInfo = (String)session.getAttribute("bidInfo");         // 获取错误属性
    if(errorInfo != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=errorInfo%>");                                            // 弹出错误信息

    // window.location='findFlight' ;                            // 跳转到登录界面
</script>
<%
        session.setAttribute("bidInfo",null);
    }
%>

<%--您所竞价的航班是：${accurateFlight.flightNum}<br>--%>
<%--您竞价的舱位是：--%>
<%--<%--%>
    <%--String bidClass = (String) session.getAttribute("bidClass");--%>
    <%--if ("BusinessClass".equals(bidClass)){--%>
        <%--out.print("商务舱");--%>
    <%--}else if ("FirstClass".equals(bidClass)){--%>
        <%--out.print("头等舱");--%>
    <%--}--%>
<%--%>--%>
<%--您的上次出价：${submittedPrice}<br>--%>
<%--目前排名：${presentRank}<br>--%>



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
                    <td>航空公司： </td>
                    <td>${accurateFlight.airCompanyName}</td>
                </tr>
            <tr>
                <tr>
                    <td>竞价航班: </td>
                    <td>${accurateFlight.flightNum}</td>
                    </tr>
                <tr>
                    <td>竞价舱位</td>
                    <td><%
                        String bidClass = (String) session.getAttribute("bidClass");
                        if ("BusinessClass".equals(bidClass)){
                            out.print("商务舱");
                        }else if ("FirstClass".equals(bidClass)){
                            out.print("头等舱");
                        }
                    %></td>
                   </tr>
                <tr>
                    <td>上次出价</td>
                    <td>${submittedPrice}</td>
                    </tr>
                <tr>
                    <td>目前排名</td>
                    <td>${presentRank}</td>
                   </tr>
            </tbody>
        </table>


        <form action="${pageContext.request.contextPath}/bid/addPrice" class="layui-form-pane" method="get">
            <div class="layui-form-item" style="width: 133%;">
                <label class="layui-form-label">本次竞价:</label>
                <div class="layui-input-block" style="width: 62%;">
                    <input type="number" name="price" placeholder="本次竞价不可比上次低" step="1" min="${submittedPrice}" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"  required  lay-verify="required" placeholder="本次竞价不能比上次低" autocomplete="off" class="layui-input">
                </div>
            </div>



            <div class="layui-form-item">
                <div class="layui-input-inline"style="width: 125%;">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                    <button type="reset" class="layui-btn layui-btn-primary"><a href="success.jsp" class="font-set">返回首页</a></button>
                    <button type="reset" class="layui-btn layui-btn-primary"><a href="javascript:window.location = 'bid/exit'" class="font-set">退出竞价</a></button>
                </div>
            </div>
        </form>

        <%--<form action="${pageContext.request.contextPath}/bid/exit" class="layui-form-pane" method="get">--%>
            <%--<div class="layui-form-item">--%>
                <%--<div class="layui-input-block">--%>
                    <%--<button class="layui-btn" lay-submit lay-filter="formDemo">退出竞价</button>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</form>--%>
    </div>
</div>

</body>
</html>
