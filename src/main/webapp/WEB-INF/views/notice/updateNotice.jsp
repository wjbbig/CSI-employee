<%--
  Created by IntelliJ IDEA.
  User: Jiabin Wu
  Date: 2019/9/20
  Time: 14:27
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>更新公告信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${APP_PATH}/layuiadmin/layui/css/layui.css" media="all">
</head>
<body>

<div class="layui-form" lay-filter="layuiadmin-form-admin" id="layuiadmin-form-admin" style="padding: 20px 30px 0 0;">
    <div class="layui-form-item">
        <label class="layui-form-label">公告标题</label>
        <div class="layui-input-inline">
            <input type="hidden" id="noticeId" value="${requestScope.noticeInf.id}">
            <input type="text" id="title" name="title" class="layui-input" value="${requestScope.noticeInf.title}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">公告内容</label>
        <div class="layui-input-inline">
            <textarea id="content" name="content" class="layui-input"  style="width: 280px;height: 200px">${requestScope.noticeInf.content}</textarea>
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
