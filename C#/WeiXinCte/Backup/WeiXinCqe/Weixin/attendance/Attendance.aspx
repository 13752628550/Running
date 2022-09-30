<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="WeiXinCqe.Attendance" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>个人考勤</title>
    <link rel="stylesheet" href="/style/weui.css" />
    <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
    <script language="javascript" type="text/javascript">

        function aclick(strvalue) {
            document.getElementById('Hidden1').value = strvalue;
            document.getElementById('ImageButton1').click();
        }
        function change(element) {
            var clickdFunc = function () { document.all('Button2').click(); }
            WdatePicker({ el: element, dateFmt: 'yyyy-MM', minDate: '2014-07-01', maxDate: '%y-#{%M+1}}', onpicked: clickdFunc })

        }
        function change1(element) {
            var clickdFunc = function () { document.all('Button1').click(); }
            WdatePicker({ el: element, dateFmt: 'yyyy-MM', minDate: '2012-12-01', maxDate: '%y-#{%M}}', onpicked: clickdFunc })

        }
        function change2(element) {
            var clickdFunc = function () { document.all('Button3').click(); }
            WdatePicker({ el: element, readOnly: true, dateFmt: 'yyyy-MM', minDate: '2012-12-01', maxDate: '%y-#{%M}}', onpicked: clickdFunc })

        }
        function change3(element) {
            var clickdFunc = function () { document.all('Button3').click(); }

        }
    </script>
    <style>
        .tc caption
        {
            font-size: 15pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <input id="Hidden1" type="hidden" runat="server" />
    <div class="bd" style="height: 100%;">
        <div class="weui_tab">
            <div class="weui_navbar">
                <div id="divlabel1" class="weui_navbar_item " style="cursor: pointer" onclick="aclick('个人日历')"
                    runat="server">
                    <asp:Label ID="Label1" runat="server" Text="个人日历"></asp:Label>
                </div>
                <div id="divlabel2" class="weui_navbar_item " style="cursor: pointer" onclick="aclick('加班实绩')"
                    runat="server">
                    <asp:Label ID="Label2" runat="server" Text="加班实绩"></asp:Label>
                </div>
                <div id="divlabel3" class="weui_navbar_item" style="cursor: pointer" onclick="aclick('欠勤记录')"
                    runat="server">
                    <asp:Label ID="Label3" runat="server" Text="欠勤记录"></asp:Label>
                </div>
                <div id="divlabel4" class="weui_navbar_item" style="cursor: pointer" onclick="aclick('历史汇总')"
                    runat="server">
                    <asp:Label ID="Label5" runat="server" Text="历史汇总"></asp:Label>
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
            <strong>检索月份:</strong><input type="text" value="" id="dd_yyyymmdd" readonly runat="server"
                onfocus="change(this)" style="width: 70px; height: 22px; text-align: center;
                font-weight: 700; color: #808080;" />&nbsp; &nbsp; &nbsp;
            <asp:Button ID="Button2" runat="server" Text="检索" CssClass="weui_btn weui_btn_mini weui_btn_primary"
                OnClick="Button4_Click" />
        </div>
        <div class="weui_cells">
            <div class="weui_cells_title">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                    OnRowDataBound="gv_RowDataBound" CssClass="tc">
                    <Columns>
                        <asp:BoundField DataField="STAFFID" HeaderText="STAFFID">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="YYYYMMDD" HeaderText="出勤日期">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CLASSTYPE" HeaderText="班次类别" Visible="False">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CLASSWORKTYPE" HeaderText="出勤情况">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="OVERTIME_PLAN" HeaderText="加班计划">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="查看">
                            <ItemTemplate>
                                <asp:LinkButton ID="Button_MyAttendance" runat="server" Font-Size="9pt" OnClick="LinkButton_Click"
                                    ToolTip="具体详情" Font-Bold="True">详情>></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" ForeColor="#33CC33" />
                    <FooterStyle Font-Bold="True" ForeColor="#33CC33" HorizontalAlign="Right" VerticalAlign="Middle" />
                    <HeaderStyle Font-Bold="True" Font-Size="12pt" ForeColor="Gray" />
                </asp:GridView>
            </div>
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label17" runat="server" Text="未来的天数最大显示31天数据" Style="color: #33CC33"></asp:Label></strong>
            </div>
        </div>
    </div>
    <div class="weui_cells weui_cells_form" id="divgongzuo" runat="server">
        <div class="weui_cells_title">
            <strong>检索月份:</strong><input type="text" value="" id="dd1_yyyymmdd" readonly runat="server"
                onfocus="change1(this)" style="width: 70px; height: 22px; text-align: center;
                font-weight: 700; color: #808080;" />&nbsp; &nbsp; &nbsp;<asp:Button ID="Button1"
                    runat="server" Text="检索" CssClass="weui_btn weui_btn_mini weui_btn_primary" OnClick="Button1_Click" />
        </div>
        <div class="weui_cells">
            <div class="weui_cells_title">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%"
                    OnRowDataBound="GridView2_RowDataBound" ShowFooter="True" CssClass="tc">
                    <Columns>
                        <asp:BoundField DataField="YYYYMMDD" HeaderText="加班日期">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="OVERTIME_TYPE" HeaderText="加班类别">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="OVERTIME" HeaderText="加班实绩">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" ForeColor="#33CC33" />
                    <FooterStyle Font-Bold="True" ForeColor="#33CC33" HorizontalAlign="Right" VerticalAlign="Middle" />
                    <HeaderStyle Font-Bold="True" Font-Size="12pt" ForeColor="Gray" />
                </asp:GridView>
            </div>
        </div>
    </div>
    <div class="weui_cells weui_cells_form" id="divlianluo" runat="server">
        <div class="weui_cells_title">
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Width="100%"
                OnRowDataBound="gv_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TIMEOFF_TYPE" HeaderText="欠勤类别">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="BEGIN_DATE" HeaderText="开始日期">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="END_DATE" HeaderText="结束日期">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="查看">
                        <ItemTemplate>
                            <asp:LinkButton ID="Button_MyTimeoff" runat="server" Font-Size="9pt" OnClick="LinkButton1_Click"
                                ToolTip="具体详情" Font-Bold="True">详情>></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataRowStyle Font-Bold="True" ForeColor="#33CC33" />
                <FooterStyle Font-Bold="True" ForeColor="#33CC33" HorizontalAlign="Right" VerticalAlign="Middle" />
                <HeaderStyle Font-Bold="True" Font-Size="12pt" ForeColor="Gray" />
            </asp:GridView>
        </div>
    </div>
    <div class="weui_cells weui_cells_form" id="divnianji" runat="server">
        <div class="weui_cells_title">
            <strong>检索月份:</strong><input type="text" value="" id="dd2_yyyymmdd" runat="server"
                onfocus="change2(this)" onchange="" style="width: 70px; height: 22px; text-align: center;
                font-weight: 700; color: #808080;" />&nbsp; &nbsp; &nbsp;<asp:Button ID="Button3"
                    runat="server" Text="检索" CssClass="weui_btn weui_btn_mini weui_btn_primary" OnClick="Button3_Click" />
                 <asp:Label ID="label_yyyymm" runat="server" Visible="false"></asp:Label>
              
        </div>
        <div class="weui_cells" id="divdd" runat="server">
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label_error" runat="server" Style="color: #FF0000" Font-Size="15pt"></asp:Label>
                </strong>
                <asp:Label ID="labelc" runat="server" Font-Size="15pt"></asp:Label>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label9" runat="server" class="weui_label">工号:</asp:Label>
            </div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_staffid" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label21" runat="server" class="weui_label">姓名:</asp:Label>
            </div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_staffname" runat="server"></asp:Label>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label4" runat="server" class="weui_label">出勤:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_on_duty" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_on_duty" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label6" runat="server" class="weui_label">欠勤:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_off_duty" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_off_duty" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label8" runat="server" class="weui_label">公假:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_public_leave" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_public_leave" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell" runat="server" id="divcj">
            <div class="weui_cell_hd">
                <asp:Label ID="label10" runat="server" class="weui_label">产假:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_cj" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_cj" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell" runat="server" id="divgsj">
            <div class="weui_cell_hd">
                <asp:Label ID="label12" runat="server" class="weui_label">工伤假:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_back4" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_back4" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label14" runat="server" class="weui_label">病假:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_sick_leave" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_sick_leave" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label16" runat="server" class="weui_label">一时归休:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_back1" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_back1" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label18" runat="server" class="weui_label">早班:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_morning" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_morning" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label20" runat="server" class="weui_label">中班:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_middle" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_middle" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label22" runat="server" class="weui_label">夜班:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_night" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_night" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label13" runat="server" class="weui_label">4班3倒:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_pay80" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_pay80" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label24" runat="server" class="weui_label">平日加班:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_overtime1" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_overtime1" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label26" runat="server" class="weui_label">休日加班:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_overtime2" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_overtime2" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label28" runat="server" class="weui_label" onclick="Link_label_on_duty_Click">祝日加班:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_overtime3" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_overtime3" runat="server">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label30" runat="server" class="weui_label">住宅天数:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_house_count" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_house_count" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label7" runat="server" class="weui_label">迟早一:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_late1" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_late1" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label11" runat="server" class="weui_label">迟早二:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_late2" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_late2" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label15" runat="server" class="weui_label">迟早三:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_late3" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_late3" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cells_title" id="divmemo" runat="server">
            <strong>
                <asp:Label ID="label_MEMO" runat="server" Text="因根据公司规定各统计项的内容变化过多次，不提供2016-06之前的详情查看功能"
                    Style="color: #33CC33"></asp:Label></strong>
        </div>
    </div>
    <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" Height="0px"
        Width="0px" />
    <asp:Label ID="staffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <asp:Label ID="newstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <asp:Label ID="nowstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <asp:Label ID="chaoqi" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <asp:Label ID="deviceid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <asp:Label ID="staffname" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    </form>
</body>
</html>
