<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BaseInfo_Nj.aspx.cs" Inherits="WeiXinCqe.Weixin.baseinfo.BaseInfo_Nj" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>已休年假</title>
   
    <link rel="stylesheet" href="~/style/weui.css"/>

    <style type="text/css">
        .style1
        {
            font-size: 14pt;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

<div>
    <div class="weui_cells weui_cells_form">
<div class="weui_cells_title"><strong>
    <asp:Label ID="Labelname" runat="server" Text="" CssClass="style1"></asp:Label>
    <span class="style1"><asp:Label ID="label_staffid" runat="server" 
        Visible="False"></asp:Label>
    <asp:Label ID="label_newstaffid" runat="server" Visible="False"></asp:Label>     
    &nbsp;&nbsp;<asp:Label ID="deviceid" runat="server" Visible="False"></asp:Label>     
    &nbsp;&nbsp;     
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" 
        onclick="LinkButton1_Click" ToolTip="返回基本信息页面">返回&gt;&gt;</asp:LinkButton>
    </span></strong>&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
      onrowdatabound="GridView1_RowDataBound" Width="100%" ShowFooter="True">
      <Columns>
          <asp:BoundField DataField="BEGIN_DATE" HeaderText="开始日期">
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle HorizontalAlign="Center" />
          </asp:BoundField>
          <asp:BoundField DataField="END_DATE" HeaderText="结束日期">
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle HorizontalAlign="Center" />
          </asp:BoundField>
          <asp:BoundField DataField="LEN" HeaderText="天数">
          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          </asp:BoundField>
      </Columns>
        <EmptyDataRowStyle Font-Bold="True" ForeColor="#33CC33" />
        <FooterStyle Font-Bold="True" ForeColor="#33CC33" HorizontalAlign="Right" 
            VerticalAlign="Middle" />
      <HeaderStyle Font-Bold="True" Font-Size="12pt" ForeColor="Gray" />
  </asp:GridView>
    
        
    
        </div>


</div>
 
</div>
    </form>
</body>
</html>
