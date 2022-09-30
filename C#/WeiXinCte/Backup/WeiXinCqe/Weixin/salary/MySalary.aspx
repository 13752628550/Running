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
        <div class="weui_cells weui_cells_form" id="divjiben" runat="server">
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        工号:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Id" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        姓名:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Name" runat="server" Text=""></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        职级:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Rank" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        号俸:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Hf" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        入社日期:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_In" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        离职日期:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Test" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        行政职务:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Post" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        技术职务:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_TechPost" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        部门:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_TopDeptName" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        班号:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_DeptName" runat="server"></asp:Label></strong></div>
            </div>
        </div>
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

        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label6" runat="server" class="weui_label">出勤:</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_on_duty" runat="server"></asp:Label>
                    <asp:LinkButton ID="Link_label_on_duty" runat="server" OnClick="Link_label_on_duty_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
        <div class="weui_cell">
            <div class="weui_cell_hd">
                <asp:Label ID="label7" runat="server" class="weui_label">欠勤:</asp:Label></div>
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
                <asp:Label ID="label81" runat="server" class="weui_label">迟早一:</asp:Label></div>
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
        <div class="weui_cells_title"  id="divmemo" runat="server">
            <strong>
                <asp:Label ID="label_MEMO" runat="server" Text="因根据公司规定各统计项的内容变化过多次，不提供2016-06之前的详情查看功能！"
                    Style="color: #33CC33"></asp:Label></strong>
        </div>
        </div>
        <div class="weui_cells weui_cells_form" id="divlianluo" runat="server">
                <div class="weui_cells" id="divddd" runat="server">
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label_errs" runat="server" Style="color: #FF0000" Font-Size="15pt"></asp:Label>
                </strong>
            </div>
        </div>
              <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label_BASE_PAY_T" runat="server" Text="基本工资"></asp:Label></strong>  </div>
              <div class="weui_cell" style="background-color: #CCFFFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label_hhY" runat="server" class="weui_label" Font-Size="12pt">职能给(a):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_COMPETENCY_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_COMPETENCY_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
                      <div class="weui_cell"  style="background-color: #CCFFFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label_W" runat="server" class="weui_label" Font-Size="12pt">   福利(b):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_WELFARE_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_WELFARE_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
        </div>
                      <div class="weui_cell" style="background-color: #CCFFFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label25" runat="server" class="weui_label" Font-Size="12pt"> 精勤(c):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_PERFECT_ATTENDANCE_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_PERFECT_ATTENDANCE_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                          <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label_BASE_PAY_JS_T" runat="server" Text="工资基数 "></asp:Label></strong>  </div>
                   
                       <div class="weui_cell" style="background-color: #99FFCC">
            <div class="weui_cell_hd">
                <asp:Label ID="label31" runat="server" class="weui_label" Font-Size="12pt">基本工资(A):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_BASE_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_BASE_PAY" runat="server" OnClick="Link_label_Click" Visible="False">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                              <div class="weui_cell" style="background-color: #99FFCC">
            <div class="weui_cell_hd">
                <asp:Label ID="label33" runat="server" class="weui_label" Font-Size="12pt">行政补贴(d):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_POST_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_POST_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                              <div class="weui_cell" style="background-color: #99FFCC">
            <div class="weui_cell_hd">
                <asp:Label ID="label_1" runat="server" class="weui_label" Font-Size="12pt">技术补贴(e):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_TECH_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_TECH_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                              <div class="weui_cell" style="background-color: #99FFCC">
            <div class="weui_cell_hd">
                <asp:Label ID="label37" runat="server" class="weui_label"  Font-Size="12pt">特殊补贴(f):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_SPECIAL_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_SPECIAL_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                  <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label_SUM_PAY_T" runat="server" Text="支给合计"></asp:Label></strong>  </div>
                                           <div class="weui_cell" 
                  style="background-color: #99CCFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label40" runat="server" class="weui_label" Font-Size="12pt">工资基数(B):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_BASE_PAY_JS" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_BASE_PAY_JS" runat="server" OnClick="Link_label_Click" Visible="False">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                           <div class="weui_cell" 
                  style="background-color: #99CCFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label42" runat="server" class="weui_label" Font-Size="12pt">平日(g):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OVERTIME1_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_OVERTIME1_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                           <div class="weui_cell" 
                  style="background-color: #99CCFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label44" runat="server" class="weui_label" Font-Size="12pt">休日(h):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OVERTIME2_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_OVERTIME2_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                           <div class="weui_cell" 
                  style="background-color: #99CCFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label46" runat="server" class="weui_label" Font-Size="12pt">祝日(i):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OVERTIME3_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_OVERTIME3_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                           <div class="weui_cell" 
                  style="background-color: #99CCFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label48" runat="server" class="weui_label" Font-Size="12pt">季节(j):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_SEASON_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_SEASON_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                           <div class="weui_cell" 
                  style="background-color: #99CCFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label50" runat="server" class="weui_label"  Font-Size="12pt">交替(k):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_CHANGE_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_CHANGE_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                           <div class="weui_cell" 
                  style="background-color: #99CCFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label52" runat="server" class="weui_label" Font-Size="12pt">调整(l):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_ADJUSTMENT_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_ADJUSTMENT_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                           <div class="weui_cell" 
                  style="background-color: #99CCFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label54" runat="server" class="weui_label" Font-Size="12pt">住宅(m):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_HOUSE_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_HOUSE_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                           <div class="weui_cell" 
                  style="background-color: #99CCFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label56" runat="server" class="weui_label" Font-Size="12pt">奖金(n):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_BONUS_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_BONUS_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                           <div class="weui_cell" 
                  style="background-color: #99CCFF">
            <div class="weui_cell_hd">
                <asp:Label ID="label58" runat="server" class="weui_label" Font-Size="12pt">其他给(o):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_OTHER_PAY" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
         
                                                   <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label_SUM_OUT_T" runat="server" Text="扣除合计"></asp:Label></strong>  </div>
                                              <div class="weui_cell" 
                  style="background-color: #669999">
            <div class="weui_cell_hd">
                <asp:Label ID="label61" runat="server" class="weui_label" Font-Size="12pt">欠勤额(p):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OFF_DUTY_OUT" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_OFF_DUTY_OUT" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                       <div class="weui_cell" 
                  style="background-color: #669999">
            <div class="weui_cell_hd">
                <asp:Label ID="label63" runat="server" class="weui_label" Font-Size="12pt">精勤扣(q):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_PERFECT_ATTENDANCE_OUT" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_PERFECT_ATTENDANCE_OUT" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                       <div class="weui_cell" 
                  style="background-color: #669999">
            <div class="weui_cell_hd">
                <asp:Label ID="label65" runat="server" class="weui_label" Font-Size="12pt">保险扣(r):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_SB_OUT" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_SB_OUT" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                       <div class="weui_cell" 
                  style="background-color: #669999">
            <div class="weui_cell_hd">
                <asp:Label ID="label67" runat="server" class="weui_label" Font-Size="12pt">公积金(s):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_GJJ_OUT" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_GJJ_OUT" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                       <div class="weui_cell" 
                  style="background-color: #669999">
            <div class="weui_cell_hd">
                <asp:Label ID="label69" runat="server" class="weui_label" Font-Size="12pt">所得税(t):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_TAX_OUT" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_TAX_OUT" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                       <div class="weui_cell" 
                  style="background-color: #669999">
            <div class="weui_cell_hd">
                <asp:Label ID="label71" runat="server" class="weui_label"  Font-Size="12pt">会费(u):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_DUE_OUT" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_DUE_OUT" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                       <div class="weui_cell" 
                  style="background-color: #669999">
            <div class="weui_cell_hd">
                <asp:Label ID="label73" runat="server" class="weui_label"  Font-Size="12pt">药费扣(v):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_MEDICAL_OUT" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_MEDICAL_OUT" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                       <div class="weui_cell" 
                  style="background-color: #669999">
            <div class="weui_cell_hd">
                <asp:Label ID="label75" runat="server" class="weui_label"  Font-Size="12pt">其他扣(w):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_OTHER_OUT" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_OTHER_OUT" runat="server" OnClick="Link_label_Click">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                 <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label_MINUS_PAY_T" runat="server" Text="反负工资:"></asp:Label></strong>  </div>
                          <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label_FACT_PAY_T" runat="server" Text="实发工资: "></asp:Label></strong>  </div>
                                                   <div class="weui_cell" 
                  style="background-color: #999966">
            <div class="weui_cell_hd">
                <asp:Label ID="label9" runat="server" class="weui_label"  Font-Size="12pt">支付合计(C):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_SUM_PAY" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_SUM_PAY" runat="server" OnClick="Link_label_Click" Visible="False">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
                                                                        <div class="weui_cell" 
                  style="background-color: #999966">
            <div class="weui_cell_hd">
                <asp:Label ID="label19" runat="server" class="weui_label"  Font-Size="12pt">扣除合计(D):</asp:Label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <strong>
                    <asp:Label ID="label_SUM_OUT" runat="server"></asp:Label>
                    <asp:LinkButton ID="LinkButton_SUM_OUT" runat="server" OnClick="Link_label_Click" Visible="False">    详情 &gt;&gt;</asp:LinkButton>
                </strong>
            </div>
                         </div>
        </div>
           <div class="weui_cells weui_cells_form" id="divlianluo1" runat="server">
                           <div class="weui_cells" id="div1" runat="server">
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label17" runat="server" Style="color: #FF0000" Font-Size="15pt"></asp:Label>
                </strong>
            </div>
        </div>
                                         <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label21" runat="server" Text="实发工资:"></asp:Label></strong>  </div>
                                                   <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label23" runat="server" Text="反负工资:"></asp:Label></strong>  </div>
                                                   <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label27" runat="server" Text="支给合计:"></asp:Label></strong>  </div>
                                                   <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label29" runat="server" Text="扣除合计:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label32" runat="server" Text="职能给:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label34" runat="server" Text="福利:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label35" runat="server" Text="精勤:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label36" runat="server" Text="基本工资:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label38" runat="server" Text="行政补贴:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label39" runat="server" Text="技术补贴:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label41" runat="server" Text="特殊:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label43" runat="server" Text="住宅补助:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label45" runat="server" Text="时间外:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label47" runat="server" Text="休日:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label49" runat="server" Text="祝日:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label51" runat="server" Text="奖金:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label53" runat="server" Text="季节:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label55" runat="server" Text="交替:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label57" runat="server" Text="调整:"></asp:Label></strong>  </div>
                    <div class="weui_cells_title" id="divzhaoli" runat="server"  visible="false"><strong>
                  <asp:Label ID="Label78" runat="server" Text="朝礼:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>

                  <asp:Label ID="Label59" runat="server" Text="其他给:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label60" runat="server" Text="欠勤额:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label62" runat="server" Text="精勤扣:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title" id="divchizao" runat="server" visible="false"><strong>
                  <asp:Label ID="Label64" runat="server" Text="迟早额:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label66" runat="server" Text="保险扣:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label68" runat="server" Text="公积金:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label70" runat="server" Text="所得税:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label72" runat="server" Text="会费:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label74" runat="server" Text="药费扣:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label76" runat="server" Text="其他扣:"></asp:Label></strong>  </div>
                                                                     <div class="weui_cells_title"><strong>
                  <asp:Label ID="Label77" runat="server" Text="说明:因统计项和计算公式的变化，2016-06之前的工资不提供详情查看" style="color: #33CC33"></asp:Label></strong>  </div>
                                                                   

        </div>
        <div class="weui_cells weui_cells_form" id="divnianji" runat="server">
            <div class="weui_cell weui_cell_switch">
                <div class="weui_cell_hd weui_cell_primary">
                    取消纸质工资单</div>
                <div class="weui_cell_ft">
                    <input class="weui_switch" type="checkbox" id="ii" runat="server" onchange="switchclick()" />
                </div>
            </div>
            <strong>
                <asp:Label ID="Label4" runat="server" Text="" ForeColor="#33CC33"></asp:Label></strong>
        </div>
    </div>
            <asp:Label ID="label_SYYYYMM" runat="server" Visible="false"></asp:Label>
                   <asp:Label ID="label_SSTAFFID" runat="server" Visible="false"></asp:Label>
     <asp:Label ID="label_SOVERTIME1" runat="server" Visible="false"></asp:Label>
       <asp:Label ID="label_SOVERTIME2" runat="server" Visible="false"></asp:Label>
         <asp:Label ID="label_SOVERTIME3" runat="server" Visible="false"></asp:Label>
              <asp:Label ID="label_SHOUSE_PAY_COUNT" runat="server" Visible="false"></asp:Label>
       <asp:Label ID="label_SV_HOUSE_PAY" runat="server" Visible="false"></asp:Label>
         <asp:Label ID="label_SV_SUM_DUTY" runat="server" Visible="false"></asp:Label>
         <asp:Label ID="label_SV_ON_DUTY" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="label_SMORNING" runat="server" Visible="false"></asp:Label>
         <asp:Label ID="label_SV_MORNING" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="label_SMIDDLE" runat="server" Visible="false"></asp:Label>
         <asp:Label ID="label_SV_MIDDLE" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="label_SNIGHT" runat="server" Visible="false"></asp:Label>
         <asp:Label ID="label_SV_NIGHT" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="label_SPAY43" runat="server" Visible="false"></asp:Label>
         <asp:Label ID="label_SV_PAY43" runat="server" Visible="false"></asp:Label>
                  <asp:Label ID="label_STYPE1" runat="server" Visible="false"></asp:Label>
                   <asp:Label ID="label_STYPE2" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="label_STYPE3" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="label_SV_OFF_DUTY" runat="server" Visible="false"></asp:Label>
                      <asp:Label ID="label_SV_PERFECT_ATTENDANCE_PAY_DAY" runat="server" Visible="false"></asp:Label>
                           <asp:Label ID="label_SISCHANXIU" runat="server" Visible="false"></asp:Label>
                           <asp:Label ID="label_SV_DAY_PAY" runat="server" Visible="false"></asp:Label>
                              <asp:Label ID="label_S_ON_DUTY" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="label_S_LATE1" runat="server" Visible="false"></asp:Label>
                                  <asp:Label ID="label_S_LATE2" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="label_S_LATE3" runat="server" Visible="false"></asp:Label>
                                      <asp:Label ID="label_S_V_LATE1" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="label_S_V_LATE2" runat="server" Visible="false"></asp:Label>
                                          <asp:Label ID="label_S_V_BIG" runat="server" Visible="false"></asp:Label>
                                              <asp:Label ID="label_S_V_SMALL" runat="server" Visible="false"></asp:Label>
                                                  <asp:Label ID="label_S_BIG_PUNISHMENT" runat="server" Visible="false"></asp:Label>
                                                      <asp:Label ID="label_S_SMALL_PUNISHMENT" runat="server" Visible="false"></asp:Label>
                                                         
    <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" Height="0px"
        Width="0px" />
    <asp:ImageButton ID="ImageButton2" runat="server" OnClick="Button2_Click" Height="0px"
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
