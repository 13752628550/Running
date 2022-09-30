<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary_D_TaxOut.aspx.cs" Inherits="WeiXinCqe.Weixin.salary.Salary_D_TaxOut" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>个税明细</title>
    <link rel="stylesheet" href="~/style/weui.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="label_newstaffid" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_month" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_type" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="label_overtime_pay" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="label_yyyy" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="label_vlevel" runat="server" Visible="False"></asp:Label>
                             <asp:Label ID="label_vrate" runat="server" Visible="False"></asp:Label>
                                   <asp:Label ID="label_vsub" runat="server" Visible="False"></asp:Label>
                                         <asp:Label ID="label_vfrom" runat="server" Visible="False"></asp:Label>
                                          <asp:Label ID="label_vto" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="label15" runat="server" Visible="False"></asp:Label>
    <div class="weui_cells weui_cells_form">
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="labled" runat="server" Text="个税明细"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人工资页面">返回>></asp:LinkButton>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label42" runat="server" class="weui_label" Font-Size="12pt">应税总额:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_V_Season_Pay" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label5" runat="server" class="weui_label" Font-Size="12pt">工资应税额:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_V_ON_DUTY" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label7" runat="server" class="weui_label" Font-Size="12pt">公积金交税线:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_V_SUM_DUTY" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd " >
                <asp:Label ID="label9" runat="server" class="weui_label" Font-Size="12pt">公积金:</asp:Label></div>
            <div class="weui_cell_bd  weui_cell_primary">
                <strong>
                    <asp:Label ID="label_Rate" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                      <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label8" runat="server" class="weui_label" Font-Size="12pt">公积金应税额:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label10" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>

        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label4" runat="server" class="weui_label" Font-Size="12pt">个税免征额:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_Season_PAY" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label14" runat="server" class="weui_label" Font-Size="12pt">应税所得:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label16" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label3" runat="server" class="weui_label" Font-Size="12pt">个人所得税:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label6" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label11" runat="server"></asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
                      <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label12" runat="server"></asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
                        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label13" runat="server"></asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
                         <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label17" runat="server"></asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label_GongShi" runat="server"></asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
      
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label_JieGuo" runat="server"></asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
         <div class="weui_cells_title">
                       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                           Width="100%" ShowFooter="false">
                <Columns>
                    <asp:BoundField DataField="BLEVEL" HeaderText="级数">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="RATE" HeaderText="税率">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                          <asp:BoundField DataField="SUBTRACT" HeaderText="速扣数">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                          <asp:BoundField DataField="CFROM" HeaderText="级距下限">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                          <asp:BoundField DataField="CTO" HeaderText="级距上限">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" ForeColor="#33CC33" />
                <FooterStyle Font-Bold="True" ForeColor="#33CC33" HorizontalAlign="Right" VerticalAlign="Middle" />
                <HeaderStyle Font-Bold="True" Font-Size="12pt" ForeColor="Gray" />
            </asp:GridView>        </div>
    </div>
    </form>
</body>
</html>
