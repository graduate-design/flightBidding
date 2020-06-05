<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: liber--%>
  <%--Date: 2020/5/28--%>
  <%--Time: 10:44--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<title>管理员</title>--%>

    <%--<link href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet">--%>
    <%--<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>--%>
    <%--<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>--%>
    <%--<link rel="stylesheet" href="./resources/layui/layui-v2.5.6/layui/css/layui.css">--%>
    <%--<script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.js"></script>--%>
    <%--<script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.all.js"></script>--%>
    <%--<script>--%>
        <%--$(document).ready(function () {--%>
            <%--var element = layui.element;--%>
            <%--element.render();--%>
        <%--});--%>
    <%--</script>--%>
<%--</head>--%>
<%--<body>--%>

<%--<div>--%>
    <%--<ul class="layui-nav" lay-filter = "">--%>
        <%--<li class="layui-nav-item" >--%>
            <%--<a href="javascript:;">用户管理</a>--%>
            <%--<dl class="layui-nav-child">--%>
                <%--<dd><a href="javascript:window.location = 'admin/userMain'">用户信息</a></dd>--%>
                <%--&lt;%&ndash;<dd><a href="javascript:window.location = 'bid/flights'">所有航班</a></dd>&ndash;%&gt;--%>
            <%--</dl>--%>
        <%--</li>--%>
        <%--<li class="layui-nav-item" >--%>
            <%--<a href="javascript:;">航班信息管理</a>--%>
            <%--<dl class="layui-nav-child">--%>
                <%--&lt;%&ndash;<dd><a href="javascript:window.location = 'user/checkAdd'">添加机票信息</a></dd>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<dd><a href="javascript:window.location = 'user/checkTicket'">机票信息</a></dd>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<dd><a href="javascript:window.location = 'bid/showBid'">竞价信息</a></dd>&ndash;%&gt;--%>
            <%--</dl>--%>
        <%--</li>--%>
        <%--<li class="layui-nav-item">--%>
            <%--<a href="javascript:;">竞价信息查看</a>--%>
            <%--<dl class="layui-nav-child">--%>
                <%--&lt;%&ndash;<dd><a href="javascript:window.location = 'user/checkAuth'">身份认证</a></dd>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<dd><a href="changePsd.jsp">修改密码</a></dd>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<dd><a href="javascript:window.location = 'user/finishCheck'">注销</a></dd>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<dd><a href="index.jsp">退出</a></dd>&ndash;%&gt;--%>
            <%--</dl>--%>
        <%--</li>--%>
        <%--<span class="layui-layout-right">--%>
            <%--<li class="layui-nav-item"><a href="adminSuccess.jsp">返回首页</a></li>--%>
        <%--</span>--%>

    <%--</ul>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>航空竞价升舱后台管理系统</title>
    <script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="./resources/layui/layui-v2.5.6/layui/css/layui.css" media="all">

    <script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.all.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-3.3.7/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/premium.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/theme.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">

    <!--必须先引用jQuery再引用bootstrap-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

    <style type="text/css">
        .rightmenu{font-size:12px; padding:5px 10px; border-radius: 2px;}
        .rightmenu li{line-height:20px; cursor: pointer;}
        ul.layui-tab-title li:first-child i{display:none;}
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="">航班竞价升舱后台管理系统</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">返回首页</a></li>

        </ul>
        <ul class="layui-nav layui-layout-right">

            <li class="layui-nav-item"><a href="http://localhost:8080/flightBidding_war/">退出登录</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black ">
        <div class="layui-side-scroll">
            <%--            <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="treenav">--%>
            <%--                <li class="layui-nav-item">--%>
            <%--                    <a class="" href="javascript:;">后台数据管理</a>--%>
            <%--                    <dl class="layui-nav-child">--%>
            <%--                        <dd><a href="admin/userMain">用户信息管理</a></dd>--%>
            <%--                        <dd><a href="">航班信息管理</a></dd>--%>
            <%--                    </dl>--%>
            <%--                </li>--%>
            <%--                <li class="layui-nav-item">--%>
            <%--                    <a class="" href="javascript:;" >后台数据查询</a>--%>
            <%--                    <dl class="layui-nav-child">--%>
            <%--                        <dd><a href="/admin/priceMain">竞价信息查询</a></dd>--%>
            <%--                        <dd><a href="/admin/priceMain">机票信息查询</a></dd>--%>
            <%--                    </dl>--%>
            <%--                </li>--%>
            <%--            </ul>--%>
            <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="treenav">
                <li class="layui-nav-item">
                    <a href="javascript:;">后台数据管理</a>
                    <dl class="layui-nav-child">
                        <dd><a  href="javascript:;" class="site-url" data-title="用户管理" data-id="1" data-url="admin/userMain">用户信息管理</a></dd>
                        <dd><a  href="javascript:;" class="site-url" data-title="航班管理" data-id="2" data-url="admin/flightMain">航班信息管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">后台数据查询</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="site-url" data-title="竞价查询" data-id="3" data-url="admin/priceMain">竞价信息查询</a></dd>
                        <dd><a href="javascript:;" class="site-url" data-title="机票查询" data-id="4" data-url="admin/ticketMain">机票信息查询</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <div class="layui-tab layui-tab-brief" lay-filter="contentnav" lay-allowClose="true" style="margin-left:10px;margin-top:10px;">
            <ul class="layui-tab-title">
                <li class="layui-this">首页</li>
            </ul>
            <ul class="layui-bg-green rightmenu" style="display: none;position: ">
                <li data-type="closethis">关闭当前</li>
                <li data-type="closeall">关闭所有</li>
            </ul>
            <div class="layui-tab-content" style="padding:0;">
                <div class="layui-tab-item layui-show">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading no-collapse text-center" style="font-size: 20px">航空竞价升舱系统</div>
                                <div class="panel-body collapse in">
                                    <textarea rows="10" id="companyIntroduceText" style="border-radius: 15px" class="form-control" placeholder="公司简介" readonly="readonly">航班竞价升舱系统是宇宙无敌舰队历经半年多人运动打造出的精品web项目。</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <div class="panel panel-default">
                                    <a href="#CompanyEmployeesInformation" class="panel-heading text-center" data-toggle="collapse" style="font-size: 20px;">无敌舰队班子</a>
                                    <div id="CompanyEmployeesInformation" class="panel-body panel-collapse collapse in">
                                        <table class="table table-condensed table-hover table-striped" id="allEmpTable">
                                            <tr>
                                                <th>职位</th>
                                                <th>姓名</th>
                                                <th>性别</th>
                                                <th>电话</th>
                                            </tr>
                                            <tr>
                                                <th>舰长</th>
                                                <th>陆品雅</th>
                                                <th>女</th>
                                                <th>15850725308</th>
                                            </tr>
                                            <tr>
                                                <th>副舰长</th>
                                                <th>牟书尧</th>
                                                <th>男</th>
                                                <th>15189833205</th>
                                            </tr>
                                            <tr>
                                                <th>领航员</th>
                                                <th>方子贤</th>
                                                <th>男</th>
                                                <th>15189833205</th>
                                            </tr>
                                            <tr>
                                                <th>通信官</th>
                                                <th>颜一凡</th>
                                                <th>男</th>
                                                <th>15189833653</th>
                                            </tr>
                                            <tr>
                                                <th>舵手</th>
                                                <th>姜恒毅</th>
                                                <th>男</th>
                                                <th>18362099119</th>
                                            </tr>
                                            <tbody id="allEmpTbody"></tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-footer" style="text-align: center">
        ©航空竞价升舱系统     2019-2020
    </div>
