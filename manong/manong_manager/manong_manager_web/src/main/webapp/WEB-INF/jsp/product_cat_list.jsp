<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/6/11
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品分类</title>
</head>
<body>
<ul id="Category" class="easyui-tree"></ul>

<%-- the context menu is defined as below:--%>
<div id="mm" class="easyui-menu" style="width:120px;">
    <div onclick="append_first()" data-options="iconCls:'icon-add'">添加一级分类</div>
    <div onclick="append()" data-options="iconCls:'icon-add'">添加二级分类</div>
    <div onclick="rename()" data-options="iconCls:'icon-add'">修改</div>
    <div onclick="remove()" data-options="iconCls:'icon-remove'">删除</div>

</div>

    <script type="text/javascript">
        $(function () {
            $('#Category').tree({
                url: "/category/list",
                // 响应鼠标右键
                onContextMenu: function(e, node){
                    e.preventDefault();
                    // select the node
                    $('#Category').tree('select', node.target);
                    // display context menu
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                },
                onAfterEdit : function (node) {
                    var _tree = $('#Category');

                    if(node.id == 0){
                        $.post("/category/add",{parentId:node.parentId, name :node.text},function (data) {
                            if(data.status == 200){
                                _tree.tree('update', {
                                    target: node.target,
                                    id : data.msg
                                });
                            }else{
                                $.messager.alert("添加失败");
                            }
                        })
                    }else{
                        $.post("/category/rename",{id :node.id, name:node.text},function (data) {
                            if(data.status==200){

                                alert("修改成功");
                            }else{
                                alert("修改失败");
                            }
                        })
                    }
                }
            });

        });
        // 定义增删改方法
        function append() {
            var tree = $('#Category');
            var node = tree.tree('getSelected');

            tree.tree('append', {
                parent: (node ? node.target : null),
                data: [{
                    id: 0,
                    parentId: node.id,
                    text: '新建分类'
                }]
            });
            var _node = tree.tree("find",0);
            tree.tree("select",_node.target).tree('beginEdit',_node.target);
        }


        function append_first() {
            var tree = $('#Category');
            var node = tree.tree('getSelected');

            tree.tree('append', {
                parent: null,
                data: [{
                    id: 0,
                    parentId: 0,
                    text: '新建分类'
                }]
            });
            var _node = tree.tree("find",0);
            tree.tree("select",_node.target).tree('beginEdit',_node.target);
        }
        function rename() {
            var tree = $('#Category');
            var node = tree.tree('getSelected');
             tree.tree('beginEdit',node.target);




        };

        function remove() {
            var tree =  $('#Category');
            var node = tree.tree('getSelected');

            $.post("/category/del",{parentId:node.attributes,id:node.id},function (data) {
                if(data.status==200){

                    tree.tree("remove",node.target);
                }else{
                    $.messager.alert("删除分类失败");
                }
            })
        }
    </script>
</body>
</html>
