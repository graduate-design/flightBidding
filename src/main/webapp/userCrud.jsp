<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <h1 class="page-title">用户信息管理</h1>
    <div class="stats">
        <button class="btn btn-info stats" id="clMonthBtn" data-toggle="modal" data-target="#clPicModal" style="margin-top: -40px">待定功能</button>
    </div>
</div>
<div class="main-content">
    <!-- 内容nav -->
    <ul class="nav nav-tabs">
        <li><a href="#view-bill" data-toggle="tab">查询所有用户</a></li>
        <li class="active"><a href="#add-bill" data-toggle="tab">添加用户</a></li>
    </ul>

    <!--内容-->
    <div class="row" style="margin-top: 10px;">
        <div class="col-sm-12 col-md-12" style="margin-top: 30px">
            <div id="myTabContent" class="tab-content">

                <!--查询记录-->
                <div class="tab-pane fade" id="view-bill">
                    <!--表格-->
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="panel panel-default">
                                    <table class="table table-condensed table-hover table-striped" id="findCollectingTable" style="width: 100%;table-layout:fixed;word-wrap:break-word;font-size: 13px;">
                                        <tr>
                                            <th hidden="hidden">id</th>
                                            <th>user_code</th>
                                            <th>user_name</th>
                                            <th>user_sex</th>
                                            <th>user_age</th>
                                            <th>phone</th>
                                            <th>identity</th>
                                            <th>authority</th>
                                            <th>remark</th>
                                            <th>password</th>
                                            <th>email</th>
                                            <th>操作</th>
                                        </tr>
                                        <tbody id="findCollectingBody">
                                        <c:forEach items="${pageInfo.list}" var="emp">
                                            <tr>
                                                <th hidden="hidden">${emp.id}</th>i
                                                <th>${emp.user_code}</th>
                                                <th>${emp.user_name}</th>
                                                <th>${emp.user_sex}</th>
                                                <th>${emp.user_age}</th>
                                                <th>${emp.phone}</th>
                                                <th>${emp.identity}</th>
                                                <th>${emp.authority}</th>
                                                <th>${emp.remark}</th>
                                                <th>${emp.password}</th>
                                                <th>${emp.email}</th>
                                                <th>
                                                    <button type="button" class="btn btn-primary btn-sm"><span
                                                            class="glyphicon glyphicon-pencil"
                                                            aria-hidden="true">修改</span>
                                                    </button>
                                                    <button type="button" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true">删除</span>
                                                    </button>
                                                </th>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                            </div>
                            <%-- 分页--%>
                            <div class="row">
                                <%-- 分页信息--%>
                                <div class="col-md-6">
                                    当前${pageInfo.pageNum}页，总共有${pageInfo.pages}页，总共有${pageInfo.total}条记录
                                </div>
                                <div class="col-md-6">
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination">
                                            <li>
                                                <a href="${APP_PATH}/emps?pn=1">
                                                    首页
                                                </a>
                                            </li>
                                            <c:if test="${pageInfo.hasPreviousPage}">
                                                <li>
                                                    <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:forEach items="${pageInfo.navigatepageNums}" var="page_Number">
                                                <c:if test="${page_Number==pageInfo.pageNum}">
                                                    <li class="active"><a href="#">${page_Number}</a></li>
                                                </c:if>
                                                <c:if test="${page_Numbe!=pageInfo.pageNum}">
                                                    <li><a href="${APP_PATH}/emps?pn=${page_Number}">${page_Number}</a></li>
                                                </c:if>
                                            </c:forEach>

                                            <c:if test="${pageInfo.hasNextPage}">
                                                <li>
                                                    <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <li>
                                                <a href="${APP_PATH}/emps?pn=${pageInfo.pages}">
                                                    末页
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>

                                </div>

                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>

