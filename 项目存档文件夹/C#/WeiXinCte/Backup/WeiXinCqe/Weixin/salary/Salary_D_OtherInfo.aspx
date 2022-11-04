<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary_D_OtherInfo.aspx.cs" Inherits="WeiXinCqe.Weixin.salary.Salary_D_OtherInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>短期工其他明细</title>
    <link rel="stylesheet" href="~/style/weui.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="label_newstaffid" runat="server" Visible="False"></asp:Label>
      <asp:Label ID="label_month" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="label_type" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="label_unit" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="labelti" runat="server" Visible="False"></asp:Label>
    <div class="weui_cells weui_cells_form">
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="labled" runat="server" Text="其他明细"></asp:Label></strong>  &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人考勤页面">返回>></asp:LinkButton>
        </div>
        <div class="weui_cells_title" id="labletitle" runat="server">
            <strong>
                <asp:Label ID="label_error" runat="server" Text=""></asp:Label></strong>
        </div>
       <div class="weui_cells_title">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%"
                OnRowDataBound="GridView2_RowDataBound" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="RECORDDATE" HeaderText="出勤日期">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CLASSWORKTYPE" HeaderText="出勤状况">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DUTYSTATUS" HeaderText="欠勤类别">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                                     <asp:BoundField DataField="OVERTIMELEN" HeaderText="加班" Visible="False">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" ForeColor="#33CC33" />
                <FooterStyle Font-Bold="True" ForeColor="#33CC33" HorizontalAlign="Right" VerticalAlign="Middle" />
                <HeaderStyle Font-Bold="True" Font-Size="12pt" ForeColor="Gray" />
            </asp:GridView>
            <asp:Label ID="label_off_duty" runat="server" Text=""
                    Style="color: #33CCFF; font-weight: 700;"></asp:Label>
        </div>
         <div class="weui_cells_title">
            <strong>
                <asp:Label ID="label_MEMO" runat="server" Text=""
                    Style="color: #33CC33"></asp:Label></strong>
        </div>
    </div>
    </form>
</body>
</html>
