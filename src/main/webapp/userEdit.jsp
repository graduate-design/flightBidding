
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
<form:form action="userSave" method="post" modelAttribute="returnUser">
    <form:hidden path="id"/>
    userCode:<form:input path="userCode" /><br>
    用户名:<form:input path="userName" /><br>
    密码:<form:input path="password" /><br>
    邮件:<form:input path="email" /><br>
    性别:<form:input path="userSex" /><br>
    年龄:<form:input path="userAge" /><br>
    电话:<form:input path="phone" /><br>
    identity:<form:input path="identity" /><br>
    authority:<form:input path="authority" /><br>
    remark:<form:input path="remark" /><br>
    <br>
    <input type="submit" value="提交"/>
</form:form>
</body>
</html>