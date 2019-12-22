<%--
  Created by IntelliJ IDEA.
  User: Jiabin Wu
  Date: 2019/9/20
  Time: 13:57
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>部门查询</title>
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
                    <label class="layui-form-label">公告名称</label>
                    <div class="layui-input-block">
                        <input type="text" id="noticeNameText" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <button class="layui-btn layuiadmin-btn-useradmin" lay-submit lay-filter="LAY-user-front-search" id="searchBtn">
                        <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                    </button>
                </div>
                <c:if test="${'1' eq sessionScope.USER.roleInf.id}">
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
                        <c:if test="${sessionScope.USER.roleInf.id eq '1'}">
                            <col width="10">
                        </c:if>
                        <col width="150">
                        <col width="900">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <c:if test="${sessionScope.USER.roleInf.id eq '1'}">
                            <th><input type="checkbox" lay-skin="primary" lay-filter="selectAll" id="selectAll"></th>
                        </c:if>
                        <th>公告名称</th>
                        <th>公告内容</th>
                        <th>发布时间</th>
                        <th>发布人</th>
                        <c:if test="${sessionScope.USER.roleInf.id eq '1'}">
                            <th>操作</th>
                        </c:if>
                        <th>预览</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
                    <tr>
                        <c:choose>
                            <c:when test="${'1' eq sessionScope.USER.roleInf.id}">
                                <td colspan="7" id="pageTd">
                                    <div id="demo1"></div>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td colspan="5" id="pageTd">
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
        var table = layui.table;

        $(function () {
            to_page(1);
        });
        function to_page(pageNo) {
            $.ajax({
                url:"${APP_PATH}/notice/getNotices.do",
                data:{
                    "pageNo":pageNo,
                    "title":$("#noticeNameText").val()
                },
                type:"post",
                success:function (result) {
                    if(result.success){
                        build_notices_table(result);
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

        function build_notices_table(result) {
            $("table tbody").empty();
            var users = result.map.pageInfo.list;
            $.each(users,function (index,item) {
                var checkBoxTd = $("<td><input lay-skin='primary' lay-filter='select-item' type='checkbox' class='select-item' id="+item.id+"></td>");
                var titleTd = $("<td></td>").append(item.title);
                var noticeContentTd = $("<td></td>").append(item.content.substring(0,11)+"。。。");
                var createDateTd = $("<td></td>").append(item.createDate);
                var usernameTd = $("<td></td>").append(item.userInf.username);
                var editBtn = $('<button lay-event="edit"></button>').addClass('layui-btn layui-btn-normal layui-btn-xs editBtn').append($("<i></i>").addClass("layui-icon layui-icon-edit")).append("更新");
                //为编辑按钮添加一个自定义的属性
                editBtn.attr("edit_id",item.id);
                editBtn.attr("edit_name",item.title);
                var delBtn = $('<button></button>').addClass('layui-btn layui-btn-danger layui-btn-xs delBtn').append($("<i></i>").addClass("layui-icon layui-icon-delete")).append("删除");
                delBtn.attr("del_id",item.id);
                delBtn.attr("del_name",item.title);
                var btnTd = $("<td></td>").append(editBtn).append("&nbsp;").append(delBtn);
                var previewTd = $("<td></td>").append($("<a id='previewLink'></a>").attr("href","javascript:;").attr("previewId",item.id).append($("<i style='font-size: 25px;'></i>").addClass("layui-icon layui-icon-read")));

                //append方法执行完成以后还是原来的元素
                var opTr =  $("<tr></tr>");

                <c:if test="${sessionScope.USER.roleInf.id eq '1'}">
                opTr.append(checkBoxTd);
                </c:if>

                opTr.append(titleTd)
                    .append(noticeContentTd)
                    .append(createDateTd)
                    .append(usernameTd);

                if(${sessionScope.USER.roleInf.id eq '1'}) {
                    opTr.append(btnTd);
                }

                opTr.append(previewTd).appendTo("table tbody");
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
                    url:"${APP_PATH}/notice/deleteNotice.do",
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
                layer.msg("请至少选择一个公告！",{time:2000,icon:0});
                return false;
            }
            var noticeNames = "";
            var noticeIds = "";
            $.each($(".select-item:checked"),function () {
                noticeNames += $(this).parents("tr").find("td:eq(1)").text()+",";
                noticeIds += $(this).attr("id")+"-";
            });
            noticeNames = noticeNames.substring(0,noticeNames.length-1);
            noticeIds = noticeIds.substring(0,noticeIds.length-1);
            layer.confirm("确定要删除["+noticeNames+"]的信息吗？",function (cindex) {
                layer.close(cindex);
                $.ajax({
                    url:"${APP_PATH}/notice/deleteNotice.do",
                    type:"post",
                    data:{
                        "ids":noticeIds
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
                ,title: '更新公告信息'
                ,content: "${APP_PATH}/notice/toUpdateNotice.go?id="+id
                ,area: ['500px', '600px']
                ,btn: ['更新', '取消']
                ,yes: function(index, layero){
                    var body = layer.getChildFrame('body', index);
                    // 找到隐藏的提交按钮模拟点击提交
                    var title = body.find('#title').val();
                    var content = body.find('#content').val();
                    var noticeId = body.find('#noticeId').val();
                    $.ajax({
                        url:"${APP_PATH}/notice/updateNotice.do",
                        type:"post",
                        data:{
                            "id":noticeId,
                            "title":title,
                            "content":content
                        },
                        success:function (result) {
                            if(result.success){
                                layer.close(index);
                                to_page(currentPage);
                            }else{
                                layer.msg(result.msg,{time:3000,icon:5});
                            }
                        },
                        error:function () {
                            layer.msg("发生错误！",{time:3000,icon:5});
                        }
                    });
                }
            });
        });

        $(document).on("click","#previewLink",function () {
            var id = $(this).attr("previewId");
            layer.open({
                type: 2
                ,title: '更新公告信息'
                ,content: "${APP_PATH}/notice/toPreviewNotice.go?id="+id
                ,area: ['500px', '600px']

            });
        });
    });

</script>
</body>
</html>
