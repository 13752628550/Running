<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RewardPunishment.aspx.cs" Inherits="WeiXinCqe.Weixin.rewardpunishment.RewardPunishment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>个人绩效</title>
    <link rel="stylesheet" href="/style/weui.css" />
    <script language="JAVASCRIPT">

        function aclick(strvalue) {
            document.getElementById('Hidden1').value = strvalue;
            document.getElementById('ImageButton1').click();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
 
        <input id="Hidden1" type="hidden" runat="server" />
        <div class="bd" style="height: 100%;">
            <div class="weui_tab">
                <div class="weui_navbar">
                    <div id="divlabel1" class="weui_navbar_item "  style="cursor:pointer" onclick="aclick('升格评定')" runat="server" >
                        <asp:Label ID="Label1" runat="server" Text="升格评定" ></asp:Label>
                    </div>
                    <div id="divlabel2" class="weui_navbar_item "  style="cursor:pointer"   onclick="aclick('奖金评定')" runat="server">
                        <asp:Label ID="Label2" runat="server" Text="奖金评定"></asp:Label>
                    </div>
                    <div id="divlabel3" class="weui_navbar_item" style="cursor:pointer"  onclick="aclick('奖励')" runat="server">
                        <asp:Label ID="Label3" runat="server" Text="奖励"></asp:Label>
                    </div>
                    <div id="divlabel4" class="weui_navbar_item" style="cursor:pointer"  onclick="aclick('惩罚')" runat="server">
                        <asp:Label ID="Label5" runat="server" Text="惩罚"></asp:Label>
                    </div>          
                </div>
                <div class="weui_tab_bd">
                </div>
            </div>
        </div>
        <div class="weui_cells_title">
            <strong>
               <asp:Label ID="Labeltitle" runat="server" Text="Label"></asp:Label></strong>
        </div>
        <div class="weui_cells weui_cells_form" id="divjiben" runat="server">
            <div class="weui_cells_title">
                          
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    Width="100%">
      <Columns>
          <asp:BoundField DataField="E_DATE" HeaderText="考核日期">
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle HorizontalAlign="Center" />
          </asp:BoundField>
          <asp:BoundField DataField="TOPDEPTNAME" HeaderText="部门">
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle HorizontalAlign="Center" />
          </asp:BoundField>
          <asp:BoundField DataField="EVALUATE" HeaderText="考核结果">
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
        <div class="weui_cells weui_cells_form" id="divgongzuo" runat="server">
                 <div class="weui_cells_title">
                          
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    Width="100%">
      <Columns>
          <asp:BoundField DataField="E_DATE" HeaderText="考核日期">
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle HorizontalAlign="Center" />
          </asp:BoundField>
          <asp:BoundField DataField="TOPDEPTNAME" HeaderText="部门">
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle HorizontalAlign="Center" />
          </asp:BoundField>
          <asp:BoundField DataField="EVALUATE" HeaderText="考核结果">
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
        <div class="weui_cells weui_cells_form" id="divlianluo" runat="server">
             <div class="weui_cells_title">
                          
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                    Width="100%">
      <Columns>
          <asp:BoundField DataField="EFFECTDATE" HeaderText="奖励日期">
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle HorizontalAlign="Center" />
          </asp:BoundField>
          <asp:BoundField DataField="TOPDEPTNAME" HeaderText="部门">
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle HorizontalAlign="Center" />
          </asp:BoundField>
          <asp:BoundField DataField="SMALLTYPE" HeaderText="奖励类别">
          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          </asp:BoundField>
                    <asp:BoundField DataField="REASON" HeaderText="奖励原因">
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
        <div class="weui_cells weui_cells_form" id="divnianji" runat="server">
           <div class="weui_cells_title">
                          
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                    Width="100%">
      <Columns>
          <asp:BoundField DataField="EFFECTDATE" HeaderText="惩罚日期">
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle HorizontalAlign="Center" />
          </asp:BoundField>
          <asp:BoundField DataField="TOPDEPTNAME" HeaderText="部门">
          <HeaderStyle HorizontalAlign="Center" />
          <ItemStyle HorizontalAlign="Center" />
          </asp:BoundField>
          <asp:BoundField DataField="SMALLTYPE" HeaderText="惩罚类别">
          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          </asp:BoundField>
                    <asp:BoundField DataField="REASON" HeaderText="惩罚原因">
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
        
         <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" 
            Height="0px" Width="0px" />
        <asp:Label ID="staffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="newstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="nowstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="chaoqi" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="deviceid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="staffname" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    </form>
</body>
</html>
