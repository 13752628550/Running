<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dvote4.aspx.cs" Inherits="WeiXinCqe.Weixin.vote.Dvote4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>2017CQE员工满意度调查表</title>
    <link rel="stylesheet" href="~/style/weui.css" />
    <link rel="stylesheet" href="~/example/example.css" />
    <script language="JAVASCRIPT">

        function SelectA(aControl) {
            var tempControl = aControl;
            var isChecked = tempControl.checked;

            elem = tempControl.form.elements;
            for (i = 0; i < elem.length; i++)
                if (elem[i].type == "checkbox" && elem[i].id != tempControl.id) {
                    if (elem[i].checked != isChecked)
                        elem[i].click();
                }
        }
        function changecheck(aControl, ss) {
            if (aControl.checked)
                document.getElementById(ss).checked = false;
            document.getElementById("ImageButton1").click();
        }
        function change1check(aControl, ss) {
            if (aControl.checked) {

                if (aControl.id != ss + "_a")
                    document.getElementById(ss + "_a").checked = false;

                if (aControl.id != ss + "_b")
                    document.getElementById(ss + "_b").checked = false;

                if (aControl.id != ss + "_c")
                    document.getElementById(ss + "_c").checked = false;

                if (aControl.id != ss + "_d")
                    document.getElementById(ss + "_d").checked = false;

            }
        }



        function checkMaxInput(obj) {
            document.getElementById("Label68").innerHTML = obj.value.length;
        }
        function check1MaxInput(obj) {
            document.getElementById("Label2999").innerHTML = obj.value.length;
        }

    </script>
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="weui_panel"   id="link27">
            <div class="style1" style="font-size: large; font-weight: bold;">
                <asp:Label ID="Label15" runat="server" Text="员工满意度调查表"></asp:Label>
                <asp:Label ID="Label16" runat="server" Text=""></asp:Label>
            </div>
        </div>
                   <div class="weui_media_box weui_media_text">
             
        
                      <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">                   
      &nbsp;各位员工：<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        大家好！为不断改善公司管理，提升公司竞争力，现进行2017年度员工满意度调查。本调查表是公司与员工之间交流的平台，在这里员工可以独立客观公正的为公司的发展提出意见和建议，公司也可以了解到员工的工作状况和生活感受，以及在各方面的需求。请大家务必根据目前公司现状及自己的实际想法，理性、认真、详实地填写本调查表，如实地反映自己对各项问题的观点，感谢大家的配合！(本次调查为不记名调查，系统将不会记录、提取您的任何个人信息，请放心)
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本次调查共20道单选题及2道开放题。</p>
            
                   </div>
     <div class="weui_media_box weui_media_text" id="Div1">
 
             <strong>一、单选题:
                    </div>        
             
                <div id="nextdiv" runat="server" visible="true">
        <div class="weui_cells_title" id="link1">
            <strong>
                <asp:Label ID="label_1" runat="server" Text="1.	您对工资收入是否感到满意？"></asp:Label></strong>
        </div>
