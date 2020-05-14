<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<SCRIPT LANGUAGE="JavaScript">
    <!--
    function check()
    {
        if (isNaN(window.document.login.phone.value))
        {
            alert("号码必须为数字");
            return false;
        }
        if (window.document.test.phone.value.length != 11)
        {
            alert("长度必须为11位")
            return false;
        }
        return true;
    }
    //-->
</SCRIPT>
<body>

<div align="center">

    <h2>欢迎来到竞价升舱</h2><br>
    ${msg}<br>
    <form action="index/login" method="post" name = "login">
        用户名：<input type="text"  name="phone" required><br>
        密码：<input type="password" name="password" required><br>
        <input type="submit" value="登录" onclick="javascript:check();">
    </form>
    <a href="javascript:window.location.href='register.jsp'">注册</a>
</div>
</body>
</html>
