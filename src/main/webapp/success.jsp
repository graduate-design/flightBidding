<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
    <!--CDN上引入bootstrap样式和插件，可以不使用，自己写一样有效果-->
    <link href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./resources/layui/layui-v2.5.6/layui/css/layui.css">
    <script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.js"></script>
    <script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.all.js"></script>

    <style>
        .back{
            width:100%;
            height:100%;
            background-image:url(./resources/image/success.jpg);
            background-repeat:no-repeat;
            position:absolute;
            z-index:100;
        }


        .title{
            /*文字居中*/
            text-align:center;
            margin-top: 30px;
            position: relative;

            color: white;

        }

        .content{
            /*文字居中*/
            text-align:left;
            /*margin-top: 30px;*/
            position: relative;
            margin-left: 5px;
            color: white;
            font-size: 20px;
            /*文字间距*/
            letter-spacing:1px;
            /*行间距*/
            line-height:28px;

        }

        .middlecycle{
            /*矩形框背景*/
            background-image:url(./resources/image/success.jpg);
            /*设置图片透明度*/
            /*opacity: 0.9;*/
            background:rgba(255,255,255,0.2);
            /*矩形框样式*/
            border-radius: 30px;
            position:absolute;
            margin:70px 350px;
            width: 1200px;
            height: 100px;
            -moz-box-shadow:2px 2px 10px #f8faeb;
            -webkit-box-shadow:2px 2px 10px #F0FFFF;
            box-shadow:5px 5px 10px #392f41;
        }


        .cycle_left{
            /*矩形框背景*/
            background-image:url(./resources/image/success.jpg);
            /*设置图片透明度*/
            /*opacity: 0.9;*/
            background:rgba(255,255,255,0.3);
            position: absolute;
            border-radius: 30px;
            margin:300px 450px;
            width: 250px;
            height: 400px;
            /*-moz-border-radius: 30%;*/
            /*-webkit-border-radius: 30%;*/
            -moz-box-shadow:2px 2px 10px #f8faeb;
            -webkit-box-shadow:2px 2px 10px #F0FFFF;
            box-shadow:5px 5px 10px #3d3b4f;
        }

        .cycle_center{
            /*矩形框背景*/
            background-image:url(./resources/image/success.jpg);
            /*设置图片透明度*/
            /*opacity: 0.9;*/
            background:rgba(255,255,255,0.3);
            position: absolute;
            border-radius: 30px;
            margin:300px 825px;
            width: 250px;
            height: 400px;
            /*-moz-border-radius: 30%;*/
            /*-webkit-border-radius: 30%;*/
            /*-moz-box-shadow:20px 20px 10px #f8faeb;*/
            /*-webkit-box-shadow:20px 20px 10px #F0FFFF;*/
            /*box-shadow:20px 20px 10px #000000;*/
        }

        .cycle_right{
            /*矩形框背景*/
            background-image:url(./resources/image/success.jpg);
            /*设置图片透明度*/
            /*opacity: 0.9;*/
            background:rgba(255,255,255,0.3);
            position: absolute;
            border-radius: 30px;
            margin:300px 1200px;
            width: 250px;
            height: 400px;
            /*-moz-border-radius: 30%;*/
            /*-webkit-border-radius: 30%;*/
            -moz-box-shadow:2px 2px 10px #f8faeb;
            -webkit-box-shadow:2px 2px 10px #F0FFFF;
            box-shadow:5px 5px 10px #3d3b4f;
        }

        .rhombus{

            /*矩形框背景*/
            background-image:url(./resources/image/success.jpg);
            /*设置图片透明度*/
            /*opacity: 0.9;*/
            background:rgba(255,255,255,0.3);
            position: absolute;
            margin:375px 825px;
            width: 250px;
            height: 250px;
            transform: rotateZ(45deg)skew(5deg,5deg);

        }


    </style>

    <script>
        $(document).ready(function () {
            var element = layui.element;
            element.render();
        });
    </script>

    <style>
        <%--第二个页面 todo--%>
        .content_title{
            text-align:center;
            margin: 100px 300px;
            position: absolute;

            color: white;
        }

        .container1 {
            position: absolute;
            margin: 200px 450px;
            /*background-color: white;*/
            background:rgba(255,255,255,0.3);
            width: 1000px ;
            height: 174px
        }
        #photo {float: left; width: 30%;}
        #content {float: right; width: 70%;}

        .container2 {
            position: absolute;
            margin: 450px 450px;
            /*background-color: white;*/
            background:rgba(255,255,255,0.3);
            width: 1000px ;
            height: 174px
        }
        #photo2 {float: left; width: 30%;}
        #content2 {float: right; width: 70%;}

    </style>


</head>

<body class="back">

