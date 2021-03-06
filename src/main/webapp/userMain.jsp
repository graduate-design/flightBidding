<%--
  Created by IntelliJ IDEA.
  User: 姜呛呛呛呛
  Date: 2020/5/21
  Time: 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户管理页面</title>
    <script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="resources/layui/layui-v2.5.6/layui/css/layui.css">
    <script type="text/javascript" src="resources/layui/layui-v2.5.6/layui/layui.js"></script>
    <script type="text/javascript" src="resources/layui/layui-v2.5.6/layui/layui.all.js"></script>
    <style type="text/css">
        td{text-align: center;}
        .td2{text-align: right;}
        .table1{
            border:1px solid #ddd;
            width:900px;
        }
        thead{
            background-color:lightblue;
        }
    </style>
</head>
<body>
<a href="userAdd"> 添加用户</a><br>
<c:if test="${empty requestScope.pagemsg}">
    没有任何用户信息！
</c:if>
<c:if test="${!empty requestScope.pagemsg}">
    <table class="layui-table" lay-data="{height:315, url:'/flightBidding_war/admin/userMain', page:true, id:'test'}" lay-filter="test">
        <thead>
        <tr>
            <td>id</td>
            <td>user_code</td>
            <td>user_name</td>
            <td>password</td>
            <td>email</td>
            <td>user_sex</td>
            <td>user_age</td>
            <td>phone</td>
            <td>identity</td>
            <td>authority</td>
            <td>remark</td>
            <td>dosomething</td>
        </tr>
        </thead>
        <c:forEach items="${requestScope.pagemsg.lists}" var="u">
            <tr>
                <th>${u.id }</th>
                <th>${u.userCode }</th>
                <th>${u.userName }</th>
                <th>${u.password }</th>
                <th>${u.email }</th>
                <th>${u.userSex }</th>
                <th>${u.userAge }</th>
                <th>${u.phone }</th>
                <th>${u.identity }</th>
                <th>${u.authority }</th>
                <th>${u.remark }</th>
                <th><a href="userEdit?id=${u.id}">Edit</a>
                <a href="userDelete?id=${u.id}" onclick="return confirm('你要删除该数据么')" >Delete</a></th>
            </tr>
        </c:forEach>
    </table>
</c:if>

<table  border="0" cellspacing="0" cellpadding="0"  width="900px">
    <tr>

        <td class="td2">


            <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>
            <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>
            <span>
       <c:if test="${requestScope.pagemsg.currPage != 1}">
           <a href="${pageContext.request.contextPath }/admin/userMain?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/admin/userMain?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
       </c:if>

       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage && requestScope.pagemsg.totalPage != 0}">
           <a href="${pageContext.request.contextPath }/admin/userMain?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/admin/userMain?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
       </c:if>
   </span>
        </td>
    </tr>
</table>
</body>
</html>