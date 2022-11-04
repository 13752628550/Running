<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gzfy_Greencode.aspx.cs" Inherits="WeiXinCqe.Weixin.greencode.Gzfy_Greencode" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">--%>
    <!doctype html>
<html lang="en">

<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>健康码、行程卡、核酸结果上传</title>
    <link href="../../style2/weui.css" rel="stylesheet" />
    <link rel="stylesheet" href="/style/weui.css" />
    <link href="../../style2/weui.min.css" rel="stylesheet" /> 
    <script src="../../style2/js_datetime/js/jquery.min.js"></script>
  <style type="text/css">
        .weui-cells__title {
            font-size:17px;
            color:black;
        } 
    </style> 
</head> 
<body>
     <form id="form1" runat="server">
 
  <div class="page">
    <div class="page__hd">
      <%--  <h2 class="page__title"   >健康码、行程卡、核酸结果上传</h2> 
        <p class="page__desc"  style="font-size:22px; font-weight:bold; "></p> --%>
        <asp:Label ID="lbl_status"     runat="server"></asp:Label>
    </div>
    <div class="page__bd">
        <div class="weui-gallery" id="gallery">
            <span class="weui-gallery__img" id="galleryImg"></span>
            <div class="weui-gallery__opr">
                图片有误时，重新上传即可。
            </div>
        </div>
         <div class="weui-cells">
            
              <div class="weui-cell ">
                <div class="weui-cell__bd">
                    <p>部门</p>
                </div>
                <div class="weui-cell__ft"><asp:Label ID="lbl_dept" runat="server"></asp:Label></div>
            </div>
              <div class="weui-cell ">
                <div class="weui-cell__bd">
                    <p>姓名</p>
                </div>
                <div class="weui-cell__ft"><asp:Label ID="lbl_name" runat="server"></asp:Label></div>
            </div>
              <div class="weui-cell ">
                <div class="weui-cell__bd">
                    <p>工号</p>
                </div>
                <div class="weui-cell__ft"><asp:Label ID="lbl_staffid" runat="server"></asp:Label></div>
            </div>
         </div>
        <div class="weui-tab">
            <div class="weui-navbar">
                <div id="divlabel1" class="weui-navbar__item weui-bar__item_on" onclick="aclick('健康码')" runat="server">
                    健康码
                </div>
                <div id="divlabel3" class="weui-navbar__item" onclick="aclick('行程卡')" runat="server">
                    行程卡
                </div>
                <div id="divlabel2" class="weui-navbar__item" onclick="aclick('核酸结果')" runat="server">
                    核酸结果
                </div>
            </div>
            <div class="weui-tab__panel">
                <div class="weui_cells_title" style="display:none">
                    <asp:Label ID="Labeltitle" runat="server" Text="Label"></asp:Label>
                </div>

                <div class="weui-cells weui-cells_form" runat="server" id="JK">

                    <div class="weui-cell  weui-cell_uploader">
                        <div class="weui-cell__bd">
                            <div class="weui-uploader">
                                <div class="weui-uploader__hd">
                                    <p class="weui-uploader__title">健康码上传</p>
                                </div>
                                <div class="weui-uploader__bd">
                                    <ul class="weui-uploader__files" id="uploaderFiles">
                                    </ul>
                                    <div class="weui-uploader__input-box">
                                        <input id="uploaderInput" class="weui-uploader__input" type="file" accept="image/*" multiple />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div style="margin: 30px 0;">
                        <asp:Button ID="Button1" runat="server" Text="提交" CssClass="weui_btn weui_btn_primary" OnClick="Button1_Click" />
                        <input type="hidden" id="hidden_t" name="aa" />
                    </div>

                </div>

                <div class="weui-cells weui-cells_form" runat="server" id="XC">

                    <div class="weui-cell  weui-cell_uploader">
                        <div class="weui-cell__bd">
                            <div class="weui-uploader">
                                <div class="weui-uploader__hd">
                                    <p class="weui-uploader__title">行程码</p>
                                </div>
                                <div class="weui-uploader__bd">
                                    <ul class="weui-uploader__files" id="uploaderFiles2">
                                    </ul>
                                    <div class="weui-uploader__input-box">
                                        <input id="uploaderInput2" class="weui-uploader__input" type="file" accept="image/*" multiple />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div style="margin: 30px 0;">
                        <asp:Button ID="Button3" runat="server" Text="提交" CssClass="weui_btn weui_btn_primary" OnClick="Button3_Click" />
                        <input type="hidden" id="hidden_t2" name="cc" />
                    </div>

                </div>

                 <div class="weui-cells weui-cells_form" runat="server" id="HS">

                     <div class="weui-cells__title">14天内最近的核酸检测结果？</div>
                     <div class="weui-cells weui-cells_radio">
                         <label class="weui-cell weui-check__label" for="a1">
                             <div class="weui-cell__bd">
                                 <p>未做核酸检测</p>
                             </div>
                             <div class="weui-cell__ft">
                                 <input type="radio" class="weui-check" name="radio1" id="a1" onclick="an_s('A', 1)" runat="server" />
                                 <span class="weui-icon-checked"></span>
                             </div>
                         </label>
                         <label class="weui-cell weui-check__label" for="a2">

                             <div class="weui-cell__bd">
                                 <p>阴性</p>
                             </div>
                             <div class="weui-cell__ft">
                                 <input type="radio" name="radio1" class="weui-check" id="a2" runat="server" onclick="an_s('B', 1)" />
                                 <span class="weui-icon-checked"></span>
                             </div>
                         </label>
                         <label class="weui-cell weui-check__label" for="a3">

                             <div class="weui-cell__bd">
                                 <p>未出结果</p>
                             </div>
                             <div class="weui-cell__ft">
                                 <input type="radio" name="radio1" class="weui-check" id="a3" runat="server" onclick="an_s('C', 1)" />
                                 <span class="weui-icon-checked"></span>
                             </div>
                         </label>
                         <label class="weui-cell weui-check__label" for="a4">

                             <div class="weui-cell__bd">
                                 <p>阳性</p>
                             </div>
                             <div class="weui-cell__ft">
                                 <input type="radio" name="radio1" class="weui-check" id="a4" runat="server" onclick="an_s('D', 1)" />
                                 <span class="weui-icon-checked"></span>
                             </div>
                         </label>
                     </div>

                     <div class="weui-cell  weui-cell_uploader">
                         <div class="weui-cell__bd">
                             <div class="weui-uploader">
                                 <div class="weui-uploader__hd">
                                     <p class="weui-uploader__title">核酸结果上传</p>
                                 </div>
                                 <div class="weui-uploader__bd">
                                     <ul class="weui-uploader__files" id="uploaderFiles1">
                                     </ul>
                                     <div class="weui-uploader__input-box">
                                         <input id="uploaderInput1" class="weui-uploader__input" type="file" accept="image/*" multiple />
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>

                     <div style="margin: 30px 0;">
                        <asp:Button ID="Button2" runat="server" Text="提交" CssClass="weui_btn weui_btn_primary" OnClick="Button2_Click" />
                        <input type="hidden" id="hidden_t1" name="bb" />
                    </div>

                </div>

            </div>
        </div>
        
        

    </div>
