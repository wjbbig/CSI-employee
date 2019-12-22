<%--
  Created by IntelliJ IDEA.
  User: Jiabin Wu
  Date: 2019/9/20
  Time: 19:15
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
                <div class="layui-card-header">添加员工</div>
                <div class="layui-card-body" pad15>

                    <div class="layui-form" lay-filter="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" id="name">
                            </div>

                            <label class="layui-form-label">身份证号码</label>
                            <div class="layui-input-inline">
                                <input type="text"  autocomplete="off" id="cardId" class="layui-input">
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
                                <input type="text" autocomplete="off" id="phone" class="layui-input">
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
                                <input type="text" autocomplete="off" id="email" class="layui-input">
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
                                <input type="text" name="login-name" autocomplete="off" id="qqNum" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-name" autocomplete="off" id="address" class="layui-input">
                            </div>
                            <label class="layui-form-label">邮政编码</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-name" autocomplete="off" id="postCode" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">出生日期</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" id="birthday" placeholder="yyyy年MM月dd日" readonly>
                            </div>
                            <label class="layui-form-label">名族</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-name" autocomplete="off" id="nation" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">所学专业</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-name" autocomplete="off" id="speciality" class="layui-input">
                            </div>
                            <label class="layui-form-label">爱好</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-name" autocomplete="off" id="hobby" class="layui-input">
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
                                <input type="text" name="employeeDesc" autocomplete="off" id="employeeDesc" class="layui-input">
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
    layui.use(['layer','form','laydate'], function(){
        var $ = layui.jquery;
        var form = layui.form;
        var laydate = layui.laydate;
        form.render();

        laydate.render({
            elem: '#birthday'
            ,format: 'yyyy年MM月dd日'
        });


        $.ajax({
            url:"${APP_PATH}/dept/getDepts.do",
            type:"post",
            success:function (result) {
                if(result.success){
                    $.each(result.map.depts,function (index,item) {
                        $("#deptId").append($("<option value='"+item.id+"'>"+item.name+"</option>"));
                    });
                    form.render();
                }
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



        $("#addBtn").click(function () {
            var name = $("#name");
            var cardId = $("#cardId");
            var sex = $("#sex");
            var phone = $("#phone");
            var degree = $("#degree");
            var email = $("#email");
            var party = $("#party");
            var qqNum = $("#qqNum");
            var address = $("#postCode");
            var birthday = $("#birthday");
            var speciality = $("#speciality");
            var nation = $("#nation");
            var hobby = $("#hobby");
            var deptId = $("#deptId");
            var jobId = $("#jobId");
            var postCode = $("#postCode");
            var employeeDesc = $("#employeeDesc");
            var qqReg = /[1-9][0-9]{4,}/;
            var cardIdReg = /\d{15}|\d{18}/;
            var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            var postCodeReg = /[1-9]\d{5}(?!\d)/;
            if(!qqReg.test(qqNum.val())){
                layer.msg("QQ号格式不正确！",{time:3000,icon:5});
                return false;
            }
            if($.trim(name.val()) == ""){
                name.val("");
                layer.msg("姓名不能为空！",{time:3000,icon:5});
                return false;
            }
            if($.trim(cardId.val()) == ""){
                cardId.val("");
                layer.msg("身份证号不能为空！",{time:3000,icon:5});
                return false;
            }
            if(!cardIdReg.test(cardId.val())){
                layer.msg("身份证号格式不正确！",{time:3000,icon:5});
                return false;
            }
            if(sex.val() == '0'){
                layer.msg("请选择性别！",{time:3000,icon:5});
                return false;
            }
            if($.trim(phone.val()) == ""){
                phone.val("");
                layer.msg("手机号不能为空！",{time:3000,icon:5});
                return false;
            }
            if(phone.val().length != 11){
                layer.msg("手机号必须为11位！",{time:3000,icon:5});
                return false;
            }
            if($.trim(email.val()) == ""){
                email.val("");
                layer.msg("邮箱不能为空！",{time:3000,icon:5});
                return false;
            }
            if(!emailReg.test(email.val())){
                layer.msg("邮箱格式不正确！",{time:3000,icon:5});
                return false;
            }
            if(degree.val() == "0"){
                layer.msg("请选择学历！",{time:3000,icon:5});
                return false;
            }
            if(party.val() == "0"){
                layer.msg("请选择政治面貌！",{time:3000,icon:5});
                return false;
            }
            if($.trim(qqNum.val()) == ""){
                qqNum.val("");
                layer.msg("QQ号不能为空！",{time:3000,icon:5});
                return false;
            }

            if($.trim(postCode.val()) == ""){
                postCode.val("");
                layer.msg("邮政编码不能为空！",{time:3000,icon:5});
                return false;
            }
            if($.trim(nation.val()) == ""){
                nation.val("");
                layer.msg("名族不能为空！",{time:3000,icon:5});
                return false;
            }
            if(!postCodeReg.test(postCode.val())){
                layer.msg("邮政编码必须为6位数字！",{time:3000,icon:5});
                return false;
            }
            if($.trim(address.val()) == ""){
                address.val("");
                layer.msg("地址不能为空！",{time:3000,icon:5});
                return false;
            }
            if($.trim(birthday.val()) == ""){
                birthday.val("");
                layer.msg("出生日期不能为空！",{time:3000,icon:5});
                return false;
            }
            if($.trim(speciality.val()) == ""){
                speciality.val("");
                layer.msg("专业不能为空！",{time:3000,icon:5});
                return false;
            }
            if($.trim(employeeDesc.val()) == ""){
                employeeDesc.val("");
                layer.msg("备注不能为空！",{time:3000,icon:5});
                return false;
            }
            if($.trim(hobby.val()) == ""){
                hobby.val("");
                layer.msg("爱好不能为空！",{time:3000,icon:5});
                return false;
            }
            if(deptId.val() == "0"){
                layer.msg("请选择部门！",{time:3000,icon:5});
                return false;
            }
            if(jobId.val() == "0"){
                layer.msg("请选择职位！",{time:3000,icon:5});
                return false;
            }

            $.ajax({
                url:"${APP_PATH}/emp/addNewEmp.do",
                type:"post",
                data:{
                    "deptInf.id":deptId.val(),
                    "jobInf.id":jobId.val(),
                    "name":name.val(),
                    "postCode":postCode.val(),
                    "email":email.val(),
                    "sex":sex.val(),
                    "employeeDesc":employeeDesc.val(),
                    "address":address.val(),
                    "qqNum":qqNum.val(),
                    "phone":phone.val(),
                    "party":party.val(),
                    "birthday":birthday.val(),
                    "nation":nation.val(),
                    "degree":degree.val(),
                    "speciality":speciality.val(),
                    "hobby":hobby.val(),
                    "cardId":cardId.val()

                },
                success:function (result) {
                    if(result.success){
                        window.location.href ="${APP_PATH}/emp/toIndex.go";
                    }else{
                        layer.msg("添加员工失败！",{time:2000,icon:5});
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