<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary_OvertimePay.aspx.cs" Inherits="WeiXinCqe.Salary_OvertimePay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>加班费用明细</title>
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
                <asp:Label ID="labled" runat="server" Text="加班费用"></asp:Label></strong>  &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人工资页面">返回>></asp:LinkButton>
        </div>
                                                    <div class="weui_cell" 
                 >
            <div class="weui_cell_hd">
                <asp:Label ID="label42" runat="server" class="weui_label" Font-Size="12pt">加班小时:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OVERTIME1" runat="server" Text="0"></asp:Label>
                   </strong>
            </div>
                         </div>
                                            <div class="weui_cell" 
                >
            <div class="weui_cell_hd">
                <asp:Label ID="label1" runat="server" class="weui_label" Font-Size="12pt">工资基数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_BASE_PAY_JS" runat="server" ></asp:Label>
                   </strong>
            </div>
                         </div>
                                                                     <div class="weui_cell" 
                >
            <div class="weui_cell_hd">
                <asp:Label ID="label2" runat="server" class="weui_label" Font-Size="12pt">实得加班费:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_O_P" runat="server" ></asp:Label>
                   </strong>
            </div>
                         </div>
                                 <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label_GongShi" runat="server" Text="计算公式"></asp:Label></strong>  &nbsp;&nbsp;&nbsp;

        </div>
                             <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label_JieGuo" runat="server" Text="计算结果:"></asp:Label></strong>  &nbsp;&nbsp;&nbsp;

        </div>
    </div>
    </form>
</body>
</html>