</div>
<script type="text/javascript">
    function aclick(strvalue) {
                document.getElementById('Hidden1').value = strvalue;
                document.getElementById('ImageButton1').click();
            }
    $(function(){
        var tmpl = '<li class="weui-uploader__file" style="background-image:url(#url#)"></li>', 
            $gallery = $("#gallery"),
            $galleryImg = $("#galleryImg"),
            $uploaderInput = $("#uploaderInput"),
            $uploaderFiles = $("#uploaderFiles") ;

        
        var tmpl1 = '<li class="weui-uploader__file" style="background-image:url(#url#)"></li>', 
            $gallery1 = $("#gallery1"),
            $galleryImg1 = $("#galleryImg1"),
            $uploaderInput1 = $("#uploaderInput1"),
            $uploaderFiles1 = $("#uploaderFiles1");


        var tmpl2 = '<li class="weui-uploader__file" style="background-image:url(#url#)"></li>', 
            $gallery2 = $("#gallery2"),
            $galleryImg2 = $("#galleryImg2"),
            $uploaderInput2 = $("#uploaderInput2"),
            $uploaderFiles2 = $("#uploaderFiles2")  ;

        $uploaderInput.on("change", function(e){
            var src,b_src, url = window.URL || window.webkitURL || window.mozURL, files = e.target.files;
            for (var i = 0, len = files.length; i < len; ++i) {
                var file = files[i];

                if (url) {
                    src = url.createObjectURL(file);
                } else {
                    src = e.target.result;
                }

                var image = new Image(); 
                image.src = src; 
                if (src) {
                    image.onload = function () {
                        var canvas = document.createElement("canvas");
                        canvas.width = image.width*0.3;
                        canvas.height = image.height*0.3;

                        var ctx = canvas.getContext("2d");
                        ctx.drawImage(image, 0, 0, canvas.width, canvas.height);
                        var dataURL = canvas.toDataURL('image/png', 1);

                        aa(dataURL );
                    }

                } 

                $("#uploaderFiles").empty();
                $uploaderFiles.append($(tmpl.replace('#url#', src)));
                
            }
        });
        $uploaderFiles.on("click", "li", function(){
            $galleryImg.attr("style", this.getAttribute("style"));
            $gallery.fadeIn(100);
        });
        $gallery.on("click", function(){
            $gallery.fadeOut(100);
        });
         function aa(dataURL) {
                    $.ajax({
                        url: "Gzfy_Greencode.aspx/KongJian",//后台给你提供的接口
                        type: "Post",
                        data: "{ 'c_image': '" + dataURL + "','staffid':'" + $("#Hidden2").val() + "'}",
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {

                        }
                    });

        };


        
        $uploaderInput1.on("change", function(e){
            var src,b_src, url = window.URL || window.webkitURL || window.mozURL, files = e.target.files;
            for (var i = 0, len = files.length; i < len; ++i) {
                var file = files[i];

                if (url) {
                    src = url.createObjectURL(file);
                } else {
                    src = e.target.result;
                }

                var image = new Image(); 
                image.src = src; 
                if (src) {
                    image.onload = function () {
                        var canvas = document.createElement("canvas");
                        canvas.width = image.width*0.3;
                        canvas.height = image.height*0.3;

                        var ctx = canvas.getContext("2d");
                        ctx.drawImage(image, 0, 0, canvas.width, canvas.height);
                        var dataURL = canvas.toDataURL('image/png', 1);

                        bb(dataURL );
                    }

                } 

                $("#uploaderFiles1").empty();
                $uploaderFiles1.append($(tmpl1.replace('#url#', src)));
                
            }
        });
        $uploaderFiles1.on("click", "li", function(){
            $galleryImg1.attr("style", this.getAttribute("style"));
            $gallery1.fadeIn(100);
        });
        $gallery1.on("click", function(){
            $gallery1.fadeOut(100);
        });
         function bb(dataURL) {
                    $.ajax({
                        url: "Gzfy_Greencode.aspx/HeSuan",//后台给你提供的接口
                        type: "Post",
                        data: "{ 'c_image': '" + dataURL + "','staffid':'" +$("#Hidden2").val()  + "'}",
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {

                        }
                    });

        };


       $uploaderInput2.on("change", function(e){
            var src,b_src, url = window.URL || window.webkitURL || window.mozURL, files = e.target.files;
            for (var i = 0, len = files.length; i < len; ++i) {
                var file = files[i];

                if (url) {
                    src = url.createObjectURL(file);
                } else {
                    src = e.target.result;
                }

                var image = new Image(); 
                image.src = src; 
                if (src) {
                    image.onload = function () {
                        var canvas = document.createElement("canvas");
                        canvas.width = image.width*0.3;
                        canvas.height = image.height*0.3;

                        var ctx = canvas.getContext("2d");
                        ctx.drawImage(image, 0, 0, canvas.width, canvas.height);
                        var dataURL = canvas.toDataURL('image/png',1);

                       cc(dataURL );
                    }

                } 

                $("#uploaderFiles2").empty();
                $uploaderFiles2.append($(tmpl2.replace('#url#', src)));
                
            }
        });
        $uploaderFiles2.on("click", "li", function(){
            $galleryImg2.attr("style", this.getAttribute("style"));
            $gallery2.fadeIn(100);
        });
        $gallery2.on("click", function(){
            $gallery2.fadeOut(100);
        });
         function cc(dataURL) {
                    $.ajax({
                        url: "Gzfy_Greencode.aspx/XingCheng",//后台给你提供的接口
                        type: "Post",
                        data: "{ 'c_image': '" + dataURL + "','staffid':'" + $("#Hidden2").val() + "'}",
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {

                        }
                    });

        };
     
    }); 
    
     

</script>



    <asp:Label ID="datenow" runat="server" Text="Label" Visible="false" ></asp:Label> 
    <asp:Label ID="staffid" runat="server" Text="Label" Visible="false" ></asp:Label>
 

 
        
    <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click"  style="display:none"/>
        <input id="Hidden2" type="hidden" runat="server" />
        <input id="Hidden1" type="hidden" runat="server" />
     </form>
</body>
</html>
