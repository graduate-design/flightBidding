<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>

<body style="text-align: center;">

<div align="center">

    <h1>欢迎来到无敌舰队订票系统注册</h1>
    <hr>

    <div class="crumbs">

        您现在的位置：
        <a href="/" shape="rect">官网首页</a>

        &nbsp;>&nbsp;
        <a href="/" shape="rect">注册</a>

    </div>

    <form action="/RegistServlet" method="POST" onsubmit="return checkForm()">

        <table>

            <tr>

                <td> <span class="required" style="background: aliceblue">*</span>>用户名:</td>

                <div class="lay-bd">
                    <ul class="reg-list">
                        <li>
                            <div class="label"><span class="required">*</span> 用 户 名：</div>

                            <td><input type="text" placeholder="用户名设置成功后不可修改" style="background:gray" name="username" value="${param.username }" /></td>

                            <td id="username_msg"></td>



            <tr>

                <td>密码:</td>

                <td><input type="password" placeholder="6-20位字母、数字或符号" name="password" /></td>

                <td id="password_msg"></td>

            </tr>

            <tr>

                <td>确认密码:</td>

                <td><input type="password" placeholder="请再次输入您的登录密码" name="password2" /></td>

                <td id="password2_msg"></td>

            </tr>

            <tr>

                <td>证件类型:</td>

                <td>

                    <select name="type">

                        <option value="中国民居身份证">中国民居身份证</option>

                        <option value="港澳居民来往内地通行证">港澳居民来往内地通行证</option>

                        <option value="台湾居民来往内地通行证">台湾居民来往内地通行证</option>

                        <option value="护照">护照</option>

                    </select>

                </td>
            <tr/>

            <td>

                <input type="radio" name="idTypeRadio" value="中国民居身份证" />中国居民身份证</label><br/>

                <input type="radio" name="idTypeRadio" value="港澳居民来往内地通行证" />港澳居民来往内地通行证<br/>

                <input type="radio" name="idTypeRadio" value="台湾居民来往内地通行证" />台湾居民来往内地通行证<br/>

                <input type="radio" name="idTypeRadio" value="护照" />护照<br/>

            </td>

            <td id="password2msg"></td>

            </tr>

            <tr>

                <td>昵称:</td>

                <td><input type="text" placeholder="请输入昵称" name="nickname" value="${param.nickname }" /></td>

                <td id="nickname_msg"></td>

            </tr>

            <tr>

                <td>邮箱:</td>

                <td><input type="text" placeholder="请输入邮箱" name="email" value="${param.email }" /></td>

                <td id="email_msg"></td>

            </tr>

            <tr>

                <td>验证码:</td>

                <td><input type="text" placeholder="请输入验证码" name="valistr" /></td>

                <td id="valistr_msg">${msg }</td>

            </tr>

            <tr>

                <td><input type="submit" value="注册用户" /></td>

                <td><img src="/ValiImg" onclick="changeImg(this)" style="cursor: pointer;" /></td>

            </tr>

        </table>

    </form>

</div>

</body>

<a href="${pageContext.request.contextPath}/index.jsp">返回首页</a>

</html>
