<%--
  Created by IntelliJ IDEA.
  User: wujiabin
  Date: 2019/9/17
  Time: 10:36
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>设置我的密码</title>
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
                <div class="layui-card-header">修改密码</div>
                <div class="layui-card-body" pad15>

                    <div class="layui-form" lay-filter="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">当前密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="oldPassword" lay-verify="required" lay-verType="tips" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="password" lay-verify="pass" lay-verType="tips" autocomplete="off" id="LAY_password" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">确认新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="rePassword" lay-verify="repass" lay-verType="tips" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="setmypass" id="resetBtn">确认修改</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="${APP_PATH}/layuiadmin/layui/layui.js"></script>
<script src="${APP_PATH}/layuiadmin/json/jquery-3.3.1.min.js"></script>
<script src="${APP_PATH}/layuiadmin/json/md5.js"></script>
<script>
    layui.use(['layer'],function () {
        var $ = layui.jquery;
        $("#resetBtn").click(function () {
            var oldPassword = $("#oldPassword");
            var newPassword = $("#password");
            var rePassword = $("#rePassword");
            var old = "${USER.password}";

            if($.trim(oldPassword.val()) == ""){
                layer.msg("旧密码不能为空！",{time:3000,icon:5});
                return false;
            }
            if(old != $.md5(oldPassword.val())){
                layer.msg("旧密码不正确！",{time:3000,icon:5});
                return false;
            }
            if($.trim(newPassword.val()) == ""){
                layer.msg("新密码不能为空！",{time:3000,icon:5});
                return false;
            }
            if(newPassword.val().length>16 || newPassword.val().length<6){
                layer.msg("密码必须为6到16位！",{time:3000,icon:5});
                return false;
            }
            if($.trim(rePassword.val()) == ""){
                layer.msg("再次输入密码不能为空！",{time:3000,icon:5});
                return false;
            }
            if(rePassword.val() != newPassword.val()){
                layer.msg("两次密码不一致！",{time:3000,icon:5});
                return false;
            }

            $.ajax({
                url:"${APP_PATH}/user/resetPassword.do",
                type:"post",
                data:{
                    "password":newPassword.val(),
                    "id":${USER.id}
                },
                success:function (result) {
                    if(result.success){
                        if (window != top)

                            top.location.href ="${APP_PATH}/index.go";
                    }else{
                        layer.msg(result.msg,{time:3000,icon:5});
                    }
                },
                error:function () {
                    layer.msg("修改密码失败！",{time:3000,icon:5});
                }
            });
        })
    });
</script>
</body>
</html>
