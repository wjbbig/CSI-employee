<%--
  Created by IntelliJ IDEA.
  User: Jiabin Wu
  Date: 2019/9/21
  Time: 15:41
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加员工</title>
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
                <div class="layui-card-header">更新员工信息</div>
                <div class="layui-card-body" pad15>

                    <div class="layui-form" lay-filter="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-inline">
                                <input type="hidden" value="${requestScope.empInf.id}" id="empId">
                                <input type="text" class="layui-input" id="name" value="${requestScope.empInf.name}">
                            </div>

                            <label class="layui-form-label">身份证号码</label>
                            <div class="layui-input-inline">
                                <input type="text"  autocomplete="off" id="cardId" class="layui-input" value="${requestScope.empInf.cardId}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-inline">
                                <select id="sex">
                                    <option value="0" selected>请选择</option>
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select>
                            </div>

                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-inline">
                                <input type="text" autocomplete="off" id="phone" class="layui-input" value="${requestScope.empInf.phone}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">学历</label>
                            <div class="layui-input-inline">
                                <select id="degree">
                                    <option value="0" selected>请选择</option>
                                    <option value="1">小学</option>
                                    <option value="2">初中</option>
                                    <option value="3">高中</option>
                                    <option value="4">专科</option>
                                    <option value="5">本科</option>
                                    <option value="6">研究生</option>
                                    <option value="7">博士生</option>
                                </select>
                            </div>
                            <label class="layui-form-label">邮箱</label>
                            <div class="layui-input-inline">
                                <input type="text" autocomplete="off" id="email" class="layui-input" value="${requestScope.empInf.email}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">政治面貌</label>
                            <div class="layui-input-inline">
                                <select id="party">
                                    <option value="0" selected>请选择</option>
                                    <option value="1">中共党员</option>
                                    <option value="2">共青团员</option>
                                    <option value="3">群众</option>
                                </select>
                            </div>
                            <label class="layui-form-label">QQ</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-name" autocomplete="off" id="qqNum" class="layui-input" value="${requestScope.empInf.qqNum}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-name" autocomplete="off" id="address" class="layui-input" value="${requestScope.empInf.address}">
                            </div>
                            <label class="layui-form-label">邮政编码</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-name" autocomplete="off" id="postCode" class="layui-input" value="${requestScope.empInf.postCode}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">出生日期</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" id="birthday" placeholder="yyyy年MM月dd日" readonly value="${requestScope.empInf.birthday}">
                            </div>
                            <label class="layui-form-label">名族</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-name" autocomplete="off" id="nation" class="layui-input" value="${requestScope.empInf.nation}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">所学专业</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-name" autocomplete="off" id="speciality" class="layui-input" value="${requestScope.empInf.speciality}">
                            </div>
                            <label class="layui-form-label">爱好</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-name" autocomplete="off" id="hobby" class="layui-input" value="${requestScope.empInf.hobby}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">部门</label>
                            <div class="layui-input-inline">
                                <select id="deptId" lay-filter="dept">
                                    <option value="0" selected>请选择</option>
                                </select>
                            </div>
                            <label class="layui-form-label">职位</label>
                            <div class="layui-input-inline">
                                <select id="jobId">
                                    <option value="0" selected>请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">备注</label>
                            <div class="layui-input-inline">
                                <input type="text" name="employeeDesc" autocomplete="off" id="employeeDesc" class="layui-input" value="${requestScope.empInf.employeeDesc}">
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
    layui.use(['layer','form','laydate'], function(){
        var $ = layui.jquery;
        var form = layui.form;
        var laydate = layui.laydate;
        form.render();

        laydate.render({
            elem: '#birthday'
            ,format: 'yyyy年MM月dd日'
        });

        $(function () {
          $("#degree option").each(function () {
              if($(this).val() == '${requestScope.empInf.degree}'){
                  $(this).prop("selected",true);
              }
          });
            $("#sex option").each(function () {
                if($(this).val() == '${requestScope.empInf.sex}'){
                    $(this).prop("selected",true);
                }
            });
            $("#party option").each(function () {
                if($(this).val() == '${requestScope.empInf.party}'){
                    $(this).prop("selected",true);
                }
            });
        });


        $.ajax({
            url:"${APP_PATH}/dept/getDepts.do",
            type:"post",
            success:function (result) {
                if(result.success){
                    $.each(result.map.depts,function (index,item) {
                        if(item.id == '${requestScope.empInf.deptInf.id}'){
                            $("#deptId").append($("<option value='"+item.id+"' selected>"+item.name+"</option>"));
                        }else{
                            $("#deptId").append($("<option value='"+item.id+"'>"+item.name+"</option>"));
                        }

                    });
                    form.render();
                }
            }
        });



        $.ajax({
            url:"${APP_PATH}/job/getJobsByDept.do?deptId=${requestScope.empInf.deptInf.id}",
            type:"post",
            success:function (result) {
                $.each(result.map.jobs,function (index,item) {
                    if(item.id == '${requestScope.empInf.jobInf.id}'){
                        $("#jobId").append($("<option value='"+item.id+"' selected>"+item.name+"</option>"));
                    }else{
                        $("#jobId").append($("<option value='"+item.id+"'>"+item.name+"</option>"));
                    }
                });
                form.render();
            }
        });

        form.on('select(dept)', function(data){
            $("#jobId option").remove();
            $("#jobId").append($("<option value='0'>请选择</option>"));
            $.ajax({
                url:"${APP_PATH}/job/getJobsByDept.do?deptId="+data.value,
                type:"post",
                success:function (result) {
                    $.each(result.map.jobs,function (index,item) {
                        $("#jobId").append($("<option value='"+item.id+"'>"+item.name+"</option>"));
                    });
                    form.render();
                }
            });
        });

    });
</script>
</body>
</html>
