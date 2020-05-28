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
    <title>主页</title>
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
欢迎你：${currentUser}
<br>
<hr>
<a href="priceAdd"> 添加用户</a><br>
<c:if test="${empty requestScope.pagemsg}">
    没有任何用户信息！
</c:if>
<c:if test="${!empty requestScope.pagemsg}">
    <table border="1" cellpadding="10" cellspacing="0" class="table1">
        <thead>
        <tr>
            <td>id</td>
            <td>price_code</td>
            <td>berth_class</td>
            <td>price</td>
            <td>user_code</td>
            <td>user_name</td>
            <td>flight_code</td>
            <td>create_time</td>
            <td>remark</td>
            <td>delflag</td>
            <td>操作</td>
        </tr>
        </thead>
        <c:forEach items="${requestScope.pagemsg.lists}" var="p">
            <tr>
                <th>${p.id }</th>
                <th>${p.priceCode }</th>
                <th>${p.price }</th>
                <th>${p.berthClass }</th>
                <th>${p.userCode }</th>
                <th>${p.userName }</th>
                <th>${p.flightCode }</th>
                <th>${p.createTime }</th>
                <th>${p.remark }</th>
                <th>${p.delFlag }</th>
                <th><a href="priceEdit?id=${p.id}">Edit</a>
                <a href="priceDelete?id=${p.id}" onclick="return confirm('你要删除该数据么')" >Delete</a></th>
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
           <a href="${pageContext.request.contextPath }/admin/priceMain?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/admin/priceMain?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
       </c:if>

       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage && requestScope.pagemsg.totalPage != 0}">
           <a href="${pageContext.request.contextPath }/admin/priceMain?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/admin/priceMain?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
       </c:if>
   </span>
        </td>
    </tr>
</table>
</body>
</html>