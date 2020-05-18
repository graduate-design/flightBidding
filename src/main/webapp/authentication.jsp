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
    String errorInfo = (String)request.getAttribute("info");         // 获取错误属性
    if(errorInfo != null /*&& "您需要进行身份认证，才能进行下一步操作".equals(errorInfo)*/) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=errorInfo%>");                                            // 弹出错误信息

    // window.location='Authentication' ;                            // 跳转到登录界面
</script>
<%
    }
%>



<div style="text-align: center;">
    <div class="layui-inline">

    <form action="${pageContext.request.contextPath}/user/auth" method="post" class="layui-form-pane">

                <div class="layui-form-item">
                    <label class="layui-form-label">真实姓名:</label>
                    <div class="layui-input-block">
                        <input type="text" name="realName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">证件类型:</label>
                    <div class="layui-input-block">
                        <input type="text"  readonly  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <input type="text"  name="identity"  lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input">
                    </div>
                </div>v
            <%--<tr>--%>

                <%--<td>证件类型:</td>--%>

                <%--<td>--%>

                    <%--<select name="type">--%>

                        <%--<option value="中国民居身份证">中国民居身份证</option>--%>

                    <%--</select>--%>

                <%--</td>--%>
            <%--<tr/>--%>

            <%--<tr>--%>
                <%--<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>--%>
                <%--<td>--%>
                    <%--<input name="identity" required>--%>
                <%--</td>--%>
            <%--</tr>--%>

            <%--<tr>--%>

                <%--<td>邮箱:</td>--%>

                <%--<td><input type="text" placeholder="请输入邮箱" name="email" value="${param.email}" /></td>--%>

                <%--<td id="email_msg"></td>--%>

            <%--</tr>--%>

            <%--<tr align="center">--%>

                <%--<td><input type="submit" value="身份验证" /></td>--%>

            <%--</tr>--%>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">身份认证</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>

        <%--</table>--%>

    </form>

</div>
</div>
</body>

</html>
