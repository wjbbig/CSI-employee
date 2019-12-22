<%--
  Created by IntelliJ IDEA.
  User: Jiabin Wu
  Date: 2019/9/21
  Time: 21:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <div class="layui-btn-container">
            <button type="button" class="layui-btn layui-btn-sm" lay-demo="getChecked">分配权限</button>
            <button type="button" class="layui-btn layui-btn-sm" lay-demo="reload">重载权限树</button>
        </div>

        <div id="permissionTree" class="demo-tree-more"></div>
    </div>
</div>
<script src="${APP_PATH}/layuiadmin/layui/layui.js"></script>
<%--<script src="${APP_PATH}/layuiadmin/json/jquery-3.3.1.min.js"></script>--%>
<script>
    layui.use(['layer','form','table','tree'], function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
        var $ = layui.jquery;
        var tree = layui.tree;
        var util = layui.util;

        $.ajax({
            url:"${APP_PATH}/role/getPermissionOfRole.do?id=${roleId}",
            type:"post",
            success:function (result) {
                if(result.success){
                    tree.render({
                        elem: '#permissionTree' //默认是点击节点可进行收缩
                        ,showCheckbox:true
                        ,data: result.map.permission
                        ,id: 'permissionId'
                    });

                    util.event('lay-demo', {
                        getChecked: function(othis){
                            var checkedData = tree.getChecked('permissionId'); //获取选中节点的数据
                            var ids = "";
                            $.each(checkedData,function (index,item) {
                                ids += item.id + "-";
                                $.each(item.children,function (index,child) {
                                    ids += child.id + "-";
                                });
                            });
                            ids = ids.substring(0,ids.length-1);
                            $.ajax({
                                url:"${APP_PATH}/role/addRolePermission.do?id=${requestScope.roleId}",
                                type:"post",
                                data:{
                                  "ids":ids
                                },
                                success:function (result) {
                                    if(result.success){
                                        window.location.href = "${APP_PATH}/role/toIndex.go";
                                    }else{
                                        layer.msg(result.msg,{time:3000,icon:5});
                                    }
                                }
                            });
                        }
                        ,reload: function(){
                            //重载实例
                            tree.reload('permissionId', {

                            });

                        }
                    });

                }else{
                    layer.msg(result.msg,{time:3000,icon:5});
                }
            }
        });




    });

</script>
</body>
</html>