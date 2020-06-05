
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
<form:form action="flightSave" method="post" modelAttribute="returnFlight">
    <form:hidden path="id"/>
    flightCode:<form:input path="flightCode" /><br>
    airCompanyCode:<form:input path="airCompanyCode" /><br>
    airCompanyName:<form:input path="airCompanyName" /><br>
    flightNum:<form:input path="flightNum" /><br>
    flightDate:<form:input path="flightDate" /><br>
    redundantBusinessClass:<form:input path="redundantBusinessClass" /><br>
    redundantFirstClass:<form:input path="redundantFirstClass" /><br>
    startPlace:<form:input path="startPlace" /><br>
    targetPlace:<form:input path="targetPlace" /><br>
    delFlag:<form:input path="delFlag" /><br>
    <br>
    <input type="submit" value="提交"/>
</form:form>
</body>
</html>