<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary_HBonusPay.aspx.cs" Inherits="WeiXinCqe.Salary_HBonusPay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>奖金明细</title>
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
                <asp:Label ID="labled" runat="server" Text="奖金明细"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人工资页面">返回>></asp:LinkButton>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label42" runat="server" class="weui_label" Font-Size="12pt">人员类别1:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_TYPE1" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label3" runat="server" class="weui_label" Font-Size="12pt">人员类别2:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_TYPE2" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label5" runat="server" class="weui_label" Font-Size="12pt">工资基数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_BASE_PAY_JS" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label7" runat="server" class="weui_label" Font-Size="12pt">考课:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_EVALUATE" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label9" runat="server" class="weui_label" Font-Size="12pt">考课系数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_EVALUATE_FACTOR" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label12" runat="server" class="weui_label" Font-Size="12pt">大过标准:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_V_BIG" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label14" runat="server" class="weui_label" Font-Size="12pt">大过次数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_BIG_PUNISHMENT" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label17" runat="server" class="weui_label" Font-Size="12pt">小过标准:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_V_SMALL" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label19" runat="server" class="weui_label" Font-Size="12pt">小过次数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_SMALL_PUNISHMENT" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label46" runat="server" class="weui_label" Font-Size="12pt">记过扣除额:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_PUNISHMENT_OUT" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label21" runat="server" class="weui_label" Font-Size="12pt">广义出勤天数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_V_ON_DUTY" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label23" runat="server" class="weui_label" Font-Size="12pt">应出勤天数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_V_SUM_DUTY" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label25" runat="server" class="weui_label" Font-Size="12pt">出勤率:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ATTENDANCE_RATE" runat="server" Visible="false"></asp:Label><asp:Label
                        ID="label_ATTENDANCE_RATE_100" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label27" runat="server" class="weui_label" Font-Size="12pt">出勤率系数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ATTENDANCE_FACTOR" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label1" runat="server" class="weui_label" Font-Size="12pt">迟早一次数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_LATE1" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label29" runat="server" class="weui_label" Font-Size="12pt">迟早一标准:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_V_LATE1" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label31" runat="server" class="weui_label" Font-Size="12pt">迟早二次数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_LATE2" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label33" runat="server" class="weui_label" Font-Size="12pt">迟早二标准:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_V_LATE2" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label35" runat="server" class="weui_label" Font-Size="12pt">迟早三次数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_LATE3" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label37" runat="server" class="weui_label" Font-Size="12pt">迟早额:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_LATE_OUT" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label39" runat="server" class="weui_label" Font-Size="12pt">上月实际奖金:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_LAST_BONUS_FACT" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label41" runat="server" class="weui_label" Font-Size="12pt">本月实际奖金:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_CURR_BONUS_FACT" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label44" runat="server" class="weui_label" Font-Size="12pt">本月发放奖金:</asp:Label>
            </div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_BONUS_PAY" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cells_title" id="div8" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label16" runat="server">     </asp:Label></strong>
        </div>
        <div class="weui_cells_title" id="div2" runat="server" visible="true">
            <strong>
                <asp:Label ID="Label2" runat="server">     </asp:Label></strong>
        </div>
                 <div class="weui_cells_title" id="div9" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label18" runat="server">     </asp:Label></strong>
        </div>
        <div class="weui_cells_title" id="div3" runat="server" visible="true">
            <strong>
                <asp:Label ID="Label4" runat="server">     </asp:Label></strong>
        </div>
        <div class="weui_cells_title" id="div4" runat="server" visible="true">
            <strong>
                <asp:Label ID="Label6" runat="server">     </asp:Label></strong>
        </div>
        <div class="weui_cells_title" id="div5" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label8" runat="server">     </asp:Label></strong>
        </div>
        <div class="weui_cells_title" id="div6" runat="server" visible="true">
            <strong>
                <asp:Label ID="Label10" runat="server">     </asp:Label></strong>
        </div>
        <div class="weui_cells_title" id="div7" runat="server" visible="true">
            <strong>
                <asp:Label ID="Label13" runat="server">     </asp:Label></strong>
        </div>
                 <div class="weui_cells_title">
                       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                           Width="100%" ShowFooter="false">
                <Columns>
                    <asp:BoundField DataField="EVALUATE" HeaderText="考课">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EVALUATE_FACTOR" HeaderText="考课系数">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" ForeColor="#33CC33" />
                <FooterStyle Font-Bold="True" ForeColor="#33CC33" HorizontalAlign="Right" VerticalAlign="Middle" />
                <HeaderStyle Font-Bold="True" Font-Size="9pt" ForeColor="Gray" />
            </asp:GridView>        </div>
                       <div class="weui_cells_title">
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                           Width="100%" ShowFooter="false">
                <Columns>          
                    <asp:BoundField DataField="ATTENDANCE_FROM" HeaderText="出勤率下限">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                               <asp:BoundField DataField="ATTENDANCE_TO" HeaderText="出勤率上限(不含)">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                              <asp:BoundField DataField="ATTENDANCE_FACTOR" HeaderText="出勤率系数">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" ForeColor="#33CC33" />
                <FooterStyle Font-Bold="True" ForeColor="#33CC33" HorizontalAlign="Right" VerticalAlign="Middle" />
                <HeaderStyle Font-Bold="True" Font-Size="9pt" ForeColor="Gray" />
            </asp:GridView>        </div>
        <div class="weui_cells_title" id="div1" runat="server" visible="true">
            <strong>
                <asp:Label ID="Label11" runat="server">特别说明: 应出勤天数=出勤+欠勤+公假+产假+工伤假+病假+一时归休  &nbsp;&nbsp;&nbsp;   &nbsp;        广义出勤天数=出勤+公假+工伤假+一时归休         &nbsp;  &nbsp;&nbsp;&nbsp; 大过或小过处分的自动修改考课为C  &nbsp;&nbsp;&nbsp;&nbsp;   出勤率达不到5/6的职工,最高只能评为B</asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
    </div>
    </form>
</body>
</html>
