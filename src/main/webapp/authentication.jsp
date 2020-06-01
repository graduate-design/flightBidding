<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>身份认证</title>
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


<%
    String errorInfo = (String)session.getAttribute("info");         // 获取错误属性
    if(errorInfo != null /*&& "您需要进行身份认证，才能进行下一步操作".equals(errorInfo)*/) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=errorInfo%>");                                            // 弹出错误信息
</script>
<%
        session.setAttribute("info",null);
    }
%>

<br>
<br>
<div style="text-align: center;">
    <div class="layui-inline">
        <h2>身份认证</h2>
        <br>
        <br>
    <form action="${pageContext.request.contextPath}/user/auth" method="post" class="layui-form-item">

                <div class="layui-form-item">
                    <label class="layui-form-label"style="width: auto">真实姓名:</label>
                    <div class="layui-input-block">
                        <input type="text" name="realName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"style="width: auto">证件类型:</label>
                    <div class="layui-input-block">
                        <%--<input type="text"  readonly  lay-verify="required" placeholder="中华人民共和国居民身份证" autocomplete="off" class="layui-input">--%>
                            <select name="identity" id="identity" lay-verify="text">
                                <option value="">中华人民共和国居民身份证</option>
                            </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"style="width: auto">证件号：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="identity"  lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-inline" style="width: 100%">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">身份认证</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>

    </form>

</div>
</div>
</body>

</html>
