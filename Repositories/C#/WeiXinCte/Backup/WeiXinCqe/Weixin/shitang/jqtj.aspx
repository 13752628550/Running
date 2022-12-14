<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jqtj.aspx.cs" Inherits="WeiXinCqe.jqtj" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>机器统计</title>
    <link rel="stylesheet" href="~/style/weui.css" />
    <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
    <script language="JAVASCRIPT">

        function change(element) {
            var clickdFunc = function () { document.all('Button2').click(); }
            WdatePicker({ el: element, dateFmt: 'yyyy-MM-dd', minDate: '2016-1-29', maxDate: '%y-%M-#{%d}', onpicked: clickdFunc })

        }
 
    </script>
    <style type="text/css">
        #dd
        {
            width: 121px;
            font-weight: 700;
            color: #808080;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="">
    <div class="weui_cells weui_cells_form">
        <div class="weui_cell  ">
            <strong>打卡日期:</strong><input type="text" value="2016-05-07" id="dd_yyyymmdd" readonly
                runat="server" onfocus="change(this)" style="width: 79px; height: 24px; text-align: center;
                font-weight: 700; color: #808080;" />&nbsp; &nbsp; &nbsp;<asp:Button ID="Button2"
                    runat="server" Text="检索" CssClass="weui_btn weui_btn_mini weui_btn_primary" OnClick="Button4_Click"
                    Height="0px" Width="1px" />
        </div>
                         <div class="weui_cell weui_cell_select weui_select_after">
                <div class="weui_cell_hd">
                    <label for="" class="weui_label" style="font-weight: bold">
                        餐别:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <asp:DropDownList ID="DropDownList1" runat="server" class="weui_select" 
                        AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>早餐</asp:ListItem>
                        <asp:ListItem>午餐</asp:ListItem>
                        <asp:ListItem>晚餐</asp:ListItem>
                        <asp:ListItem>夜餐</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            </div>
        <div  >
              <div class="weui_cells_title">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%"
                OnRowDataBound="GridView2_RowDataBound" ShowFooter="True" 
                      EmptyDataText="未能检索到数据">
                <Columns>
                    <asp:BoundField DataField="DINNER_DAY" HeaderText="打卡日期">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DINNER_TYPE" HeaderText="餐别">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PC_NAME" HeaderText="机器名称">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                          <asp:BoundField DataField="DINNER_COUNT" HeaderText="打卡人数">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
 
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" ForeColor="#33CC33" />
                <FooterStyle Font-Bold="True" ForeColor="#33CC33" HorizontalAlign="Center" 
                    VerticalAlign="Middle" Font-Size="9pt" />
                <HeaderStyle Font-Bold="True" Font-Size="10pt" ForeColor="#FAFAFA" 
                    BackColor="#33CC33" />
                <RowStyle Font-Size="9pt" />
            </asp:GridView>
        </div>
        </div>
        
        </div>
 
        <asp:Label ID="staffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>

    </form>
</body>
</html>
