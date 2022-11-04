<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary_GjjOut.aspx.cs" Inherits="WeiXinCqe.Salary_GjjOut" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>公积金明细</title>
    <link rel="stylesheet" href="~/style/weui.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="label_newstaffid" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_month" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_type" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_overtime_pay" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_stafftype" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="label_begin_date" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_end_date" runat="server" Visible="False"></asp:Label>
    <div class="weui_cells weui_cells_form">
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="labled" runat="server" Text="公积金明细"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人工资页面">返回>></asp:LinkButton>
        </div>
        <div class="weui_cells_title" id="labletitle" runat="server">
            <strong>
                <asp:Label ID="label_error" runat="server" Text=""></asp:Label></strong>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <asp:Label ID="labelADJUSTMENT_PAY1" runat="server" class="weui_label" Font-Size="12pt">公积金基数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ADJUSTMENT_PAY1" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <asp:Label ID="labelADJUSTMENT_PAY2" runat="server" class="weui_label" Font-Size="12pt">个人公积金:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ADJUSTMENT_PAY2" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <asp:Label ID="labelADJUSTMENT_PAY3" runat="server" class="weui_label" Font-Size="12pt">入社日期:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ADJUSTMENT_PAY3" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <asp:Label ID="labelADJUSTMENT_PAY4" runat="server" class="weui_label" Font-Size="12pt">离职日期:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ADJUSTMENT_PAY4" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>        
 
        <div class="weui_cells_title" id="H" runat="server">
            <strong>
                <asp:Label ID="Label2" runat="server" Style="color: #33CC33"></asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title" id="P" runat="server">
            <strong>
                <asp:Label ID="Label1" runat="server" Style="color: #33CC33"></asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <asp:Label ID="label5" runat="server" class="weui_label" Font-Size="12pt">广义出勤天数:</asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_V_ON_DUTY" runat="server" Text="0"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <asp:Label ID="label7" runat="server" class="weui_label" Font-Size="12pt">应出勤天数:</asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_V_SUM_DUTY" runat="server" Text="0"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd ">
                    <asp:Label ID="label9" runat="server" class="weui_label" Font-Size="12pt">出勤率:</asp:Label></div>
                <div class="weui_cell_bd  weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_Rate" runat="server" Text="0"></asp:Label>
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
                    <asp:Label ID="Label3" runat="server" Text="应出勤天数=出勤+欠勤+公假+产假+工伤假+病假+一时归休"></asp:Label></strong>
                &nbsp;&nbsp;&nbsp;
            </div>
                        <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="Label4" runat="server" Text="广义出勤天数=出勤+公假+工伤假+一时归休"></asp:Label></strong>
                &nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </div>
    </form>
</body>
</html>
