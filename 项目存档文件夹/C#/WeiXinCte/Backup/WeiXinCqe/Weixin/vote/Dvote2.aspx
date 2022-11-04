<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dvote2.aspx.cs" Inherits="WeiXinCqe.Weixin.vote.Dvote2"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>CQE第三届运动会赛后调查</title>
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

                if (aControl.id != ss + "_e")
                    document.getElementById(ss + "_e").checked = false;
            }
        }


        function change2check(aControl, ss) {
            if (aControl.checked) {

                var i = 0;

                if (document.getElementById(ss + "_a").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_b").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_c").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_d").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_e").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_f").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_g").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_h").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_i").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_j").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_k").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_l").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_m").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_n").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_o").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_p").checked)
                    i = i + 1;
                if (document.getElementById(ss + "_q").checked)
                    i = i + 1;
                if (i > 3) {
                    aControl.checked = false;
                    alert('只能选择3个');
                   
                }
            }
        }

        function checkMaxInput(obj)
         {
             document.getElementById("Label68").innerHTML = obj.value.length;
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
                <asp:Label ID="Label15" runat="server" Text="CQE第三届运动会赛后调查"></asp:Label>
                <asp:Label ID="Label16" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="weui_cells_title" id="link1">
            <strong>
                <asp:Label ID="label_1" runat="server" Text="1.	您是否参加了本届运动会？（选“是”继续）"></asp:Label></strong>
        </div>
        <div class="weui_cells weui_cells_checkbox">
            <label class="weui_cell weui_check_label" for="z1_a">
                <div class="weui_cell_hd">
                    <input type="checkbox" class="weui_check" name="checkbox1" id="z1_a" runat="server"
                        onchange="changecheck(this,'z1_b')">
                    <i class="weui_icon_checked"></i>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <p>
                        A.是</p>
                </div>
            </label>
            <label class="weui_cell weui_check_label" for="z1_b" runat="server" id="zaodai">
                <div class="weui_cell_hd">
                    <input type="checkbox" name="checkbox1" class="weui_check" id="z1_b" runat="server"
                        onchange="changecheck(this,'z1_a')">
                    <i class="weui_icon_checked"></i>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <p>
                        B.否</p>
                </div>
            </label>
        </div>
        <div id="nextdiv" runat="server" visible="false">
            <div class="weui_cells_title" id="link2">
                <strong>
                    <asp:Label ID="label_2" runat="server" Text="2.	您是否参加了比赛项目？"></asp:Label></strong>
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
                            A.是</p>
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
                            B.否</p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link3">
                <strong>
                    <asp:Label ID="label_3" runat="server" Text="3.	您对本届运动会的运动项目设置是否满意？"></asp:Label></strong>
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
                            A.1分（非常不满意）</p>
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
                            B.2分（不太满意）
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
                            C.3分（一般）</p>
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
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z3_e" runat="server" id="Label2">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z3_e" runat="server"
                            onchange="change1check(this,'z3')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link4">
                <strong>
                    <asp:Label ID="label_4" runat="server" Text="4.	您最喜欢的3个运动项目是？ "></asp:Label></strong>
            </div>
        <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z4_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z4_a" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.100 米短跑</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z4_b" runat="server" id="Label5">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_b" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.4×100 米接力
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z4_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z4_c" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.4×100 米接力（科长经理混合组）</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z4_d" runat="server" id="Label6">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_d" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.400 米短跑</p>
                    </div>
                </label>

        <label class="weui_cell weui_check_label" for="z4_e" runat="server" id="Label661">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_e" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.4×400 米接力</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z4_f" runat="server" id="Label6662">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_f" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            F.托球跑</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z4_g" runat="server" id="Label663">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_g" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            G.摸石过河</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z4_h" runat="server" id="Label6664">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_h" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            H.慢骑自行车</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z4_i" runat="server" id="Label665">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_i" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            I.指压板跳绳</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z4_j" runat="server" id="Label6666">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_j" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            J.袋鼠跳</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z4_k" runat="server" id="Label6667">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_k" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            K.夺宝奇兵</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z4_l" runat="server" id="Label6668">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_l" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            L.跳大绳</p>
                    </div>
                </label>

        <label class="weui_cell weui_check_label" for="z4_m" runat="server" id="Label6669">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_m" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            M.齐头并进</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z4_n" runat="server" id="Label6610">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_n" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            N.二龙戏珠</p>
                    </div>
                </label>

        <label class="weui_cell weui_check_label" for="z4_o" runat="server" id="Label6611">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_o" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            O.拔河</p>
                    </div>
                </label>

        <label class="weui_cell weui_check_label" for="z4_p" runat="server" id="Label6612">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_p" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            P.倒跑接力</p>
                    </div>
                </label>

        <label class="weui_cell weui_check_label" for="z4_q" runat="server" id="Label6613">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_q" runat="server"
                            onchange="change2check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            Q.腿夹球接力</p>
                    </div>
                </label>
                
            </div>

            <div class="weui_cells_title" id="link5">
                <strong>
                    <asp:Label ID="label_5" runat="server" Text="5.	您最不喜欢的3个运动项目是？ "></asp:Label></strong>
            </div>
     <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z5_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z5_a" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.100 米短跑</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z5_b" runat="server" id="Label7">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_b" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.4×100 米接力
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z5_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z5_c" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.4×100 米接力（科长经理混合组）</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z5_d" runat="server" id="Label8">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_d" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.400 米短跑</p>
                    </div>
                </label>

        <label class="weui_cell weui_check_label" for="z5_e" runat="server" id="Label681">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_e" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.4×400 米接力</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z5_f" runat="server" id="Label69">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_f" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            F.托球跑</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z5_g" runat="server" id="Label70">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_g" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            G.摸石过河</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z5_h" runat="server" id="Label71">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_h" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            H.慢骑自行车</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z5_i" runat="server" id="Label72">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_i" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            I.指压板跳绳</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z5_j" runat="server" id="Label73">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_j" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            J.袋鼠跳</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z5_k" runat="server" id="Label74">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_k" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            K.夺宝奇兵</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z5_l" runat="server" id="Label75">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_l" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            L.跳大绳</p>
                    </div>
                </label>

        <label class="weui_cell weui_check_label" for="z5_m" runat="server" id="Label76">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_m" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            M.齐头并进</p>
                    </div>
                </label>


        <label class="weui_cell weui_check_label" for="z5_n" runat="server" id="Label77">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_n" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            N.二龙戏珠</p>
                    </div>
                </label>

        <label class="weui_cell weui_check_label" for="z5_o" runat="server" id="Label78">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_o" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            O.拔河</p>
                    </div>
                </label>

        <label class="weui_cell weui_check_label" for="z5_p" runat="server" id="Label79">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_p" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            P.倒跑接力</p>
                    </div>
                </label>

        <label class="weui_cell weui_check_label" for="z5_q" runat="server" id="Label80">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_q" runat="server"
                            onchange="change2check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            Q.腿夹球接力</p>
                    </div>
                </label>


            </div>

            <div class="weui_cells_title" id="link6">
                <strong>
                    <asp:Label ID="label_6" runat="server" Text="6.	您对本届运动会的竞赛奖品设置是否满意"></asp:Label></strong>
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
                            A.1分（非常不满意）</p>
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
                            B.2分（不太满意）
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
                            C.3分（一般）</p>
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
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z6_e" runat="server" id="Label17">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z6_e" runat="server"
                            onchange="change1check(this,'z6')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link7">
                <strong>
                    <asp:Label ID="label_7" runat="server" Text="7.	您对本届运动会的抽奖环节设置是否满意？"></asp:Label></strong>
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
                            A.1分（非常不满意）</p>
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
                            B.2分（不太满意）
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
                            C.3分（一般）</p>
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
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z7_e" runat="server" id="Label19">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z7_e" runat="server"
                            onchange="change1check(this,'z7')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link8">
                <strong>
                    <asp:Label ID="label_8" runat="server" Text="8.	您对本届运动会的会场秩序是否满意？"></asp:Label></strong>
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
                            A.1分（非常不满意）</p>
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
                            B.2分（不太满意）
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
                            C.3分（一般）</p>
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
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z8_e" runat="server" id="Label21">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z8_e" runat="server"
                            onchange="change1check(this,'z8')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link9">
                <strong>
                    <asp:Label ID="label_9" runat="server" Text="9.	您对本届运动会的开幕式是否满意？"></asp:Label></strong>
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
                            A.1分（非常不满意）</p>
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
                            B.2分（不太满意）
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
                            C.3分（一般）</p>
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
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z9_e" runat="server" id="Label23">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z9_e" runat="server"
                            onchange="change1check(this,'z9')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link10">
                <strong>
                    <asp:Label ID="label_10" runat="server" Text="10.	您对本届运动会的闭幕式是否满意？"></asp:Label></strong>
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
                            A.1分（非常不满意）</p>
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
                            B.2分（不太满意）
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
                            C.3分（一般）</p>
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
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z10_e" runat="server" id="Label25">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z10_e" runat="server"
                            onchange="change1check(this,'z10')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link11">
                <strong>
                    <asp:Label ID="label54" runat="server" Text="11.	您对运动会工作人员是否满意？"></asp:Label></strong>
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
                            A.是</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z11_b" runat="server" id="Label55">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z11_b" runat="server"
                            onchange="change1check(this,'z11')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.否
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link12">
                <strong>
                    <asp:Label ID="label56" runat="server" Text="12.	您在赛前是否知晓自己在哪个参赛队？"></asp:Label></strong>
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
                            A.是</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z12_b" runat="server" id="Label57">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z12_b" runat="server"
                            onchange="change1check(this,'z12')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.否
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link13">
                <strong>
                    <asp:Label ID="label58" runat="server" Text="13.	您在赛前是否通过微信或电脑了解了运动会相关的各项规则说明？"></asp:Label></strong>
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
                            A.是</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z13_b" runat="server" id="Label59">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z13_b" runat="server"
                            onchange="change1check(this,'z13')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.否
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link14">
                <strong>
                    <asp:Label ID="label60" runat="server" Text="14.	您在赛前是否认识了自己的领队？"></asp:Label></strong>
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
                            A.是</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z14_b" runat="server" id="Label61">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z14_b" runat="server"
                            onchange="change1check(this,'z14')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.否
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title"  id="link15">
                <strong>
                    <asp:Label ID="label62" runat="server" Text="15.	领队在赛前向您做出了关于秩序及规则的说明？"></asp:Label></strong>
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
                            A.是</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z15_b" runat="server" id="Label63">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z15_b" runat="server"
                            onchange="change1check(this,'z15')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.否
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title"  id="link16">
                <strong>
                    <asp:Label ID="label26" runat="server" Text="16.	您对领队在报名阶段的工作是否满意？"></asp:Label></strong>
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
                            A.1分（非常不满意）</p>
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
                            B.2分（不太满意）
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
                            C.3分（一般）</p>
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
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z16_e" runat="server" id="Label29">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z16_e" runat="server"
                            onchange="change1check(this,'z16')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link17">
                <strong>
                    <asp:Label ID="label30" runat="server" Text="17.	您对领队在开幕式策划方面的工作是否满意？"></asp:Label></strong>
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
                            A.1分（非常不满意）</p>
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
                            B.2分（不太满意）
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
                            C.3分（一般）</p>
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
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z17_e" runat="server" id="Label33">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z17_e" runat="server"
                            onchange="change1check(this,'z17')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link18">
                <strong>
                    <asp:Label ID="label34" runat="server" Text="18.	您对领队在秩序管理方面的工作是否满意？"></asp:Label></strong>
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
                            A.1分（非常不满意）</p>
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
                            B.2分（不太满意）
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
                            C.3分（一般）</p>
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
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z18_e" runat="server" id="Label37">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z18_e" runat="server"
                            onchange="change1check(this,'z18')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link19">
                <strong>
                    <asp:Label ID="label38" runat="server" Text="19.	您对领队在运动员赛前检录通知调度方面的工作是否满意？"></asp:Label></strong>
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
                            A.1分（非常不满意）</p>
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
                            B.2分（不太满意）
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
                            C.3分（一般）</p>
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
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z19_e" runat="server" id="Label41">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z19_e" runat="server"
                            onchange="change1check(this,'z19')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link20">
                <strong>
                    <asp:Label ID="label42" runat="server" Text="20.	您对领队在场地卫生方面的工作是否满意？"></asp:Label></strong>
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
                            A.1分（非常不满意）</p>
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
                            B.2分（不太满意）
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
                            C.3分（一般）</p>
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
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z20_e" runat="server" id="Label45">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z20_e" runat="server"
                            onchange="change1check(this,'z20')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link21">
                <strong>
                    <asp:Label ID="label46" runat="server" Text="21.	您对领队在促进团队文化、鼓舞士气方面的工作是否满意？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z21_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z21_a" runat="server"
                            onchange="change1check(this,'z21')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.1分（非常不满意）</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z21_b" runat="server" id="Label47">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z21_b" runat="server"
                            onchange="change1check(this,'z21')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.2分（不太满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z21_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z21_c" runat="server"
                            onchange="change1check(this,'z21')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.3分（一般）</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z21_d" runat="server" id="Label48">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z21_d" runat="server"
                            onchange="change1check(this,'z21')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z21_e" runat="server" id="Label49">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z21_e" runat="server"
                            onchange="change1check(this,'z21')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link22">
                <strong>
                    <asp:Label ID="label64" runat="server" Text="22.	您认为本届运动会是否能展现CQE职工良好的素养？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z22_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z22_a" runat="server"
                            onchange="change1check(this,'z22')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.是</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z22_b" runat="server" id="Label65">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z22_b" runat="server"
                            onchange="change1check(this,'z22')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.否
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link23">
                <strong>
                    <asp:Label ID="label66" runat="server" Text="23.	您认为本届运动会是否有利于CQE企业文化的建设和提高？"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z23_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z23_a" runat="server"
                            onchange="change1check(this,'z23')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.是</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z23_b" runat="server" id="Label67">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z23_b" runat="server"
                            onchange="change1check(this,'z23')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.否
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title" id="link24">
                <strong>
                    <asp:Label ID="label50" runat="server" Text="24.	您对本届运动会的总体印象是"></asp:Label></strong>
            </div>
            <div class="weui_cells weui_cells_checkbox">
                <label class="weui_cell weui_check_label" for="z24_a">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z24_a" runat="server"
                            onchange="change1check(this,'z24')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            A.1分（非常不满意）</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z24_b" runat="server" id="Label51">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z24_b" runat="server"
                            onchange="change1check(this,'z24')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.2分（不太满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z24_c">
                    <div class="weui_cell_hd">
                        <input type="checkbox" class="weui_check" name="checkbox1" id="z24_c" runat="server"
                            onchange="change1check(this,'z24')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            C.3分（一般）</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z24_d" runat="server" id="Label52">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z24_d" runat="server"
                            onchange="change1check(this,'z24')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.4分（比较满意）
                        </p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z24_e" runat="server" id="Label53">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z24_e" runat="server"
                            onchange="change1check(this,'z24')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            E.5分（非常满意）
                        </p>
                    </div>
                </label>
            </div>

                   <div class="weui_cells_title" id="link25">
                <strong>
                    <asp:Label ID="label688" runat="server" Text="25.	您对公司举办运动会的意见和建议？"></asp:Label></strong>
            </div>
                <div class="weui_cells weui_cells_form">
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">          
             
                <textarea class="weui_textarea" placeholder="请输入建议（200字以内）" rows="5" 
                    maxlength="200" runat="server" id="yijian" onkeydown="checkMaxInput(this)"  
            onkeyup="checkMaxInput(this)" onfocus="checkMaxInput(this)" 
                    onblur="checkMaxInput(this);" style="background-color: #FFFFFF;"></textarea>
                <div class="weui_textarea_counter"><span><asp:Label ID="Label68" runat="server" Text="0"></asp:Label></span>/200</div>
            </div>
        </div>
    </div>
        </div>
        <div class="weui_media_box weui_media_text" id="link26">
            <ul class="weui_media_info">
                <li class="weui_media_info_meta">发起:筹委会</li>
                <li class="weui_media_info_meta">截止时间:<asp:Label ID="Labellimittime" runat="server" Text="2016-10-29 13:00"></asp:Label></li>
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
        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" Style="height: 16px"
            Height="0px" Width="1px" />
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

    </form>
</body>
</html>
