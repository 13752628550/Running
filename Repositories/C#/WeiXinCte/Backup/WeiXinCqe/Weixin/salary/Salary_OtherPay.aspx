<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary_OtherPay.aspx.cs"
    Inherits="WeiXinCqe.Salary_OtherPay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>其他给明细</title>
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
                <asp:Label ID="labled" runat="server" Text="其他给明细"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                ToolTip="返回个人工资页面">返回>></asp:LinkButton>
        </div>
        <div class="weui_cells_title" id="labletitle" runat="server">
            <strong>
                <asp:Label ID="label_error" runat="server" Text=""></asp:Label></strong>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT1" runat="server" class="weui_label" Font-Size="12pt">工资基数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_BASE_PAY_JS" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell" id="divback4" runat="server" visible="false">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT2" runat="server" class="weui_label" Font-Size="12pt">工伤基数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_BACK4_JS" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT3" runat="server" class="weui_label" Font-Size="12pt"
                    Width="120px">青岛市最低工资:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_V_LOW_SLR" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                <div class="weui_cell" id="divsick" runat="server"  visible="false">
            <div class="weui_cell_hd">
                <asp:Label ID="label10" runat="server" class="weui_label" Font-Size="12pt">病假基数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="labelsick_js" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
                        <div class="weui_cell" id="divsick2" runat="server"  visible="false">
            <div class="weui_cell_hd">
                <asp:Label ID="label11" runat="server" class="weui_label" Font-Size="12pt">病假基数2:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="labelsick_js2" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT4" runat="server" class="weui_label" Font-Size="12pt">一时归休:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_BACK1" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT5" runat="server" class="weui_label" Font-Size="12pt">工伤假:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_BACK4" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT6" runat="server" class="weui_label" Font-Size="12pt">病假:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_SICK" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell" id="divsick_leavel"  runat="server" visible="false">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT7" runat="server" class="weui_label" 
                    Font-Size="12pt" Width="130px">超过6个月长病假:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_SICK_LEAVE" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT8" runat="server" class="weui_label" Font-Size="12pt">一时归休给:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_PAY1" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT9" runat="server" class="weui_label" Font-Size="12pt">工伤给:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_PAY5" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT10" runat="server" class="weui_label" Font-Size="12pt">病假给:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_PAY4" runat="server" Text="0"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="labelOTHER_OUT" runat="server" class="weui_label" Font-Size="12pt"
                    Font-Bold="True" ForeColor="#33CC33">其他给合计:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_PAY" runat="server" Text="0" ForeColor="#33CC33"></asp:Label>
                </strong>
            </div>
        </div>

        <div class="weui_cells_title" id="div1" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label1" runat="server" Text="计算公式"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title" id="div2" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label2" runat="server" Text="计算公式"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title" id="div3" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label3" runat="server" Text="计算公式"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title" id="div4" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label4" runat="server" Text="计算公式"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title" id="div5" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label5" runat="server" Text="计算公式"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title" id="div6" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label6" runat="server" Text="计算公式"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title" id="div7" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label7" runat="server" Text="计算公式"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title" id="div8" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label8" runat="server" Text="计算公式"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
        </div>
        <div class="weui_cells_title" id="div9" runat="server" visible="false">
            <strong>
                <asp:Label ID="Label9" runat="server" Text="计算公式"></asp:Label></strong> &nbsp;&nbsp;&nbsp;
        </div>
    </div>
    </form>
</body>
</html>