<%
    String errorInfo = (String)session.getAttribute("ticketInfo");         // 获取错误属性
    String loginInfo = (String)session.getAttribute("loginMsg");
    String userAuth = (String)session.getAttribute("authInfo");
    if(errorInfo != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=errorInfo%>");                                            // 弹出错误信息

    // window.location='findFlight' ;                            // 跳转到登录界面
</script>
<%
        session.setAttribute("ticketInfo",null);
    }
    if (loginInfo!=null ){
        %>
<script type="text/javascript" language="javascript">
    alert("<%=loginInfo%>");                                            // 弹出错误信息

</script>
<%
        session.setAttribute("loginMsg",null);
    }
    if (userAuth!=null){
 %>
<script type="text/javascript" language="javascript">
    alert("<%=userAuth%>");                                            // 弹出错误信息

</script>
<%
        session.setAttribute("authInfo",null);
    }
%>

<%
    String addTicketInfo = (String) session.getAttribute("addTicketInfo");

    if(addTicketInfo != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=addTicketInfo%>");                                            // 弹出错误信息
</script>
<%
        session.setAttribute("addTicketInfo",null);
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
                <%--<dd><a href="javascript:window.location = 'user/finishCheck'">注销</a></dd>--%>
                <dd><a href="javascript:window.location = 'user/exit'">退出</a></dd>
            </dl>
        </li>
        <%--<span class="layui-layout-right">--%>
            <%--<li class="layui-nav-item"><a href="success.jsp">返回首页</a></li>--%>
        <%--</span>--%>

    </ul>
</div>



<%--&lt;%&ndash;介绍&ndash;%&gt;--%>
<%--<div class="middlecycle">--%>
    <%--<div class="title">--%>
        <%--<h1>--%>
            <%--美好旅程 &nbsp;&nbsp; 舒适飞行&nbsp;&nbsp; 更多选择--%>
        <%--</h1>--%>
    <%--</div>--%>
<%--</div>--%>

<%--<div>--%>

    <%--<div class="cycle_left">--%>
        <%--<br>--%>
        <%--<br>--%>
        <%--<h2 style="text-align: center;color: white">--%>
            <%--升舱至商务舱--%>
        <%--</h2>--%>
        <%--<br>--%>
        <%--<br>--%>
        <%--<div class="content">--%>
            <%--<p>--%>
                <%--&nbsp;&nbsp; &nbsp;&nbsp; 在航班起飞前，可以在贵宾休息室放松休憩；--%>
                <%--可以享有优先值机及优先登机的礼遇，节省宝贵时间。--%>
                <%--在飞机上，您还可享受更多的个人空间及美味的营养餐。--%>
            <%--</p>--%>

        <%--</div>--%>
    <%--</div>--%>

    <%--<div class="rhombus">--%>

    <%--</div>--%>
    <%--<div style="margin: 300px 850px;position: absolute">--%>

        <%--<div style="text-align:center;color: white;font-size: 30px;">--%>
            <%--<br>--%>
            <%--<br>--%>
            <%--<br>--%>
            <%--<br>--%>
            <%--自由定价<br>--%>
            <%--按您的意愿报价<br>--%>
            <%--&lt;%&ndash;多加一点好运气<br>&ndash;%&gt;--%>
            <%--&lt;%&ndash;即有机会获得升舱&ndash;%&gt;--%>

        <%--</div>--%>
    <%--</div>--%>

    <%--<div class="cycle_right">--%>
        <%--<br>--%>
        <%--<br>--%>
        <%--<h2 style="text-align: center;color: white">--%>
            <%--升舱至头等舱--%>
        <%--</h2>--%>
        <%--<br>--%>
        <%--<br>--%>
        <%--<div class="content">--%>
            <%--<p>--%>
                <%--&nbsp;&nbsp; &nbsp;&nbsp; 在我们的头等舱航站楼，开启您的专享旅程，享受隐私空间和机上美食。--%>
                <%--您的个人助理将在出发及到达机场始终伴您左右，并适时妥善地为您办理所有必要的旅行手续。--%>
            <%--</p>--%>

        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<div class="content_title">
    <h1>
        美好旅程 &nbsp;&nbsp; 舒适飞行&nbsp;&nbsp; 更多选择
    </h1>
</div>

<br>
<br>
<br>

<%--<div class="container1">--%>
    <%--<div id="photo"><img src="./resources/image/first.jpg" width="290px" height="174"/></div>--%>
    <%--<div id="content">--%>
        <%--<div id="text" style="color: white;font-size: 30px" >升级至头等舱</div><br>--%>
        <%--<div id="news" style="color: white;font-size: 20px">在我们的头等舱航站楼，开启您的专享旅程，享受隐私空间和机上美食。<br>--%>
<%--您的个人助理将在出发及到达机场始终伴您左右，并适时妥善地为您办理所有必要的旅行手续。</div>--%>
<%--</div>--%>
<%--</div>--%>

<%--<div class="container2">--%>
    <%--<div id="photo2"><img src="./resources/image/business.jpg" width="290" height="174"/></div>--%>
    <%--<div id="content2">--%>
        <%--<div id="text2" style="color: white;font-size: 30px" >升级至商务舱</div><br>--%>
        <%--<div id="news2" style="color: white;font-size: 20px">在航班起飞前，可以在贵宾休息室放松休憩；--%>
            <%--可以享有优先值机及优先登机的礼遇，节省宝贵时间。 在飞机上，您还可享受更多的个人空间及美味的营养餐。</div>--%>
<%--</div>--%>
<%--</div>--%>

</body>
</html>