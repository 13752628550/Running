<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary_HousePay.aspx.cs"
    Inherits="WeiXinCqe.Salary_HousePay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>住宅补助明细</title>
    <link rel="stylesheet" href="~/style/weui.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="label_newstaffid" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_month" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_type" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_overtime_pay" runat="server" Visible="False"></asp:Label>
    <div class="weui_cells weui_cells_form">
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="labled" runat="server" Text="住宅补助明细"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人工资页面">返回>></asp:LinkButton>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label42" runat="server" class="weui_label" Font-Size="12pt">补助标准:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_V_HOUSE_PAY" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label2" runat="server" class="weui_label" Font-Size="12pt">住宅补助天数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_HOUSE_PAY_COUNT" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label3" runat="server" class="weui_label" Font-Size="12pt">应出勤天数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_V_SUM_DUTY" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label4" runat="server" class="weui_label" Font-Size="12pt">实得补助:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_HOUSE_PAY" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label_GongShi" runat="server" Text="计算公式"></asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label_JieGuo" runat="server" Text="计算结果:"></asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label1" runat="server" Style="color: #33CC33">说明:应出勤天数=出勤+欠勤+公假+产假+工伤假+病假+一时归休</asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
    </div>
    </form>
</body>
</html>
