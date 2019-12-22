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
    <title>更新部门信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${APP_PATH}/layuiadmin/layui/css/layui.css" media="all">
</head>
<body>

<div class="layui-form" lay-filter="layuiadmin-form-admin" id="layuiadmin-form-admin" style="padding: 20px 30px 0 0;">
    <div class="layui-form-item">
        <label class="layui-form-label">部门名</label>
        <div class="layui-input-inline">
            <input type="hidden" id="deptId" value="${requestScope.deptInf.id}">
            <input type="text" id="deptName" name="deptName" class="layui-input" value="${requestScope.deptInf.name}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门信息</label>
        <div class="layui-input-inline">
            <textarea id="deptDesc" name="deptDesc" class="layui-input"  style="width: 280px;height: 200px">${requestScope.deptInf.deptDesc}</textarea>
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
