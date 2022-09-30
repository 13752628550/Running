<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance_TimeoffInfo.aspx.cs"
    Inherits="WeiXinCqe.Attendance_TimeoffInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>欠勤明细</title>
    <link rel="stylesheet" href="~/style/weui.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="label_newstaffid" runat="server" Visible="False"></asp:Label>
    <div class="weui_cells weui_cells_form">
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="labled" runat="server" Text="欠勤明细"></asp:Label></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人考勤页面">返回>></asp:LinkButton>
        </div>
        <div class="weui_cells_title" id="labletitle" runat="server">
            <strong>
                <asp:Label ID="label_error" runat="server" Text=""></asp:Label></strong>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    工号:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_staffid" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    姓名:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_StaffName" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    欠勤类别:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_topdeptname" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
              <asp:Label ID="label_begin" class="weui_label" runat="server" Text="开始日期"></asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_deptname" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
     <asp:Label ID="label_end" class="weui_label" runat="server" Text="结束日期"></asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_jiaotileibie" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell" id="labeldiv" runat ="server">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    欠勤天数:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_jiaoti" runat="server"></asp:Label></strong></div>
        </div>
    </div>
    </form>
</body>
</html>
