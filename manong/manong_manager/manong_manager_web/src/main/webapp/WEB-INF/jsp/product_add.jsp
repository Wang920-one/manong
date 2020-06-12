
<%@ page import="pojo.EasyUITree" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/6/13
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <title>商品添加</title>

<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/product_add.js"></script>

<%
    List<EasyUITree> list = (List<EasyUITree>) session.getAttribute("categories");
%>
<div style="padding: 10px 10px 10px 10px">
    <form id="productAddForm" method="post">

        <input type="hidden" name="categoryId">
        <input type="hidden" name="image">
        <input type="hidden" name="description">

        <table cellpadding="10px">
            <tr>
                <td>商品名称</td>
                <td><input class="easyui-textbox" name="name" data-options="required:true" style="width:800px"></td>
            </tr>
            <tr>
                <td>商品分类</td>
                <td>
                    <select id="cc" class="easyui-combobox" name="cid" style="width:200px;">
                        <option value="0">请选择</option>
                        <%
                            for(int i=0;i<list.size();i++){
                                EasyUITree item = list.get(i);
                        %>

                        <option value="<%=item.getId()%>"><%=item.getText()%></option>
                        <%
                            }
                        %>
                    </select>
                    <p id = "cbox" style="display:none"></p>
                </td>
            </tr>

            <tr>
                <td>市场价格</td>
                <td>
                    <input class="easyui-numberbox" data-options="min:1,max:99999999,precision:2,required:true"
                           style="width:800px" name="maketPricePreview">
                    <input type="hidden" name="maketPrice">
                </td>
            </tr>

            <tr>
                <td>商品价格</td>
                <td>
                    <input class="easyui-numberbox" data-options="min:1,max:99999999,precision:2,required:true"
                           style="width:800px" name="pricePreview">
                    <input type="hidden" name="price">
                </td>            </tr>

            <tr>
                <td>商品编号</td>
                <td>
                    <input class="easyui-numberbox" data-options="required:true"
                           style="width:800px" name="productNumber">
                </td>
            </tr>

            <tr>
                <td>商品主图</td>
                <td>
                    <input id="fileName" name="uploadfile" />
                    <a href="#" class="easyui-linkbutton uploadPic">上传图片</a>
                </td>
            </tr>

            <tr>
                <td>商品主图预览</td>
                <td>
                    <img src=""id = "img" width="250" height="320">
                </td>

            </tr>

            <tr>
                <td>商品描述</td>
                <td>
                    <script id="editor" type="text/plain" style="width:800px;height:500px;"></script>
                </td>
            </tr>

        </table>
    </form>

    <div align="center">
        <a id="btn" href="#" class="easyui-linkbutton" onclick="submitForm()">提交</a>


    </div>


</div>

<script>

    $(function () {
        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例

        //为何只能通过这里修改, 在ueditor.config.js中修改无用, 为何?
        UEDITOR_CONFIG.UEDITOR_HOME_URL = '/ueditor/';
        UEDITOR_CONFIG.serverUrl="/ueditor/jsp/controller.jsp";
        UE.getEditor('editor');
        //调用初始化方法实现二级分类
        MANONG.init();
    });

    //提交表单的方法
    function submitForm() {

        $("#productAddForm").find("input[name='description']").val( UE.getEditor('editor').getContent());

        $("#productAddForm").find("input[name='price']").val(eval($("#productAddForm").find("input[name='pricePreview']").val())*100);
        $("#productAddForm").find("input[name='maketPrice']").val(eval($("#productAddForm").find("input[name='maketPricePreview']").val())*100);

        $.post("/product_save", $("#productAddForm").serialize(),function (data) {
            if(data.status == 200){
                $.messager.alert('提示','成功添加商品');
            }
        })
    }

</script>


