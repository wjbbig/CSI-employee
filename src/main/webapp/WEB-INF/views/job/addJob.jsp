<%--
  Created by IntelliJ IDEA.
  User: Jiabin Wu
  Date: 2019/9/20
  Time: 11:13
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
                            <label class="layui-form-label">职位名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="name" class="layui-input" id="jobName">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">职位描述</label>
                            <div class="layui-input-inline">
                                <textarea name="desc" autocomplete="off" id="jobDesc" class="layui-input"
                                          style="width: 300px;height: 200px;"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">所属部门</label>
                            <div class="layui-input-inline">
                                <select id="deptId">
                                    <option value="0" selected="selected">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" id="addBtn">添加职位</button>
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

        $(function () {
            $.ajax({
                url:"${APP_PATH}/dept/getDepts.do",
                type:"post",
                success:function (result) {
                    if(result.success){
                        $.each(result.map.depts,function (index,item) {
                            $("#deptId").append($("<option value='"+item.id+"'>"+ item.name +"</option>"));
                        });
                        form.render();
                    }
                }
            });
        });


        $("#addBtn").click(function () {
            var name = $("#jobName");
            var deptDesc = $("#jobDesc");
            var deptId = $("#deptId");
            if($.trim(name.val()) == ""){
                name.val("");
                layer.msg("职位名称不能为空！",{time:3000,icon:5});
                return false;
            }
            $.ajax({
                url:"${APP_PATH}/job/checkJobName.do",
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
                layer.msg("职位描述不能为空！",{time:3000,icon:5});
                return false;
            }

            if(deptId.val() == '0'){
                layer.msg("请选择一个部门！",{time:3000,icon:5});
                return false;
            }

            $.ajax({
                url:"${APP_PATH}/job/addNewJob.do",
                type:"post",
                data:{
                    "name":name.val(),
                    "jobDesc":deptDesc.val(),
                    "deptId":deptId.val()
                },
                success:function (result) {
                    if(result.success){
                        window.location.href ="${APP_PATH}/job/toIndex.go";
                    }else{
                        layer.msg("添加职位失败！",{time:2000,icon:5});
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