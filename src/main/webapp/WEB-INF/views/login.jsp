<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wujiabin
  Date: 2019/9/11
  Time: 11:12
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登入</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${APP_PATH}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${APP_PATH}/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="${APP_PATH}/layuiadmin/style/login.css" media="all">
</head>
<body>

<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>CSI-employee</h2>
            <p>员工信息后台管理系统</p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                <input type="text" name="username" id="LAY-user-login-username" placeholder="用户名" class="layui-input" value="${USER.loginName}">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="password" name="password" id="LAY-user-login-password" placeholder="密码" class="layui-input" value="${USER.password}">
            </div>

            <div class="layui-form-item" style="margin-bottom: 20px;">
                    <%--<input id="rememberMe" type="checkbox" lay-skin="primary" title="记住密码" checked>--%>
                <c:choose>
                    <c:when test="${'1' eq rememberMe}">
                        <input id="rememberMe" type="checkbox" lay-skin="primary" title="记住密码" checked>
                    </c:when>
                    <c:otherwise>
                        <input id="rememberMe" type="checkbox" lay-skin="primary" title="记住密码">
                    </c:otherwise>
                </c:choose>
                <a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
            </div>
            <div class="layui-form-item">
                <button id="loginBtn" class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit">登 入</button>
            </div>

        </div>
    </div>
</div>

<script src="${APP_PATH}/layuiadmin/layui/layui.js"></script>
<script src="${APP_PATH}/layuiadmin/json/jquery-3.3.1.min.js"></script>
<script>
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

        form.render();
    });
        //
    $("#loginBtn").click(function () {
        var username = $("#LAY-user-login-username");
        var password = $("#LAY-user-login-password");
        var rememberMe = $("#rememberMe")[0].checked;

        if("" == $.trim(username.val())){
            username.val();
            layer.msg("用户名不能为空",{time:3000,icon:2});
            return false;
        }
        if("" == $.trim(password.val())){
            password.val("");
            layer.msg("密码不能为空",{time:3000,icon:2});
            return false;
        }
        var loadingIndex = -1;
        $.ajax({
            url:"${APP_PATH}/login.do",
            data:{
                "username":username.val(),
                "password":password.val(),
                "rememberMe":rememberMe?"1":"0"
            },
            type:"post",
            beforeSend:function () {
                loadingIndex = layer.msg("登入中");
            },
            success:function (result) {
                if(result.success){
                    layer.close(loadingIndex);
                    window.location.href = "${APP_PATH}/main.go";
                }else{
                    layer.msg(result.msg,{time:3000,icon:2});
                }
            },
            error:function () {
                layer.msg("处理失败",{time:3000,icon:2});
            }
        });
    });
</script>
</body>
</html>
