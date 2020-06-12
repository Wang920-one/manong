<%--
  Created by IntelliJ IDEA.
  User: henjun
  Date: 2019/6/9
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商场管理系统</title>
<%--    Download the library and include EasyUI CSS and JavaScript files on your page.--%>
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/js/ajaxFileUpload.js"></script>

</head>
<%--使用文档:https://www.jeasyui.com/documentation/index.php#--%>
<body class="easyui-layout">
<div data-options="region:'west',title:'管理菜单',split:true,minWidth:180" style="width:100px;">

    <ul id="tt" class="easyui-tree">
        <li>
            <span>商品分类管理</span>
            <ul>
                <li data-options="attributes:{'url':'product_cat_list'}">商品分类列表</li>
            </ul>
        </li>
        <li>
            <span>商品管理</span>
            <ul>
                <li data-options="attributes:{'url':'product_list'}">商品列表</li>
                <li data-options="attributes:{'url':'product_add'}">商品添加</li>
            </ul>
        </li>
    </ul>

</div>
<div data-options="region:'center'" style="padding:5px;background:#eee;">
    <div id="tabs" class="easyui-tabs" >
        <div title="首页" style="padding:20px;display:none;">
            首页
        </div>
    </div>
</div>
<script>
    // 当点击菜单栏项目后显示tab
    $('#tt').tree({
        onClick: function(node){
            var tabs = $("#tabs");
            var tab = tabs.tabs("getTab",node.text);

            //如果tab存在, 回到该tab, 若不存在,新建tab
            if(tab){
                tabs.tabs('select',node.text);
            }else{
                // add a new tab panel
                tabs.tabs('add',{
                    title:node.text,
                    content:'Tab Body',
                    href:node.attributes.url,
                    closable:true
                });
            }



        }
    });
</script>
</body>
</html>
