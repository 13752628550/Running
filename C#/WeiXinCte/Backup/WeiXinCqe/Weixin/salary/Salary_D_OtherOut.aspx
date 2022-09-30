<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary_D_OtherOut.aspx.cs" Inherits="WeiXinCqe.Weixin.salary.Salary_D_OtherOut" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>其他扣明细</title>
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
                <asp:Label ID="labled" runat="server" Text="其他扣明细"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人工资页面">返回>></asp:LinkButton>
        </div>
        <div class="weui_cells_title" id="labletitle" runat="server">
            <strong>
                <asp:Label ID="label_error" runat="server" Text=""></asp:Label></strong>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT1" runat="server" class="weui_label" Font-Size="12pt">其他扣1:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_OUT1" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT2" runat="server" class="weui_label" Font-Size="12pt">其他扣2:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_OUT2" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT3" runat="server" class="weui_label" Font-Size="12pt">其他扣3:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_OUT3" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT4" runat="server" class="weui_label" Font-Size="12pt">其他扣4:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_OUT4" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT5" runat="server" class="weui_label" Font-Size="12pt">其他扣5:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_OUT5" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT6" runat="server" class="weui_label" Font-Size="12pt">其他扣6:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_OUT6" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT7" runat="server" class="weui_label" Font-Size="12pt">其他扣7:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_OUT7" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT8" runat="server" class="weui_label" Font-Size="12pt">其他扣8:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_OUT8" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT9" runat="server" class="weui_label" Font-Size="12pt">其他扣9:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_OUT9" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT10" runat="server" class="weui_label" Font-Size="12pt">其他扣10:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_OUT10" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT" runat="server" class="weui_label" 
                    Font-Size="12pt" Font-Bold="True" ForeColor="#33CC33">扣除合计:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_OUT" runat="server" Text="0" ForeColor="#33CC33"></asp:Label>
                </strong>
            </div>
        </div>
<div class="weui_cells_title" id="P" runat="server">
            <strong>
                <asp:Label ID="Label1" runat="server" Style="color: #33CC33">说明:短期扣除计算公式如下，其他扣除项由人事导入</asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <asp:Label ID="label5" runat="server" class="weui_label" Font-Size="12pt">迟早一:</asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_LATE1" runat="server" Text="0"></asp:Label>
                    </strong>
                </div>
            </div>
                        <div class="weui_cell">
                <div class="weui_cell_hd">
                    <asp:Label ID="label2" runat="server" class="weui_label" Font-Size="12pt">迟早二:</asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_LATE2" runat="server" Text="0"></asp:Label>
                    </strong>
                </div>
            </div>
                        <div class="weui_cell">
                <div class="weui_cell_hd">
                    <asp:Label ID="label4" runat="server" class="weui_label" Font-Size="12pt">迟早三:</asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_LATE3" runat="server" Text="0"></asp:Label>
                    </strong>
                </div>
            </div>
                        <div class="weui_cell">
                <div class="weui_cell_hd">
                    <asp:Label ID="label8" runat="server" class="weui_label" Font-Size="12pt">小过:</asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_SMALL_PUNISHMENT" runat="server" Text="0"></asp:Label>
                    </strong>
                </div>
            </div>
                        <div class="weui_cell">
                <div class="weui_cell_hd">
                    <asp:Label ID="label10" runat="server" class="weui_label" Font-Size="12pt">大过:</asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_BIG_PUNISHMENT" runat="server" Text="0"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <asp:Label ID="label7" runat="server" class="weui_label" Font-Size="12pt">每天工资额:</asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_V_DAY_PAY" runat="server" Text="0"></asp:Label>
                    </strong>
                </div>
            </div>
                       <div class="weui_cell">
                <div class="weui_cell_hd">
                    <asp:Label ID="label12" runat="server" class="weui_label" Font-Size="12pt">迟早一额度:</asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_V_LATE1" runat="server" Text="0"></asp:Label>
                    </strong>
                </div>
            </div>
                       <div class="weui_cell">
                <div class="weui_cell_hd">
                    <asp:Label ID="label14" runat="server" class="weui_label" Font-Size="12pt">迟早二额度:</asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_V_LATE2" runat="server" Text="0"></asp:Label>
                    </strong>
                </div>
            </div>
                       <div class="weui_cell">
                <div class="weui_cell_hd">
                    <asp:Label ID="label16" runat="server" class="weui_label" Font-Size="12pt">小过额度:</asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_V_SMALL" runat="server" Text="0"></asp:Label>
                    </strong>
                </div>
            </div>
                       <div class="weui_cell">
                <div class="weui_cell_hd">
                    <asp:Label ID="label18" runat="server" class="weui_label" Font-Size="12pt">大过额度:</asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="label_V_BIG" runat="server" Text="0"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="Label_GongShi" runat="server" Text="计算公式"></asp:Label></strong>
                &nbsp;&nbsp;&nbsp;
            </div>
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="Label_JieGuo" runat="server" Text="计算结果:"></asp:Label></strong>
                &nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </div>
    </form>
</body>
</html>
