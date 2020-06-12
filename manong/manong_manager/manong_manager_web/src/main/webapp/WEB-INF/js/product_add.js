var MN = MANONG ={
    initProductCategory: function () {
        function loadSubCategory(value) {
            var $box = $("#productAddForm").find('#cbox');
            if(value == 0){
                $box.html('').hide();
                return;
            }
            $.getJSON("/category/list",{id:value},function (data) {

                var s = '';
                s = '<select id="cc2" class="easyui-combobox" name="cid2" style="width:200px;">';
                s += '<option value="0">请选二级分类</option>';

                $.each(data, function (idx, item) {
                    s += '<option value="' + item.id + '">' + item.text + '</option>';
                });

                s += '</select>';
                $box.html(s).show();

                $("#productAddForm").find("select[name='cid2']").combobox({
                    onChange:function () {
                        var value = $("#cc2").val();
                        if(value==0){
                            $("#productAddForm").find("input[name='categoryId']").val($("#productAddForm").find("input[name='cid1']").val());
                        }else{
                            $("#productAddForm").find("input[name='categoryId']").val(value);
                        }

                        }

                });

            });
        };
        $("#productAddForm").find("select[name='cid']").combobox({
            onChange:function () {
                var value = $("#cc").val();
                $("#productAddForm").find("input[name='categoryId']").val(value);
                loadSubCategory(value);
            }
        });
    },

    initPicUpload: function () {
        $("#fileName").filebox({
            prompt: "选择图片",
            width: "200",
            buttonText: "浏览",
        });

        //监听上传事件
        $(".uploadPic").click(function () {
            $.ajaxFileUpload({
                url:'/uploadfile',
                fileElementId:'filebox_file_id_1',
                type:'post',
                success:function (data) {
                    //下面语句实现console中显示路径
                   console.log($(data).find("body").text())
                    $("#img").attr("src","http://139.180.128.85:8888/" +  $(data).find("body").text());
                    $("#productAddForm").find("input[name='image']").val($(data).find("body").text());

                }
            });
        });
    },

        init:function (data) {
        this.initProductCategory();
        //初始化上传图片
        this.initPicUpload();
    }
}