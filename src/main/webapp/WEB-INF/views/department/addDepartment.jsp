<%--
  Created by IntelliJ IDEA.
  User: wujiabin
  Date: 2019/9/18
  Time: 9:23
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加部门</title>
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
                <div class="layui-card-header">添加部门</div>
                <div class="layui-card-body" pad15>

                    <div class="layui-form" lay-filter="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">部门名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="name" class="layui-input" id="deptName">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">部门描述</label>
                            <div class="layui-input-inline">
                                <textarea name="deptDesc" autocomplete="off" id="deptDesc" class="layui-input"
                                    style="width: 300px;height: 200px;"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" id="addBtn">添加部门</button>
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
            var name = $("#deptName");
            var deptDesc = $("#deptDesc");
            if($.trim(name.val()) == ""){
                name.val("");
                layer.msg("部门名不能为空！",{time:3000,icon:5});
                return false;
            }
            $.ajax({
                url:"${APP_PATH}/dept/checkDeptName.do",
                type:"post",
                data:{
                    "name":name.val()
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
            if($.trim(deptDesc.val()) == ""){
                deptDesc.val("");
                layer.msg("部门描述不能为空！",{time:3000,icon:5});
                return false;
            }

            $.ajax({
                url:"${APP_PATH}/dept/addNewDept.do",
                type:"post",
                data:{
                    "name":name.val(),
                    "deptDesc":deptDesc.val()
                },
                success:function (result) {
                    if(result.success){
                        window.location.href ="${APP_PATH}/dept/toIndex.go";
                    }else{
                        layer.msg("添加部门失败！",{time:2000,icon:5});
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