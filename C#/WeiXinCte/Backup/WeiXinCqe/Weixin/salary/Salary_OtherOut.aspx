<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary_OtherOut.aspx.cs"
    Inherits="WeiXinCqe.Salary_OtherOut" %>

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
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Label2" runat="server" Style="color: #33CC33">说明:具体数据由人事科导入</asp:Label></strong>
            &nbsp;&nbsp;&nbsp;
        </div>
    </div>
    </form>
</body>
</html>
