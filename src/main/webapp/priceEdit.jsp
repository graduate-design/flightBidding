
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑页面</title>
</head>
<body>
欢迎你：${currentUser}
<hr>
<form:form action="priceSave" method="post" modelAttribute="returnPrice">

    <form:hidden path="id"/>
    price_code:<form:input path="priceCode" /><br>
    berth_class:<form:input path="berthClass" /><br>
    price:<form:input path="price" /><br>
    user_code:<form:input path="userCode" /><br>
    user_name:<form:input path="userName" /><br>
    flight_code:<form:input path="flightCode" /><br>
    create_time:<form:input path="createTime" /><br>
    remark:<form:input path="remark" /><br>
    delflag:<form:input path="delFlag" /><br>
    <br>
    <input type="submit" value="提交"/>
</form:form>
</body>
</html>