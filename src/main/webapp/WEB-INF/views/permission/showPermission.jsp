<%--
  Created by IntelliJ IDEA.
  User: Jiabin Wu
  Date: 2019/9/21
  Time: 19:26
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
            <button type="button" class="layui-btn layui-btn-sm" lay-demo="getChecked">获取选中节点数据</button>
            <button type="button" class="layui-btn layui-btn-sm" lay-demo="setChecked">勾选指定节点</button>
            <button type="button" class="layui-btn layui-btn-sm" lay-demo="reload">重载实例</button>
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
            url:"${APP_PATH}/permission/getPermission.do",
            type:"post",
            success:function (result) {
                if(result.success){
                    tree.render({
                        elem: '#permissionTree' //默认是点击节点可进行收缩
                        ,edit: ['update', 'del'] //操作节点的图标
                        //,showCheckbox:true
                        ,data: result.map.permission
                        ,id: 'permissionId'
                        ,click: function(obj){
                            layer.msg(obj.data.id);
                        }
                        ,operate: function(obj){
                        var type = obj.type; //得到操作类型：add、edit、del
                        var data = obj.data; //得到当前节点的数据
                        var elem = obj.elem; //得到当前节点元素

                        //Ajax 操作
                        var id = data.id; //得到节点索引
                        if(type === 'update'){ //修改节点
                            console.log(id); //得到修改后的内容
                        } else if(type === 'del'){ //删除节点

                        };
                    }

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
                            alert(ids);
                        }
                        ,reload: function(){
                            //重载实例
                            tree.reload('permissionId', {

                            });

                        }
                    });

                }
            }
        });



    });

</script>
</body>
</html>
