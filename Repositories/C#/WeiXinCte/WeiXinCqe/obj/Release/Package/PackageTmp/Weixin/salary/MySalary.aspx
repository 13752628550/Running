<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MySalary.aspx.cs" Inherits="WeiXinCqe.MySalary"   MaintainScrollPositionOnPostBack="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>工资查询</title>
    <link rel="stylesheet" href="~/style/weui.css" />
    <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
    <script language="javascript" type="text/javascript">

        function aclick(strvalue) {
            document.getElementById('Hidden1').value = strvalue;
            document.getElementById('ImageButton1').click();
        }
        function change(element) {
            var clickdFunc = function () { document.all('Button2').click(); }
            WdatePicker({ el: element, dateFmt: 'yyyy-MM', minDate: '2012-12-01', maxDate: '%y-#{%M}}', onpicked: clickdFunc })

        }
        function switchclick() {
            document.all('ImageButton2').click();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <input id="Hidden1" type="hidden" runat="server" />
    <div class="weui_cells weui_cells_form">
        <div class="weui_cells_title">
            <strong>检索月份:</strong><input type="text" value="" id="dd_yyyymmdd" readonly runat="server"
                onfocus="change(this)" style="width: 70px; height: 22px; text-align: center;
                font-weight: 700; color: #808080;" />&nbsp; &nbsp; &nbsp;
            <asp:Button ID="Button2" runat="server" Text="检索" CssClass="weui_btn weui_btn_mini weui_btn_primary"
                OnClick="Button4_Click" />
        </div>
        <div class="bd" style="height: 100%;">
            <div class="weui_tab">
                <div class="weui_navbar">
                    <div id="divlabel1" class="weui_navbar_item " style="cursor: pointer" onclick="aclick('基本信息')"
                        runat="server">
                        <asp:Label ID="Label1" runat="server" Text="基本信息"></asp:Label>
                    </div>
                    <div id="divlabel2" class="weui_navbar_item " style="cursor: pointer" onclick="aclick('考勤信息')"
                        runat="server">
                        <asp:Label ID="Label2" runat="server" Text="考勤信息"></asp:Label>
                    </div>
                    <div id="divlabel3" class="weui_navbar_item" style="cursor: pointer" onclick="aclick('工资信息')"
                        runat="server">
                        <asp:Label ID="Label3" runat="server" Text="工资信息"></asp:Label>
                    </div>
                    <div id="divlabel4" class="weui_navbar_item" style="cursor: pointer" onclick="aclick('个人设置')"
                        runat="server">
                        <asp:Label ID="Label5" runat="server" Text="个人设置"></asp:Label>
                    </div>
                </div>
                <div class="weui_tab_bd">
                </div>
            </div>
        </div>
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="Labeltitle" runat="server" Text=""></asp:Label></strong>
        </div>
       <%-- 基本信息--%>
        <div class="weui_cells weui_cells_form" id="divjiben" runat="server">
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        工号:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_staffid" runat="server"></asp:Label></strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        姓名:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_name" runat="server" Text=""></asp:Label></strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        等级:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_level" runat="server"></asp:Label></strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        格:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_ge" runat="server"></asp:Label></strong>
                </div>
            </div>
       
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        员工类型:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_stafftype" runat="server"></asp:Label></strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        役职/资格:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Post" runat="server"></asp:Label></strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        银行卡号:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_bankcode" runat="server"></asp:Label></strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        部门:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_dept" runat="server"></asp:Label></strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        所属:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_BranchName" runat="server"></asp:Label></strong>
                </div>
            </div>
        </div>




        <%--考勤信息--%>
        <div class="weui_cells weui_cells_form" id="divgongzuo" runat="server">
            <asp:Label ID="label_staffid" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="label_yyyymm" runat="server" Visible="false"></asp:Label>

            <div class="weui_cells" id="divdd" runat="server">
                <div class="weui_cells_title">
                    <strong>
                        <asp:Label ID="label_error" runat="server" Style="color: #FF0000" Font-Size="15pt"></asp:Label>
                    </strong>
                </div>
            </div>

            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label6" runat="server" class="weui_label">出勤:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Attendance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label7" runat="server" class="weui_label">公假:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Paidleave" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label8" runat="server" class="weui_label">病假:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_SickLeave" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label10" runat="server" class="weui_label">欠勤:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Lackattendance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label12" runat="server" class="weui_label">旷工:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_StayawayWork" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label14" runat="server" class="weui_label">婚丧:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Mfleave" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label16" runat="server" class="weui_label">工伤:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Injury" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label18" runat="server" class="weui_label">产假:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_MatemityLeave" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label20" runat="server" class="weui_label">公放:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Publicrelease" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label22" runat="server" class="weui_label">外诊:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Externalconsultation" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label13" runat="server" class="weui_label">迟到:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Late" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label24" runat="server" class="weui_label">夜勤:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Nightwork" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label26" runat="server" class="weui_label">误餐:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Missmeal" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label28" runat="server" class="weui_label" onclick="Link_label_on_duty_Click">早出残业:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Otearlyatt" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label30" runat="server" class="weui_label">休日出勤:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Dayoffatt" runat="server"></asp:Label>
                    </strong>
                </div>

            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label81" runat="server" class="weui_label">节日出勤:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Holidayatt" runat="server"></asp:Label>
                    </strong>
                </div>


            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label11" runat="server" class="weui_label">教育时间:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_EduHour" runat="server"></asp:Label>
                    </strong>
                </div>

            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label15" runat="server" class="weui_label">焊接工位:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_HjStation" runat="server"></asp:Label>
                    </strong>
                </div>

            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label86" runat="server" class="weui_label">内观工位:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_NgStation" runat="server"></asp:Label>
                    </strong>
                </div>

            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label88" runat="server" class="weui_label">焊接教育:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_Hjeducation" runat="server"></asp:Label>
                    </strong>
                </div>

            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label85" runat="server" class="weui_label">奖惩:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_RewardandPenalty" runat="server"></asp:Label>
                    </strong>
                </div>

            </div>
            <div class="weui_cell" style="background-color: #a7eaa2">
                <div class="weui_cell_hd">
                    <asp:Label ID="label87" runat="server" class="weui_label">人事考核:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_K_PerAss" runat="server"></asp:Label>
                    </strong>
                </div>

            </div>

            <%--个别月份显示信息--%>


            <div id="months_div" runat="server" visible="false">
                <div class="weui_cells_title">
                    <strong>
                        <asp:Label ID="Label84" runat="server" Text="赏与考勤考课 "></asp:Label></strong>
                </div>
                


                <div class="weui_cell" style="background-color: #aaeeee">
                    <div class="weui_cell_hd">
                        <asp:Label ID="label89" runat="server" class="weui_label">出勤:</asp:Label>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <strong>
                            <asp:Label ID="lbl_P_Attendance" runat="server"></asp:Label>
                        </strong>
                    </div>

                </div>
                <div class="weui_cell" style="background-color: #aaeeee">
                    <div class="weui_cell_hd">
                        <asp:Label ID="label91" runat="server" class="weui_label">公假:</asp:Label>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <strong>
                            <asp:Label ID="lbl_P_Paidleave" runat="server"></asp:Label>
                        </strong>
                    </div>

                </div>
                <div class="weui_cell" style="background-color: #aaeeee">
                    <div class="weui_cell_hd">
                        <asp:Label ID="label93" runat="server" class="weui_label">欠勤:</asp:Label>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <strong>
                            <asp:Label ID="lbl_P_Lackattendance" runat="server"></asp:Label>
                        </strong>
                    </div>

                </div>
                <div class="weui_cell" style="background-color: #aaeeee">
                    <div class="weui_cell_hd">
                        <asp:Label ID="label95" runat="server" class="weui_label">病假:</asp:Label>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <strong>
                            <asp:Label ID="lbl_P_SickLeave" runat="server"></asp:Label>
                        </strong>
                    </div>

                </div>
                <div class="weui_cell" style="background-color: #aaeeee">
                    <div class="weui_cell_hd">
                        <asp:Label ID="label97" runat="server" class="weui_label">产假:</asp:Label>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <strong>
                            <asp:Label ID="lbl_P_MatemityLeave" runat="server"></asp:Label>
                        </strong>
                    </div>
                </div>
                <div class="weui_cell" style="background-color: #aaeeee">
                    <div class="weui_cell_hd">
                        <asp:Label ID="label99" runat="server" class="weui_label">婚丧:</asp:Label>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <strong>
                            <asp:Label ID="lbl_P_Mfleave" runat="server"></asp:Label>
                        </strong>
                    </div>

                </div>
                <div class="weui_cell" style="background-color: #aaeeee">
                    <div class="weui_cell_hd">
                        <asp:Label ID="label101" runat="server" class="weui_label">工伤:</asp:Label>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <strong>
                            <asp:Label ID="lbl_P_Injury" runat="server"></asp:Label>
                        </strong>
                    </div>

                </div>
                <div class="weui_cell" style="background-color: #aaeeee">
                    <div class="weui_cell_hd">
                        <asp:Label ID="label103" runat="server" class="weui_label">公放:</asp:Label>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <strong>
                            <asp:Label ID="lbl_P_Publicrelease" runat="server"></asp:Label>
                        </strong>
                    </div>

                </div>
                <div class="weui_cell" style="background-color: #aaeeee">
                    <div class="weui_cell_hd">
                        <asp:Label ID="label105" runat="server" class="weui_label">旷工:</asp:Label>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <strong>
                            <asp:Label ID="lbl_P_StayawayWork" runat="server"></asp:Label>
                        </strong>
                    </div>

                </div>
                <div class="weui_cell" style="background-color: #aaeeee">
                    <div class="weui_cell_hd">
                        <asp:Label ID="label107" runat="server" class="weui_label">迟到:</asp:Label>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <strong>
                            <asp:Label ID="lbl_P_Late" runat="server"></asp:Label>
                        </strong>
                    </div>
                </div>
                <div class="weui_cell" style="background-color: #aaeeee">
                    <div class="weui_cell_hd">
                        <asp:Label ID="label109" runat="server" class="weui_label">奖金评价:</asp:Label>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <strong>
                            <asp:Label ID="lbl_P_Bonus" runat="server"></asp:Label>
                        </strong>
                    </div>
                </div>

            </div>

        </div>





        
        <%--工资信息--%>
        <div class="weui_cells weui_cells_form" id="divlianluo" runat="server">
            <div class="weui_cells" id="divddd" runat="server">
                <div class="weui_cells_title">
                    <strong>
                        <asp:Label ID="label_errs" runat="server" Style="color: #FF0000" Font-Size="15pt"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="Label_BASE_PAY_T" runat="server" Text="实得工资"></asp:Label></strong>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label_hhY" runat="server" class="weui_label" Font-Size="12pt">基准工资:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_JZSalary" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label_W" runat="server" class="weui_label" Font-Size="12pt">  职能工资:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_ZNsalary" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label25" runat="server" class="weui_label" Font-Size="12pt"> 评定工资:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_PDSalary" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>

            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label31" runat="server" class="weui_label" Font-Size="12pt">役职手当:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_YZallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label33" runat="server" class="weui_label" Font-Size="12pt">资格手当:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_ZGallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label_1" runat="server" class="weui_label" Font-Size="12pt">设计手当:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Sjallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label37" runat="server" class="weui_label" Font-Size="12pt">全勤手当:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Qqallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label40" runat="server" class="weui_label" Font-Size="12pt">交通手当:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Jtallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label42" runat="server" class="weui_label" Font-Size="12pt">勤劳手当:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Qlallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label44" runat="server" class="weui_label" Font-Size="12pt">加班工资:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Otsalary" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label46" runat="server" class="weui_label" Font-Size="12pt">焊接手当:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Hjallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label48" runat="server" class="weui_label" Font-Size="12pt">夜勤误餐:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Yqallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label50" runat="server" class="weui_label" Font-Size="12pt">营业手当:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Yyallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label52" runat="server" class="weui_label" Font-Size="12pt">冬季取暖费:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Qnallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label54" runat="server" class="weui_label" Font-Size="12pt">春节手当:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Cjallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label79" runat="server" class="weui_label" Font-Size="12pt">防暑降温费:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Fsallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label56" runat="server" class="weui_label" Font-Size="12pt">中秋节手当:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Zqallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label58" runat="server" class="weui_label" Font-Size="12pt">高温津贴:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Gwallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>

            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label82" runat="server" class="weui_label" Font-Size="12pt">工龄感谢金:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Glallowance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>


            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label61" runat="server" class="weui_label" Font-Size="12pt">奖金实得:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Bonusvarchar" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label63" runat="server" class="weui_label" Font-Size="12pt">订正:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Correct" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #CCFFFF">
                <div class="weui_cell_hd">
                    <asp:Label ID="label65" runat="server" class="weui_label" Font-Size="12pt">控除:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_deduct" runat="server"></asp:Label>
                    </strong>
                </div>
            </div> 

            <div class="weui_cells_title" runat="server" id="div_qt">
                <strong>
                    <asp:Label ID="Label83" runat="server" Text="代扣代缴"></asp:Label></strong>
            </div>


            <div class="weui_cell" style="background-color: #669999">
                <div class="weui_cell_hd">
                    <asp:Label ID="label67" runat="server" class="weui_label" Font-Size="12pt">养老保险:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Ylinsurance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #669999">
                <div class="weui_cell_hd">
                    <asp:Label ID="label69" runat="server" class="weui_label" Font-Size="12pt">失业保险:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Syinsurance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #669999">
                <div class="weui_cell_hd">
                    <asp:Label ID="label71" runat="server" class="weui_label" Font-Size="12pt">医疗保险:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Medicalinsurance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #669999">
                <div class="weui_cell_hd">
                    <asp:Label ID="label73" runat="server" class="weui_label" Font-Size="12pt">医疗救助险:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Medicalassinsurance" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #669999">
                <div class="weui_cell_hd">
                    <asp:Label ID="label75" runat="server" class="weui_label" Font-Size="12pt">住房公积金:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_fund" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>



            <div class="weui_cell" style="background-color: #669999">
                <div class="weui_cell_hd">
                    <asp:Label ID="label80" runat="server" class="weui_label" Font-Size="12pt">个人所得税:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_indivtax" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #669999">
                <div class="weui_cell_hd">
                    <asp:Label ID="label90" runat="server" class="weui_label" Font-Size="12pt">工会会费:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Uniondues" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #669999">
                <div class="weui_cell_hd">
                    <asp:Label ID="label94" runat="server" class="weui_label" Font-Size="12pt">代扣款:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_Cutpayment" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>


            <div class="weui_cells_title" runat="server" id="div2">
                <strong>
                    <asp:Label ID="Label9" runat="server" Text="支付工资=实得工资-代扣代缴"></asp:Label></strong>
            </div>

            <div class="weui_cell" style="background-color: #f8c7a7">
                <div class="weui_cell_hd">
                    <asp:Label ID="label17" runat="server" class="weui_label" Font-Size="12pt">实得工资:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_TakehomePay" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #f8c7a7">
                <div class="weui_cell_hd">
                    <asp:Label ID="label19" runat="server" class="weui_label" Font-Size="12pt">代扣代缴:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_sumout" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="weui_cell" style="background-color: #f8c7a7">
                <div class="weui_cell_hd">
                    <asp:Label ID="label21" runat="server" class="weui_label" Font-Size="12pt">支付工资:</asp:Label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="lbl_pay" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
             <strong><br />
                <asp:Label ID="Label23" runat="server" Text="温馨提示：" ForeColor="#ff66cc" style="margin-left:20px;"></asp:Label><br />
                 
                <asp:Label ID="Label27" runat="server" Text="为保障您的权益，请仔细核对以上项目。" ForeColor="#ff66cc" style="margin-left:20px;"></asp:Label><br />
                 
                <asp:Label ID="Label29" runat="server" Text="如有疑义，请及时与人事课联络。" ForeColor="#ff66cc" style="margin-left:20px;"></asp:Label><br /><br />
             </strong>

        </div>


        <%--个人设置--%>
        <div class="weui_cells weui_cells_form" id="divnianji" runat="server">
            <div class="weui_cell weui_cell_switch">
                <div class="weui_cell_hd weui_cell_primary">
                    取消纸质工资单
                </div>
                <div class="weui_cell_ft">
                    <input class="weui_switch" type="checkbox" id="ii" runat="server" onchange="switchclick()" />
                </div>
            </div>
            <strong>
                <asp:Label ID="Label4" runat="server" Text="" ForeColor="#33CC33"></asp:Label></strong>
        </div>

    </div>
        

        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" Height="0px" Width="0px" />
        <asp:ImageButton ID="ImageButton2" runat="server" OnClick="Button2_Click" Height="0px" Width="0px" />
        <asp:Label ID="staffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="newstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="nowstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="chaoqi" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="deviceid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="staffname" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    </form>
</body>
</html>
