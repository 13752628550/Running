<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WeiXinCqe.Weixin.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>卡操作</title>
    <link rel="stylesheet" href="~/style/weui.css" />
    <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
            <div class="weui_cells weui_cells_form" id="divnianji" runat="server">
            <div class="weui_cell weui_cell_switch">
                <div class="weui_cell_hd weui_cell_primary">
                    身份证挂失</div>
                <div class="weui_cell_ft">
                    <input class="weui_switch" type="checkbox" id="ii" runat="server" onchange="switchclick()" />
                </div>
            </div>
            <strong>
                <asp:Label ID="Label4" runat="server" Text="" ForeColor="#33CC33"></asp:Label></strong>
        </div>
                <div class="weui_cells weui_cells_form" id="div1" runat="server">
            <div class="weui_cell weui_cell_switch">
                <div class="weui_cell_hd weui_cell_primary">
                    IC卡挂失</div>
                <div class="weui_cell_ft">
                    <input class="weui_switch" type="checkbox" id="Checkbox1" runat="server" onchange="switchclick()" />
                </div>
            </div>
            <strong>
                <asp:Label ID="Label1" runat="server" Text="" ForeColor="#33CC33"></asp:Label></strong>
        </div>
    </div>
    </form>
</body>
</html>
