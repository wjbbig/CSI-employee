<%--
  Created by IntelliJ IDEA.
  User: wujiabin
  Date: 2019/9/11
  Time: 16:54
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加用户</title>
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
                <div class="layui-card-header">添加用户</div>
                <div class="layui-card-body" pad15>

                    <div class="layui-form" lay-filter="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="username" class="layui-input" id="username">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">账号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-name" autocomplete="off" id="login-name" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">账号类型</label>
                            <div class="layui-input-inline">
                                <select id="status">
                                    <option value="1">管理员</option>
                                    <option value="2">普通用户</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" id="addBtn">添加员工</button>
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
            var username = $("#username");
            var loginName = $("#login-name");
            var status = $("#status");
            if($.trim(username.val()) == ""){
                username.val("");
                layer.msg("用户名不能为空！",{time:3000,icon:5});
                return false;
            }
            if($.trim(loginName.val()) == ""){
                loginName.val("");
                layer.msg("账号不能为空！",{time:3000,icon:5});
                return false;
            }
            $.ajax({
                url:"${APP_PATH}/user/checkLoginName.do",
                type:"post",
                data:{
                    "loginName":loginName.val()
                },
                success:function (result) {
                    if(result.success){
                        return true;
                    }else{
                        layer.msg("账号已经被使用！",{time:3000,icon:5});
                        return false;
                    }
                }
            });

            $.ajax({
                url:"${APP_PATH}/user/addNewUser.do",
                type:"post",
                data:{
                    "loginName":loginName.val(),
                    "username":username.val(),
                    "roleId":status.val()
                },
                success:function (result) {
                    if(result.success){
                        window.location.href ="${APP_PATH}/user/toIndex.go";
                    }else{
                       layer.msg("添加用户失败！",{time:2000,icon:5});
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