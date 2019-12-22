<%--
  Created by IntelliJ IDEA.
  User: wujiabin
  Date: 2019/9/19
  Time: 16:20
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
        <label class="layui-form-label">标题</label>
        <div class="layui-input-inline">
            <input type="hidden" id="documentId" value="${requestScope.documentInf.id}">
            <input type="hidden" id="oldFileName" value="${requestScope.documentInf.fileName}">
            <input type="text" id="title" name="title" class="layui-input" value="${requestScope.documentInf.title}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-inline">
            <textarea id="documentDesc" name="documentDesc" class="layui-input"  style="width: 280px;height: 200px">${requestScope.documentInf.documentDesc}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">文档上传</label>
        <div class="layui-upload">
            <button type="button" class="layui-btn layui-btn-normal" id="document">选择文件</button>
            <button type="button" class="layui-btn" id="uploadBtn">开始上传</button>
        </div>
    </div>

</div>

<script src="${APP_PATH}/layuiadmin/layui/layui.js"></script>
<script>
    layui.use(['layer', 'form','upload'], function(){
        var $ = layui.jquery;
        var form = layui.form ;
        var upload = layui.upload;
        form.render();

        $(function () {
            upload.render({
                elem: '#document'
                ,data:{
                    id:function(){return $("#documentId").val()},
                    title:function(){return $("#title").val()},
                    documentDesc:function () {return $("#documentDesc").val()},
                    oldFileName:function () {return $("#oldFileName").val()}

                }
                ,field:'document'
                ,accept:'file'
                ,exts:'doc|docx'
                ,url: '${APP_PATH}/document/updateDocument.do'
                ,auto: false
                ,bindAction: '#uploadBtn'
                ,done: function(result){
                    if(result.success){
                        if (window != parent)
                            parent.location.reload();
                    }else{
                        layer.msg(result.msg,{time:3000,icon:5});
                    }
                }
            });
        })
    });
</script>
</body>
</html>