<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wujiabin
  Date: 2019/9/17
  Time: 16:37
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layuiAdmin 管理员 iframe 框</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${APP_PATH}/layuiadmin/layui/css/layui.css" media="all">
</head>
<body>

<div class="layui-form" lay-filter="layuiadmin-form-admin" id="layuiadmin-form-admin" style="padding: 20px 30px 0 0;">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="hidden" id="userId" value="${requestScope.userInf.id}">
            <input type="text" id="username" name="username" class="layui-input" value="${requestScope.userInf.username}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline">
            <input type="text" id="loginName" name="loginName" class="layui-input" value="${requestScope.userInf.loginName}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">账号类型</label>
        <div class="layui-input-inline">
            <select id="roleId" name="roleId">
                <c:choose>
                    <c:when test="${requestScope.userInf.roleInf.id == 1}">
                        <option value="1" selected>管理员</option>
                        <option value="2">普通用户</option>
                    </c:when>
                    <c:otherwise>
                        <option value="1">管理员</option>
                        <option value="2" selected>普通用户</option>
                    </c:otherwise>
                </c:choose>
            </select>
        </div>
    </div>

    <div class="layui-form-item layui-hide">
        <input type="button" lay-submit lay-filter="LAY-user-front-submit" id="updateSubmit" value="确认">
    </div>
</div>

<script src="${APP_PATH}/layuiadmin/layui/layui.js"></script>
<script>
    layui.use(['layer', 'form'], function(){
        var $ = layui.jquery;
        var form = layui.form ;

        form.render();

    });
</script>
</body>
</html>
