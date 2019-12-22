<%--
  Created by IntelliJ IDEA.
  User: Jiabin Wu
  Date: 2019/9/21
  Time: 11:16
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>员工查询</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${APP_PATH}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${APP_PATH}/layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-form layui-card-header layuiadmin-card-header-auto">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" id="nameText" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">身份证号</label>
                    <div class="layui-input-block">
                        <input type="text" id="cardIdText" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-block">
                        <input type="text" id="phoneText" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <select id="sex">
                            <option value="0" selected>不限</option>
                            <option value="1">男</option>
                            <option value="2">女</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">部门</label>
                    <div class="layui-input-block">
                        <select id="dept">
                            <option value="0" selected>不限</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <button class="layui-btn layuiadmin-btn-useradmin" lay-submit lay-filter="LAY-user-front-search" id="searchBtn">
                        <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                    </button>
                </div>
                <c:if test="${sessionScope.USER.roleInf.id eq '1'}">
                    <div class="layui-inline">
                        <button class="layui-btn layuiadmin-btn-useradmin" data-type="batchdel" id="delSelectBtn">删除</button>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="layui-card-body">

            <div class="layui-form">
                <table class="layui-table">
                    <colgroup>
                        <col width="10">
                        <col width="150">
                        <col width="70">
                        <col width="150">
                        <col width="150">
                        <col width="150">
                        <col width="100">
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>

                    </colgroup>
                    <thead>
                    <tr>
                        <c:if test="${sessionScope.USER.roleInf.id eq '1'}">
                            <th><input type="checkbox" lay-skin="primary" lay-filter="selectAll" id="selectAll"></th>
                        </c:if>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>手机号</th>
                        <th>邮箱</th>
                        <th>职位</th>
                        <th>学历</th>
                        <th>身份证号</th>
                        <th>部门</th>
                        <th>地址</th>
                        <th>建档日期</th>
                        <c:if test="${sessionScope.USER.roleInf.id eq '1'}">
                            <th>操作</th>
                        </c:if>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                    <tfoot>
                    <tr>
                        <c:choose>
                            <c:when test="${'1' eq sessionScope.USER.roleInf.id}">
                                <td colspan="12" id="pageTd">
                                    <div id="demo1"></div>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td colspan="10" id="pageTd">
                                    <div id="demo1"></div>
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="${APP_PATH}/layuiadmin/layui/layui.js"></script>
<%--<script src="${APP_PATH}/layuiadmin/json/jquery-3.3.1.min.js"></script>--%>
<script>
    layui.use(['layer','form','table'], function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
        var $ = layui.jquery;

        $(function () {
            $.ajax({
                url:"${APP_PATH}/dept/getDepts.do",
                type:"post",
                success:function (result) {
                    if(result.success){
                        $.each(result.map.depts,function (index,item) {
                            $("#dept").append($("<option value='"+item.id+"'>"+item.name+"</option>"));
                        });
                        form.render();
                    }
                }
            });
            to_page(1);
        });
        function to_page(pageNo) {
            $.ajax({
                url:"${APP_PATH}/emp/getEmp.do",
                data:{
                    "pageNo":pageNo,
                    "name":$("#nameText").val(),
                    "sex":$("#sex").val(),
                    "deptInf.id":$("#dept").val(),
                    "phone":$("#phoneText").val(),
                    "cardId":$("#cardIdText").val()
                },
                type:"post",
                success:function (result) {
                    if(result.success){
                        build_users_table(result);
                        build_page_nav(result);
                        form.render();
                    }else{
                        layer.msg(result.msg,{time:3000,icon:5});
                    }
                }
            });
        }
        var currentPage;
        //分页条,点击分页能去下一页
        function build_page_nav(result) {
            $("#demo1").empty();
            var div = $("<div></div>").addClass("layui-box layui-laypage layui-laypage-deafult");
            var previousPageLi = $("<a></a>").addClass("layui-laypage-prev ").append("上一页").attr("href","javascript:void(0);");
            if(result.map.pageInfo.hasPreviousPage == false){
                previousPageLi.addClass("layui-disabled");
            }else{
                //为元素添加单击事件
                previousPageLi.click(function () {
                    to_page(result.map.pageInfo.pageNum - 1);
                });
            }
            var nextPageLi =$("<a></a>").addClass("layui-laypage-prev").append("下一页").attr("href","javascript:void(0);");
            if(result.map.pageInfo.hasNextPage == false){
                nextPageLi.addClass("layui-disabled");
            }else{
                nextPageLi.click(function () {
                    to_page(result.map.pageInfo.pageNum + 1);
                });
            }
            div.append(previousPageLi);
            $.each(result.map.pageInfo.navigatepageNums,function (index,item) {
                var numLi =$("<a></a>").append(item).attr("href","javascript:void(0);");
                if(result.map.pageInfo.pageNum == item){
                    numLi = $("<span></span>").addClass("layui-laypage-curr").append($("<em></em>").addClass("layui-laypage-em")).append($("<em></em>").append(item));
                }
                numLi.click(function () {
                    to_page(item);
                });
                div.append(numLi);
            });
            div.append(nextPageLi);
            $("#demo1").append(div);
            currentPage = result.map.pageInfo.pageNum;


        }

        function build_users_table(result) {
            $("table tbody").empty();
            var users = result.map.pageInfo.list;
            $.each(users,function (index,item) {
                var checkBoxTd = $("<td><input lay-skin='primary' lay-filter='select-item' type='checkbox' class='select-item' id="+item.id+"></td>");
                var nameTd = $("<td></td>").append(item.name);

                if(item.sex == '1'){
                    var sexTd = $("<td></td>").append("男");
                }else{
                    var sexTd = $("<td></td>").append("女");
                }

                var phoneTd = $("<td></td>").append(item.phone);
                var emailTd = $("<td></td>").append(item.email);
                var jobTd = $("<td></td>").append(item.jobInf.name);


                if(item.degree == '1'){
                    var degreeTd = $("<td></td>").append("小学");
                }else if(item.degree == '2'){
                    var degreeTd = $("<td></td>").append("初中");
                }else if(item.degree == '3'){
                    var degreeTd = $("<td></td>").append("高中");
                }else if(item.degree == '4'){
                    var degreeTd = $("<td></td>").append("本科");
                }else if(item.degree == '5'){
                    var degreeTd = $("<td></td>").append("研究生");
                }else if(item.degree == '6'){
                    var degreeTd = $("<td></td>").append("博士生");
                }
                var cardIdTd = $("<td></td>").append(item.cardId);
                var deptTd = $("<td></td>").append(item.deptInf.name);
                var addressTd = $("<td></td>").append(item.email);
                var birthdayTd = $("<td></td>").append(item.birthday);
                var editBtn = $('<button lay-event="edit"></button>').addClass('layui-btn layui-btn-normal layui-btn-xs editBtn').append($("<i></i>").addClass("layui-icon layui-icon-edit")).append("更新");
                //为编辑按钮添加一个自定义的属性
                editBtn.attr("edit_id",item.id);
                editBtn.attr("edit_name",item.name);
                var delBtn = $('<button></button>').addClass('layui-btn layui-btn-danger layui-btn-xs delBtn').append($("<i></i>").addClass("layui-icon layui-icon-delete")).append("删除");
                delBtn.attr("del_id",item.id);
                delBtn.attr("del_name",item.name);
                var btnTd = $("<td></td>").append(editBtn).append("&nbsp;").append(delBtn);
                //append方法执行完成以后还是原来的元素
                var opTr =  $("<tr></tr>");
                <c:if test="${sessionScope.USER.roleInf.id eq '1'}">
                    opTr.append(checkBoxTd);
                </c:if>
                opTr.append(nameTd)
                    .append(sexTd)
                    .append(phoneTd)
                    .append(emailTd)
                    .append(jobTd)
                    .append(degreeTd)
                    .append(cardIdTd)
                    .append(deptTd)
                    .append(addressTd)
                    .append(birthdayTd);

                if(${sessionScope.USER.roleInf.id eq '1'}) {
                    opTr.append(btnTd);
                }
                opTr.appendTo("table tbody");
            });
        }

        $("#searchBtn").click(function () {
            to_page(1);
        });



        $(document).on("click",".delBtn",function () {
            var id = $(this).attr("del_id");
            var name = $(this).attr("del_name");

            layer.confirm("确定要删除["+name+"]的信息吗？",function (cindex) {
                layer.close(cindex);
                $.ajax({
                    url:"${APP_PATH}/emp/deleteEmp.do",
                    type:"post",
                    data:{
                        "ids":id
                    },
                    success:function (result) {
                        if(result.success){
                            to_page(currentPage);
                        }
                    }
                });
            },function (cindex) {
                layer.close(cindex);
            });
        });

        //全选
        form.on('checkbox(selectAll)', function (data) {
            var a = data.elem.checked;
            $(".select-item").prop("checked", a);
            form.render('checkbox');
        });

        $(document).on("click",".select-item",function () {
            //判断当前选择中的元素是否6个
            if($(".select-item:checked").length==$(".select-item").length){
                $("#selectAll").prop("checked",true);
                form.render('checkbox');
            }else{
                $("#selectAll").prop("checked",false);
                form.render('checkbox');
            }
        });

        //有一个未选中 取消全选
        form.on('checkbox(select-item)', function (data) {
            var item = $(".select-item");
            for (var i = 0; i < item.length; i++) {
                if (item[i].checked == false) {
                    $("#selectAll").prop("checked", false);
                    form.render('checkbox');
                    break;
                }
            }
            //如果都勾选了  勾上全选
            var  all=item.length;
            for (var i = 0; i < item.length; i++) {
                if (item[i].checked == true) {
                    all--;
                }
            }
            if(all==0){
                $("#selectAll").prop("checked", true);
                form.render('checkbox');}
        });

        $("#delSelectBtn").click(function () {
            if($(".select-item:checked").length == 0){
                layer.msg("请至少选择一名员工！",{time:2000,icon:0});
                return false;
            }
            var empNames = "";
            var empIds = "";
            $.each($(".select-item:checked"),function () {
                empNames += $(this).parents("tr").find("td:eq(1)").text()+",";
                empIds += $(this).attr("id")+"-";
            });
            empNames = empNames.substring(0,empNames.length-1);
            empIds = empIds.substring(0,empIds.length-1);
            layer.confirm("确定要删除["+empNames+"]的信息吗？",function (cindex) {
                layer.close(cindex);
                $.ajax({
                    url:"${APP_PATH}/emp/deleteEmp.do",
                    type:"post",
                    data:{
                        "ids":empIds
                    },
                    success:function (result) {
                        if(result.success){
                            to_page(currentPage);
                        }
                    }
                });
            },function (cindex) {
                layer.close(cindex);
            });
        });

        $(document).on("click",".editBtn",function () {
            var id = $(this).attr("edit_id");
            layer.open({
                type: 2
                ,title: '更新员工信息'
                ,content: "${APP_PATH}/emp/toUpdateEmp.go?id="+id
                ,area: ['800px', '800px']
                ,btn: ['更新', '取消']
                ,yes: function(index, layero){
                    var body = layer.getChildFrame('body', index);
                    // 找到隐藏的提交按钮模拟点击提交
                    var empId = body.find("#empId");
                    var name = body.find("#name");
                    var cardId = body.find("#cardId");
                    var sex = body.find("#sex");
                    var phone = body.find("#phone");
                    var degree = body.find("#degree");
                    var email = body.find("#email");
                    var party = body.find("#party");
                    var qqNum = body.find("#qqNum");
                    var address = body.find("#postCode");
                    var birthday = body.find("#birthday");
                    var speciality = body.find("#speciality");
                    var nation = body.find("#nation");
                    var hobby = body.find("#hobby");
                    var deptId = body.find("#deptId");
                    var jobId = body.find("#jobId");
                    var postCode = body.find("#postCode");
                    var employeeDesc = body.find("#employeeDesc")
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
                        url:"${APP_PATH}/emp/updateEmp.do",
                        type:"post",
                        data:{
                            "id":empId.val(),
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
                                layer.close(index);
                                to_page(currentPage);
                            }else{
                                layer.msg(result.msg,{time:3000,icon:5});
                            }
                        }

                    });
                }
            });
        });
    });

</script>
</body>
</html>
