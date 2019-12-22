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
    <title>添加公告</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${APP_PATH}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${APP_PATH}/layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">添加公告</div>
                <div class="layui-card-body" pad15>

                    <div class="layui-form" lay-filter="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">公告名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="title" class="layui-input" id="title" style="width: 300px;">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">公告内容</label>
                            <div class="layui-input-inline">
                                <textarea name="content" autocomplete="off" id="content" class="layui-input"
                                          style="width: 300px;height: 200px;"></textarea>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" id="addBtn">添加公告</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="${APP_PATH}/layuiadmin/layui/layui.js"></script>
<script>
    layui.use(['layer','form'], function(){
        var $ = layui.jquery;
        var form = layui.form;

        form.render();

        $("#addBtn").click(function () {
            var title = $("#title");
            var content = $("#content");
            if($.trim(title.val()) == ""){
                title.val("");
                layer.msg("公告名称不能为空！",{time:3000,icon:5});
                return false;
            }
            $.ajax({
                url:"${APP_PATH}/notice/checkNoticeTitle.do",
                type:"post",
                data:{
                    "title":title.val()
                },
                success:function (result) {
                    if(result.success){
                        return true;
                    }else{
                        layer.msg(result.msg,{time:3000,icon:5});
                        return false;
                    }
                }
            });
            if($.trim(content.val()) == ""){
                content.val("");
                layer.msg("公告内容不能为空！",{time:3000,icon:5});
                return false;
            }

            $.ajax({
                url:"${APP_PATH}/notice/addNewNotice.do",
                type:"post",
                data:{
                    "title":title.val(),
                    "content":content.val(),
                    "userId":${sessionScope.USER.id}
                },
                success:function (result) {
                    if(result.success){
                        window.location.href ="${APP_PATH}/notice/toIndex.go";
                    }else{
                        layer.msg("添加公告失败！",{time:2000,icon:5});
                    }
                },
                error:function () {
                    layer.msg("请求失败！",{time:2000,icon:5});
                }
            });
        });
    });
</script>
</body>
</html>