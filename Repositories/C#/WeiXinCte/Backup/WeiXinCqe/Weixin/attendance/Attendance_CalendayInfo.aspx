<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance_CalendayInfo.aspx.cs"
    Inherits="WeiXinCqe.Weixin.Attendance_CalendayInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>个人日历明细</title>
    <link rel="stylesheet" href="~/style/weui.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="label_newstaffid" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_yyyymmdd" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_month" runat="server" Visible="False"></asp:Label>
    <div class="weui_cells weui_cells_form">
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Labeltitle" runat="server" Text="2016-07-20出勤情况" Style="font-size: large"></asp:Label></strong>&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人考勤页面">返回>></asp:LinkButton></div>
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="label_error" runat="server" Text="基本信息"></asp:Label></strong>
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
                    部门:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_topdeptname" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    班号:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_deptname" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label6" runat="server" Text="班次信息"></asp:Label></strong>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    交替类别:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_jiaotileibie" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    交替:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_jiaoti" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    班次出勤:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_chuqin" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    加班类别:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_jiabanleibie" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label11" runat="server" Text="欠勤状况"></asp:Label></strong>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    欠勤记录:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_qianqin" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label13" runat="server" Text="打卡信息"></asp:Label></strong>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    上班打卡:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_shangbandaka" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    下班打卡:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_xiabandaka" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    工作开始:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_gongzuokaishi" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    工作结束:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_gongzuojieshu" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    加班申请:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_jiabanshenqing" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    加班实绩:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_jiabanshiji" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    工作小时:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_gongzuoxiaoshi" runat="server"></asp:Label></strong></div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <label class="weui_label">
                    休息分钟:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_xiuxifenzhong" runat="server"></asp:Label></strong></div>
        </div>
    </div>
    </form>
</body>
</html>
