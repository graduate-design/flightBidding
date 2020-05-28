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
<%--<a href="ticketAdd"> 添加用户</a><br>--%>
<c:if test="${empty requestScope.pagemsg}">
    没有任何用户信息！
</c:if>
<c:if test="${!empty requestScope.pagemsg}">
    <table border="1" cellpadding="10" cellspacing="0" class="table1">
        <thead>
        <tr>
            <td>id</td>
            <td>identity</td>
            <td>user_name</td>
            <td>buy_way</td>
            <td>air_company_name</td>
            <td>flight_num</td>
            <td>start</td>
            <td>destination</td>
            <td>flight_date</td>
            <td>berth_name</td>
            <td>gate_num</td>
            <td>seat_mum</td>
            <td>remark</td>
            <td>操作</td>
        </tr>
        </thead>
        <c:forEach items="${requestScope.pagemsg.lists}" var="t">
            <tr>
                <th>${t.id }</th>
                <th>${t.identity }</th>
                <th>${t.userName }</th>
                <th>${t.buy_way }</th>
                <th>${t.air_company_name }</th>
                <th>${t.flight_num }</th>
                <th>${t.start }</th>
                <th>${t.destination }</th>
                <th>${t.flight_date }</th>
                <th>${t.berth_name }</th>
                <th>${t.gate_num }</th>
                <th>${t.seat_mum }</th>
                <th>${t.remark }</th>
                <th><a href="ticketEdit?id=${t.id}">Edit</a>
                <a href="ticketDelete?id=${t.id}" onclick="return confirm('你要删除该数据么')" >Delete</a></th>
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
           <a href="${pageContext.request.contextPath }/admin/ticketMain?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/admin/ticketMain?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
       </c:if>

       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage && requestScope.pagemsg.totalPage != 0}">
           <a href="${pageContext.request.contextPath }/admin/ticketMain?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/admin/ticketMain?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
       </c:if>
   </span>
        </td>
    </tr>
</table>
</body>
</html>