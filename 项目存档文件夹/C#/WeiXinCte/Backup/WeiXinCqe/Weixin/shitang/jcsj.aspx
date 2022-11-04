<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jcsj.aspx.cs" Inherits="WeiXinCqe.jcsj" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>就餐时间</title>
    <link rel="stylesheet" href="~/style/weui.css" />
    <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        #dd
        {
            width: 121px;
            font-weight: 700;
            color: #808080;
        }
        .style3
        {
            color: #33CC33;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="weui_cells weui_cells_form">
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="labled" runat="server" Text="就餐时间区间" Font-Size="14pt"></asp:Label></strong>
                &nbsp;&nbsp;&nbsp;
            </div>
            <div class="weui_cell" style="color: Gray">
       
                    <asp:Label ID="label42" runat="server" class="weui_label" Font-Size="12pt" 
                        Font-Bold="True" ForeColor="Gray">早餐:</asp:Label>
                   <asp:TextBox ID="TextBox_Zao_BeginTime" runat="server" Width="50px" 
                        Height="22px" Font-Bold="True" ForeColor="Gray" ReadOnly="True" ></asp:TextBox>~<asp:TextBox 
                        ID="TextBox_Zao_EndTime" runat="server" 
                        Width="50px" Height="22px" Font-Bold="True" ForeColor="#33CC33" onfocus="javascript:this.select()"></asp:TextBox>

       
            </div>
                        <div class="weui_cell" style="color: Gray">
                    <asp:Label ID="label1" runat="server" class="weui_label" Font-Size="12pt" 
                                Font-Bold="True" ForeColor="Gray">午餐:</asp:Label>
                   <asp:TextBox ID="TextBox_Wu_BeginTime" runat="server" Width="50px" 
                        Height="22px" Font-Bold="True" ForeColor="Gray" ReadOnly="True" ></asp:TextBox>~<asp:TextBox 
                                ID="TextBox_Wu_EndTime" runat="server" 
                        Width="50px" Height="22px" Font-Bold="True" ForeColor="Gray" ReadOnly="True" ></asp:TextBox>
       
            </div>
                        <div class="weui_cell" style="color: Gray">
                    <asp:Label ID="label2" runat="server" class="weui_label" Font-Size="12pt" 
                                Font-Bold="True" ForeColor="Gray">晚餐:</asp:Label>
                   <asp:TextBox ID="TextBox_Wan_BeginTime" runat="server" Width="50px" 
                        Height="22px" Font-Bold="True" ForeColor="Gray" ReadOnly="True" ></asp:TextBox>~<asp:TextBox 
                                ID="TextBox_Wan_EndTime" runat="server" 
                        Width="50px" Height="22px" Font-Bold="True" ForeColor="Gray" ReadOnly="True" ></asp:TextBox>
       
            </div>
                        <div class="weui_cell" style="color: Gray">
                    <asp:Label ID="label3" runat="server" class="weui_label" Font-Size="12pt" 
                                Font-Bold="True" ForeColor="Gray">夜餐:</asp:Label>
                   <asp:TextBox ID="TextBox_Ye_BeginTime" runat="server" Width="50px" 
                        Height="22px" Font-Bold="True" ForeColor="Gray" ReadOnly="True" ></asp:TextBox>~<asp:TextBox 
                                ID="TextBox_Ye_EndTime" runat="server" 
                        Width="50px" Height="22px" Font-Bold="True" ForeColor="Gray" ReadOnly="True" ></asp:TextBox>
       
            </div>
              <asp:Button ID="Label_Button" runat="server" Text="保存" CssClass="weui_btn weui_btn_primary"
                ToolTip="保存修改的早餐区间" onclick="Label_Button_Click" />
        </div>
    </div>
    <asp:Label ID="staffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    </form>
</body>
</html>
