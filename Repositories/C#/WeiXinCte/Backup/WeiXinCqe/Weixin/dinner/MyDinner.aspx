<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyDinner.aspx.cs" Inherits="WeiXinCqe.MyDinner"  MaintainScrollPositionOnPostBack="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>我的预约</title>
   
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
    <asp:Label ID="olddate" runat="server" Visible="False"></asp:Label>    
    &nbsp;     
   <asp:LinkButton ID="Button_MyDinner" 
            runat="server" Font-Size="9pt" 
                        onclick="LinkButton_Click" ToolTip="继续预约就餐" 
                        Font-Bold="True">继续预约&gt;&gt;</asp:LinkButton>
    </span></strong>&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
      onrowdatabound="GridView1_RowDataBound" Width="100%">
      <Columns>
          <asp:BoundField DataField="WORK_DAY" HeaderText="出勤日期">
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle HorizontalAlign="Center" />
          </asp:BoundField>
          <asp:BoundField DataField="CLASSWORKTYPE" HeaderText="交替">
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle HorizontalAlign="Center" />
          </asp:BoundField>
          <asp:BoundField DataField="DINNER_TYPE" HeaderText="餐别">
          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          </asp:BoundField>
          <asp:BoundField DataField="DINNER_SMALL_TYPE" HeaderText="小餐别">
          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          </asp:BoundField>
          <asp:BoundField DataField="BEGIN_TIME" HeaderText="就餐开始时间">
          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          </asp:BoundField>
          <asp:BoundField DataField="END_TIME" HeaderText="就餐结束时间">
          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          </asp:BoundField>
          <asp:BoundField DataField="STATUS" HeaderText="状态">
          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          </asp:BoundField>
          <asp:TemplateField HeaderText="操作">
              <ItemTemplate>
                  <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="删除"  CssClass="weui_btn weui_btn_mini weui_btn_primary"/>
              </ItemTemplate>
              <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          </asp:TemplateField>
          <asp:TemplateField Visible="False">
              <ItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="SYSID" HeaderText="SYSID" />
          <asp:BoundField DataField="FLAG" HeaderText="FLAG" />
          <asp:BoundField DataField="ISLOCK" HeaderText="ISLOCK" />
      </Columns>
        <EmptyDataRowStyle Font-Bold="True" ForeColor="#33CC33" />
      <HeaderStyle Font-Bold="True" Font-Size="12pt" ForeColor="Gray" />
  </asp:GridView>
    
        
    
        </div>


</div>
 
</div>
    </form>
</body>
</html>