</div>
<script type="text/javascript" src="./resources/layui/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use('element', function(){
        var element = layui.element;
        var active={
            tabAdd:function(url,id,name){
                element.tabAdd('contentnav',{
                    title:name,
                    content:'<iframe data-frameid="'+id+'" scrolling="auto" frameborder="0" src="'+url+'" style="width:100%;"></iframe>',
                    id:id
                });
                rightMenu();
                iframeWH();
            },
            tabChange:function(id){
                element.tabChange('contentnav',id);
            },
            tabDelete:function(id){
                element.tabDelete('contentnav',id);
            },
            tabDeleteAll:function(ids){
                $.each(ids,function(index,item){
                    element.tabDelete('contentnav',item);
                });
            }
        };
        $(".site-url").on('click',function(){
            var nav=$(this);
            var length = $("ul.layui-tab-title li").length;
            if(length<=0){
                active.tabAdd(nav.attr("data-url"),nav.attr("data-id"),nav.attr("data-title"));
            }else{
                var isData=false;
                $.each($("ul.layui-tab-title li"),function(){
                    if($(this).attr("lay-id")==nav.attr("data-id")){
                        isData=true;
                    }
                });
                if(isData==false){
                    active.tabAdd(nav.attr("data-url"),nav.attr("data-id"),nav.attr("data-title"));
                }
                active.tabChange(nav.attr("data-id"));
            }
        });
        function rightMenu(){
            //右击弹出
            $(".layui-tab-title li").on('contextmenu',function(e){
                var menu=$(".rightmenu");
                menu.find("li").attr('data-id',$(this).attr("lay-id"));
                l = e.clientX;
                t = e.clientY;
                menu.css({ left:l, top:t}).show();
                return false;
            });
            //左键点击隐藏
            $("body,.layui-tab-title li").click(function(){
                $(".rightmenu").hide();
            });
        }
        $(".rightmenu li").click(function(){
            if($(this).attr("data-type")=="closethis"){
                active.tabDelete($(this).attr("data-id"));
            }else if($(this).attr("data-type")=="closeall"){
                var tabtitle = $(".layui-tab-title li");
                var ids = new Array();
                tabtitle.each(function(i){
                    ids.push($(this).attr("lay-id"));
                });
                //如果关闭所有 ，即将所有的lay-id放进数组，执行tabDeleteAll
                active.tabDeleteAll(ids);
            }
            $('.rightmenu').hide(); //最后再隐藏右键菜单
        });
        function iframeWH(){
            var H = $(window).height()-80;
            $("iframe").css("height",H+"px");
        }
        $(window).resize(function(){
            iframeWH();
        });
    });
</script>
</body>
</html>
