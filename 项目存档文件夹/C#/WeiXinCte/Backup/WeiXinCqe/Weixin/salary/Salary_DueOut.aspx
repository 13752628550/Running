<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary_DueOut.aspx.cs" Inherits="WeiXinCqe.Salary_DueOut" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>工会会费明细</title>
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
                <asp:Label ID="labled" runat="server" Text="工会会费明细"></asp:Label></strong>  &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人工资页面">返回>></asp:LinkButton>
        </div>
                <div class="weui_cells_title" id="labletitle" runat="server">
            <strong>
                <asp:Label ID="label_error" runat="server" Text=""></asp:Label></strong>
        </div>
                                                    <div class="weui_cell" 
                 >
            <div class="weui_cell_hd">
                <asp:Label ID="label42" runat="server" class="weui_label" Font-Size="12pt">初次职能给:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_COMPETENCY_PAY" runat="server" Text="0"></asp:Label>
                   </strong>
            </div>
                         </div>
                                            <div class="weui_cell" 
                >
            <div class="weui_cell_hd">
                <asp:Label ID="label1" runat="server" class="weui_label" Font-Size="12pt">实扣会费:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_DUE_OUT" runat="server" ></asp:Label>
                   </strong>
            </div>
                         </div>
                                 <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label_GongShi" runat="server" Text="计算公式=初次职能给×3÷1000"></asp:Label></strong>  &nbsp;&nbsp;&nbsp;

        </div>
                             <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label_JieGuo" runat="server" Text="应该扣会费:"></asp:Label></strong>  &nbsp;&nbsp;&nbsp;

        </div>
                        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label2" runat="server" style="color: #33CC33"></asp:Label></strong>  &nbsp;&nbsp;&nbsp;

        </div>
    </div>
    </form>
</body>
</html>

