<%--
  Created by IntelliJ IDEA.
  User: Jiabin Wu
  Date: 2019/9/20
  Time: 13:38
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
        <label class="layui-form-label">职位名称</label>
        <div class="layui-input-inline">
            <input type="hidden" id="jobId" value="${requestScope.jobInf.id}">
            <input type="text" id="jobName" name="deptName" class="layui-input" value="${requestScope.jobInf.name}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">职位描述</label>
        <div class="layui-input-inline">
            <textarea id="jobDesc" name="jobDesc" class="layui-input"  style="width: 280px;height: 200px">${requestScope.jobInf.jobDesc}</textarea>
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
        $(function () {
            $.ajax({
                url:"${APP_PATH}/dept/getDepts.do",
                type:"post",
                success:function (result) {
                    if(result.success){
                        var oldId = '${requestScope.jobInf.deptId}';
                        $.each(result.map.depts,function (index,item) {
                            if(oldId == item.id){
                                $("#deptId").append($("<option value='"+item.id+"' selected>"+ item.name +"</option>"));
                            }else{
                                $("#deptId").append($("<option value='"+item.id+"'>"+ item.name +"</option>"));
                            }
                        });
                        form.render();
                    }
                }
            });
        });
    });
</script>
</body>
</html>