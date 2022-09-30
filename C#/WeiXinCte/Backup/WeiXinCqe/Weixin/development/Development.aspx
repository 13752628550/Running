<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Development.aspx.cs" Inherits="WeiXinCqe.Development" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>开发界面</title>
    <link rel="stylesheet" href="~/style/weui.css"/>

</head>
<body>
    <form id="form1" runat="server">
<div class="weui_msg">
    <div class="weui_icon_area"><i class="weui_icon_waiting_circle weui_icon_msg"></i></div>
    <div class="weui_text_area">
        <h2 class="weui_msg_title"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h2>
        <p class="weui_msg_desc"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></p>
      
    
    </div>

</div>
    </form>
</body>
</html>
