<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary_SbOut.aspx.cs" Inherits="WeiXinCqe.Salary_SbOut" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>社保明细</title>
    <link rel="stylesheet" href="~/style/weui.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="label_newstaffid" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_month" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_type" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_overtime_pay" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_stafftype" runat="server" Visible="False"></asp:Label>
    <div class="weui_cells weui_cells_form">
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="labled" runat="server" Text="个人社保明细"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人工资页面">返回>></asp:LinkButton>
        </div>
        <div class="weui_cells_title" id="labletitle" runat="server">
            <strong>
                <asp:Label ID="label_error" runat="server" Text=""></asp:Label></strong>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <asp:Label ID="labelADJUSTMENT_PAY1" runat="server" class="weui_label" Font-Size="12pt">社保基数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ADJUSTMENT_PAY1" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <asp:Label ID="labelADJUSTMENT_PAY2" runat="server" class="weui_label" Font-Size="12pt">个人养老:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ADJUSTMENT_PAY2" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <asp:Label ID="labelADJUSTMENT_PAY3" runat="server" class="weui_label" Font-Size="12pt">个人医疗:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ADJUSTMENT_PAY3" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <asp:Label ID="labelADJUSTMENT_PAY4" runat="server" class="weui_label" Font-Size="12pt">个人失业:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ADJUSTMENT_PAY4" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <asp:Label ID="labelADJUSTMENT_PAY5" runat="server" class="weui_label" Font-Size="12pt">个人工伤:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ADJUSTMENT_PAY5" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <asp:Label ID="labelADJUSTMENT_PAY6" runat="server" class="weui_label" Font-Size="12pt">个人生育:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ADJUSTMENT_PAY6" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>

        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <asp:Label ID="labelADJUSTMENT_PAY" runat="server" class="weui_label" Font-Size="12pt"
                    Font-Bold="True" ForeColor="#33CC33">保险合计:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ADJUSTMENT_PAY" runat="server" Text="0" ForeColor="#33CC33"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cells_title" id="H" runat="server">
            <strong>
                <asp:Label ID="Label2" runat="server" Style="color: #33CC33">说明:调整由人事导入</asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
    </div>
    </form>
</body>
</html>
