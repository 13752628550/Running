<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WeiXinCqe.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <%--<title>错误界面</title>--%>
    <title>欢迎界面</title>
    <link rel="stylesheet" href="~/style/weui.css"/>

</head>
<body>
    <form id="form1" runat="server">
<div class="weui_msg">
    <div class="weui_icon_area"><i class="weui_icon_success  weui_icon_msg"></i></div>
    <%--<div class="weui_icon_area"><i class="weui_icon_warn weui_icon_msg"></i></div>--%>
    <div class="weui_text_area">
        <h2 class="weui_msg_title"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h2>
        <p class="weui_msg_desc"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></p>
      
    
    </div>

</div>
    </form>
    <div style="text-align:center;">
        <a href="style2/image/mitsumi.com.cn.png" target="_blank"> 
            www.mitsumi.com.cn
        </a>
        <a href="http://beian.miit.gov.cn" target="_blank">鲁ICP备16010727号</a>
        <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=37021002000123" target="_blank">
            <img src="style2/image/beian1.png" alt="Open in a new window" /> 公安备案号 37021002000123 
        </a>
    </div>
</body>
</html>
