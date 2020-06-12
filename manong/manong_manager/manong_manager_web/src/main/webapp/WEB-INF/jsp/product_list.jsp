
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/6/10
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品列表</title>
</head>
<body>
<table id="dg" class="easyui-datagrid"
       data-options="url:'/product/list',fitColumns:true,singleSelect:true,pageSize:5,pageList:[5,10,15,20]"
       toolbar="#bar" pagination="true" rownumbers="false" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th data-options="field:'id',width:100" editor>id</th>
        <th data-options="field:'name',width:100 " >商品名称</th>
        <th data-options="field:'image',width:100,formatter:showImage">主图</th>
        <th data-options="field:'maketPrice',width:100">市场价格</th>
        <th data-options="field:'price',width:100">价格</th>
        <th data-options="field:'productNumber',width:100">商品编码</th>
    </tr>
    </thead>

</table>

<div id="dlg" class="easyui-dialog"
     style="width: 600px; height: 600px" title="修改信息"
     data-options="closable:false,collapsible:true,modal:true,closed:true">

</div>

<script>
    function showImage(value,row,index) {
        if(row.image) {
            return "<img style='height: 80px; width: auto' src='http://139.180.128.85:8888/"+row.image+"'/>"
        }
    }

</script>

</body>
</html>