<div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z1_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z1_a" runat="server"
                            onchange="change1check(this,'z1')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z1_b" runat="server" id="Label81">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z1_b" runat="server"
                            onchange="change1check(this,'z1')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.较满意
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z1_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z1_c" runat="server"
                            onchange="change1check(this,'z1')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.可接受</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z1_d" runat="server" id="Label82">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z1_d" runat="server"
                            onchange="change1check(this,'z1')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不可接受
                        </p>
                    </div>
                </label>
         
            </div>
     
            <div class="weui_cells_title" id="link2">
                <strong>
                    <asp:Label ID="label_2" runat="server" Text="2.	除工资收入外，您最看重："></asp:Label></strong>
            </div>
         <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z2_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z2_a" runat="server"
                            onchange="change1check(this,'z2')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.工作环境</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z2_b" runat="server" id="Label1">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z2_b" runat="server"
                            onchange="change1check(this,'z2')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.成长空间
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z2_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z2_c" runat="server"
                            onchange="change1check(this,'z2')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.公平性</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z2_d" runat="server" id="Label83">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z2_d" runat="server"
                            onchange="change1check(this,'z2')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.稳定性
                        </p>
                    </div>
                </label>
         
            </div>
            <div class="weui_cells_title" id="link3">
                <strong>
                    <asp:Label ID="label_3" runat="server" Text="3.您的加班时间如何？	"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z3_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z3_a" runat="server"
                            onchange="change1check(this,'z3')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.加班太多</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z3_b" runat="server" id="Label3">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z3_b" runat="server"
                            onchange="change1check(this,'z3')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.合适
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z3_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z3_c" runat="server"
                            onchange="change1check(this,'z3')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.加班太少</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z3_d" runat="server" id="Label4">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z3_d" runat="server"
                            onchange="change1check(this,'z3')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.没有加班
                        </p>
                    </div>
                </label>
              
            </div>
            <div class="weui_cells_title" id="link4">
                <strong>
                    <asp:Label ID="label_4" runat="server" Text="4.	您对公司的五险一金和其它福利是否满意?"></asp:Label></strong>
            </div>
       <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z4_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z4_a" runat="server"
                            onchange="change1check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z4_b" runat="server" id="Label2">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_b" runat="server"
                            onchange="change1check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z4_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z4_c" runat="server"
                            onchange="change1check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.不满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z4_d" runat="server" id="Label5">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_d" runat="server"
                            onchange="change1check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不清楚
                        </p>
                    </div>
                </label>         
            </div>

            <div class="weui_cells_title" id="link5">
                <strong>
                    <asp:Label ID="label_5" runat="server" Text="5.	您工作时感到有乐趣吗？ "></asp:Label></strong>
            </div>
     <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z5_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z5_a" runat="server"
                            onchange="change1check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.很有乐趣</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z5_b" runat="server" id="Label6">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_b" runat="server"
                            onchange="change1check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.有乐趣
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z5_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z5_c" runat="server"
                            onchange="change1check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.一般</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z5_d" runat="server" id="Label7">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_d" runat="server"
                            onchange="change1check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.无趣
                        </p>
                    </div>
                </label>
         
            </div>
            <div class="weui_cells_title" id="link6">
                <strong>
                    <asp:Label ID="label_6" runat="server" Text="6.	您认为公司的奖励和惩罚制度是否合理？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z6_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z6_a" runat="server"
                            onchange="change1check(this,'z6')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.合理</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z6_b" runat="server" id="Label9">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z6_b" runat="server"
                            onchange="change1check(this,'z6')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z6_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z6_c" runat="server"
                            onchange="change1check(this,'z6')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.不合理</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z6_d" runat="server" id="Label10">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z6_d" runat="server"
                            onchange="change1check(this,'z6')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不清楚
                        </p>
                    </div>
                </label>

            </div>
            <div class="weui_cells_title" id="link7">
                <strong>
                    <asp:Label ID="label_7" runat="server" Text="7.	您觉得工作环境的卫生及舒适度如何？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z7_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z7_a" runat="server"
                            onchange="change1check(this,'z7')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.很好</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z7_b" runat="server" id="Label11">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z7_b" runat="server"
                            onchange="change1check(this,'z7')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z7_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z7_c" runat="server"
                            onchange="change1check(this,'z7')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.可接受</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z7_d" runat="server" id="Label18">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z7_d" runat="server"
                            onchange="change1check(this,'z7')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不能忍受
                        </p>
                    </div>
                </label>

            </div>
            <div class="weui_cells_title" id="link8">
                <strong>
                    <asp:Label ID="label_8" runat="server" Text="8.	您对公司内部投诉的处理感到满意吗？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z8_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z8_a" runat="server"
                            onchange="change1check(this,'z8')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z8_b" runat="server" id="Label12">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z8_b" runat="server"
                            onchange="change1check(this,'z8')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z8_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z8_c" runat="server"
                            onchange="change1check(this,'z8')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.不满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z8_d" runat="server" id="Label20">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z8_d" runat="server"
                            onchange="change1check(this,'z8')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不清楚
                        </p>
                    </div>
                </label>               
            </div>
            <div class="weui_cells_title" id="link9">
                <strong>
                    <asp:Label ID="label_9" runat="server" Text="9.	您能及时了解公司发布的各种信息和管理制度吗？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z9_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z9_a" runat="server"
                            onchange="change1check(this,'z9')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.及时</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z9_b" runat="server" id="Label13">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z9_b" runat="server"
                            onchange="change1check(this,'z9')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z9_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z9_c" runat="server"
                            onchange="change1check(this,'z9')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.不及时</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z9_d" runat="server" id="Label22">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z9_d" runat="server"
                            onchange="change1check(this,'z9')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不了解
                        </p>
                    </div>
                </label>                
            </div>
            <div class="weui_cells_title" id="link10">
                <strong>
                    <asp:Label ID="label_10" runat="server" Text="10.	您对公司有认同感及归属感吗？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z10_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z10_a" runat="server"
                            onchange="change1check(this,'z10')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.有</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z10_b" runat="server" id="Label14">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z10_b" runat="server"
                            onchange="change1check(this,'z10')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z10_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z10_c" runat="server"
                            onchange="change1check(this,'z10')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.没有</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z10_d" runat="server" id="Label24">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z10_d" runat="server"
                            onchange="change1check(this,'z10')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.无所谓
                        </p>
                    </div>
                </label>

            </div>
            <div class="weui_cells_title" id="link11">
                <strong>
                    <asp:Label ID="label54" runat="server" Text="11.	您对公司文体、娱乐活动的安排感到满意吗？"></asp:Label></strong>
            </div>
           <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z11_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z11_a" runat="server"
                            onchange="change1check(this,'z11')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z11_b" runat="server" id="Label8">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z11_b" runat="server"
                            onchange="change1check(this,'z11')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z11_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z11_c" runat="server"
                            onchange="change1check(this,'z11')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.不满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z11_d" runat="server" id="Label17">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z11_d" runat="server"
                            onchange="change1check(this,'z11')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不清楚
                        </p>
                    </div>
                </label>
         
            </div>
            <div class="weui_cells_title" id="link12">
                <strong>
                    <asp:Label ID="label56" runat="server" Text="12. 您对同事之间的人际关系是否满意？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z12_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z12_a" runat="server"
                            onchange="change1check(this,'z12')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z12_b" runat="server" id="Label19">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z12_b" runat="server"
                            onchange="change1check(this,'z12')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z12_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z12_c" runat="server"
                            onchange="change1check(this,'z12')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.不满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z12_d" runat="server" id="Label21">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z12_d" runat="server"
                            onchange="change1check(this,'z12')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.无所谓
                        </p>
                    </div>
                </label>
         
            </div>
            <div class="weui_cells_title" id="link13">
                <strong>
                    <asp:Label ID="label58" runat="server" Text="13.您认为公司目前的凝聚力如何？"></asp:Label></strong>
            </div>
                <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z13_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z13_a" runat="server"
                            onchange="change1check(this,'z13')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.很强</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z13_b" runat="server" id="Label23">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z13_b" runat="server"
                            onchange="change1check(this,'z13')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z13_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z13_c" runat="server"
                            onchange="change1check(this,'z13')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.没有</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z13_d" runat="server" id="Label25">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z13_d" runat="server"
                            onchange="change1check(this,'z13')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不清楚
                        </p>
                    </div>
                </label>
         
            </div>
            <div class="weui_cells_title" id="link14">
                <strong>
                    <asp:Label ID="label60" runat="server" Text="14.您对公司大多数同事的品格及修养感到满意吗？"></asp:Label></strong>
            </div>
     <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z14_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z14_a" runat="server"
                            onchange="change1check(this,'z14')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z14_b" runat="server" id="Label55">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z14_b" runat="server"
                            onchange="change1check(this,'z14')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z14_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z14_c" runat="server"
                            onchange="change1check(this,'z14')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.不满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z14_d" runat="server" id="Label57">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z14_d" runat="server"
                            onchange="change1check(this,'z14')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.无所谓
                        </p>
                    </div>
                </label>
         
            </div>
            <div class="weui_cells_title"  id="link15">
                <strong>
                    <asp:Label ID="label62" runat="server" Text="15.您觉得公司的发展前景如何？"></asp:Label></strong>
            </div>
      <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z15_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z15_a" runat="server"
                            onchange="change1check(this,'z15')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.前景无限</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z15_b" runat="server" id="Label59">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z15_b" runat="server"
                            onchange="change1check(this,'z15')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z15_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z15_c" runat="server"
                            onchange="change1check(this,'z15')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.前景黯淡</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z15_d" runat="server" id="Label61">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z15_d" runat="server"
                            onchange="change1check(this,'z15')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不清楚
                        </p>
                    </div>
                </label>
         
            </div>
            <div class="weui_cells_title"  id="link16">
                <strong>
                    <asp:Label ID="label26" runat="server" Text="16.您对公司提供的班车服务感到满意吗？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z16_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z16_a" runat="server"
                            onchange="change1check(this,'z16')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z16_b" runat="server" id="Label27">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z16_b" runat="server"
                            onchange="change1check(this,'z16')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z16_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z16_c" runat="server"
                            onchange="change1check(this,'z16')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.不满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z16_d" runat="server" id="Label28">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z16_d" runat="server"
                            onchange="change1check(this,'z16')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不坐班车
                        </p>
                    </div>
                </label>              
            </div>
            <div class="weui_cells_title" id="link17">
                <strong>
                    <asp:Label ID="label30" runat="server" Text="17.您对公司公寓环境设施是否满意？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z17_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z17_a" runat="server"
                            onchange="change1check(this,'z17')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z17_b" runat="server" id="Label31">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z17_b" runat="server"
                            onchange="change1check(this,'z17')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z17_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z17_c" runat="server"
                            onchange="change1check(this,'z17')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.不满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z17_d" runat="server" id="Label32">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z17_d" runat="server"
                            onchange="change1check(this,'z17')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不住公寓
                        </p>
                    </div>
                </label>

            </div>
            <div class="weui_cells_title" id="link18">
                <strong>
                    <asp:Label ID="label34" runat="server" Text="18.您对工作餐的质量感到满意吗？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z18_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z18_a" runat="server"
                            onchange="change1check(this,'z18')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z18_b" runat="server" id="Label35">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z18_b" runat="server"
                            onchange="change1check(this,'z18')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z18_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z18_c" runat="server"
                            onchange="change1check(this,'z18')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.不满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z18_d" runat="server" id="Label36">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z18_d" runat="server"
                            onchange="change1check(this,'z18')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.无所谓
                        </p>
                    </div>
                </label>

            </div>
            <div class="weui_cells_title" id="link19">
                <strong>
                    <asp:Label ID="label38" runat="server" Text="19.您对公司医务室提供的医疗服务感到满意吗？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z19_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z19_a" runat="server"
                            onchange="change1check(this,'z19')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z19_b" runat="server" id="Label39">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z19_b" runat="server"
                            onchange="change1check(this,'z19')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z19_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z19_c" runat="server"
                            onchange="change1check(this,'z19')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.不满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z19_d" runat="server" id="Label40">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z19_d" runat="server"
                            onchange="change1check(this,'z19')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不清楚
                        </p>
                    </div>
                </label>
              
            </div>
            <div class="weui_cells_title" id="link20">
                <strong>
                    <asp:Label ID="label42" runat="server" Text="20.您对工会为维护广大员工合法权益所做的工作感到满意吗？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z20_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z20_a" runat="server"
                            onchange="change1check(this,'z20')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z20_b" runat="server" id="Label43">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z20_b" runat="server"
                            onchange="change1check(this,'z20')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.一般
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z20_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z20_c" runat="server"
                            onchange="change1check(this,'z20')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.不满意</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z20_d" runat="server" id="Label44">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z20_d" runat="server"
                            onchange="change1check(this,'z20')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.不清楚
                        </p>
                    </div>
                </label>             
            </div>          
               <div class="weui_media_box weui_media_text">
                   <strong>二、开放题:
             </strong>
             </div>
                   <div class="weui_cells_title" id="link25">
                <strong>
                    <asp:Label ID="label688" runat="server" Text="1.列出您以上20道单选题中最不满意问题的具体原因："></asp:Label></strong>
            </div>
                <div class="weui_cells weui_cells_form">
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">          
             
                <textarea class="weui_textarea" placeholder="请输入建议（200字以内）" 
                    maxlength="200" runat="server" id="yijian" onkeydown="checkMaxInput(this)"  
            onkeyup="checkMaxInput(this)" onfocus="checkMaxInput(this)" 
                    onblur="checkMaxInput(this);" 
                    style="background-color: #FFFFFF; height: 75px;"></textarea>
                <div class="weui_textarea_counter"><span><asp:Label ID="Label68" runat="server" Text="0"></asp:Label></span>/200</div>
            </div>
        </div>
    </div>
               <div class="weui_cells_title" id="link26">
                <strong>
                    <asp:Label ID="label299" runat="server" Text="2.如果您有一些我们未在调查表中列出的观点需要表达，请将您的意见或建议写在下面："></asp:Label></strong>
            </div>
                            <div class="weui_cells weui_cells_form">
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">          
             
                <textarea class="weui_textarea" placeholder="请输入（200字以内）" 
                    maxlength="200" runat="server" id="yijian1" onkeydown="check1MaxInput(this)"  
            onkeyup="check1MaxInput(this)" onfocus="check1MaxInput(this)" 
                    onblur="check1MaxInput(this);" 
                    style="background-color: #FFFFFF; height: 75px;"></textarea>
                <div class="weui_textarea_counter"><span><asp:Label ID="Label2999" runat="server" Text="0"></asp:Label></span>/200</div>
            </div>
        </div>
    </div>
        </div>

        <div class="weui_media_box weui_media_text" id="link28">
            <ul class="weui_media_info">
                <li class="weui_media_info_meta" style="font-size: 10px">发起:<asp:Label ID="Labelvoteoper" runat="server" Text="人事科"></asp:Label></li>
                <li class="weui_media_info_meta" style="font-size: 10px">截止时间:<asp:Label ID="Labellimittime" runat="server" Text="2016-10-29 13:00"></asp:Label></li>
            </ul>
        </div>
        <asp:Button ID="Button1" runat="server" Text="提交" CssClass="weui_btn weui_btn_primary"
            OnClick="Button1_Click" />
        <asp:Label ID="classworkmaker_B" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="classworkmaker_B_S" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="staffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="newstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="nowstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="chaoqi" runat="server" ForeColor="Red" Visible="False"></asp:Label>
             <a href="#link1" id="A1" ></a>
              <a href="#link2" id="A2" ></a>
               <a href="#link3" id="A3" ></a>
                <a href="#link4" id="A4" ></a>
                 <a href="#link5" id="A5" ></a>
                  <a href="#link6" id="A6" ></a>
                   <a href="#link7" id="A7" ></a>
                    <a href="#link8" id="A8" ></a>
                     <a href="#link9" id="A9" ></a>
                      <a href="#link10" id="A10" ></a>
                       <a href="#link11" id="A11" ></a>
                        <a href="#link12" id="A12" ></a>
                         <a href="#link13" id="A13" ></a>
                          <a href="#link14" id="A14" ></a>
                           <a href="#link15" id="A15" ></a>
                            <a href="#link16" id="A16" ></a>
                             <a href="#link17" id="A17" ></a>
                              <a href="#link18" id="A18" ></a>
                               <a href="#link19" id="A19" ></a>
                                <a href="#link20" id="A20" ></a>
                                 <a href="#link21" id="A21" ></a>
                                  <a href="#link22" id="A22" ></a>
                                   <a href="#link23" id="A23" ></a>
                                    <a href="#link24" id="A24" ></a>
                                     <a href="#link25" id="A25" ></a>
                                      <a href="#link26" id="A26" ></a>
                                       <a href="#link27" id="A27" ></a>
                                         <a href="#link28" id="A28" ></a>
    </form>
</body>
</html>

