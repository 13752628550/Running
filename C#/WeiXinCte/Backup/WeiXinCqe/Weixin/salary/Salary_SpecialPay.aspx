﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary_SpecialPay.aspx.cs" Inherits="WeiXinCqe.Salary_SpecialPay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>特殊补贴明细</title>
    <link rel="stylesheet" href="~/style/weui.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="label_newstaffid" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_month" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_type" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_overtime_pay" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_yyyy" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_work_8" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_work_9" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_work_10" runat="server" Visible="False"></asp:Label>  
    <asp:Label ID="label_vto" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label15" runat="server" Visible="False"></asp:Label>
    <div class="weui_cells weui_cells_form">
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="labled" runat="server" Text="特殊补贴明细"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人工资页面">返回>></asp:LinkButton>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label42" runat="server" class="weui_label" Font-Size="12pt">人员类别:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_TYPE2" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>

        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label7" runat="server" class="weui_label" Font-Size="12pt">部门:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                  <asp:Label ID="label_topdeptname" runat="server" ></asp:Label>
                    <asp:Label ID="label_TECH_POST" runat="server" Text="0" Visible="False"></asp:Label>
                </strong>
            </div>
        </div>

        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label8" runat="server" class="weui_label" Font-Size="12pt">特殊补贴标准:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_TECH_PAY_OLD" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label4" runat="server" class="weui_label" Font-Size="12pt">实发特殊补贴:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_TECH_PAY" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cells_title"   id="div1" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label11" runat="server"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
        </div>    
        <div class="weui_cells_title"   id="div2" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label_GongShi" runat="server"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title"   id="div3" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label_JieGuo" runat="server"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title">
        </div>
    </div>
    </form>
</body>
</html>
