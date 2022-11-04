<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dvote.aspx.cs" Inherits="WeiXinCqe.Dvote"    MaintainScrollPositionOnPostBack="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>运动会调查问卷</title>
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
        <div class="weui_panel">
            <div class="style1" style="font-size: large; font-weight: bold;">
                <asp:Label ID="Label15" runat="server" Text="运动会调查问卷"></asp:Label>
                <asp:Label ID="Label16" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="weui_cells_title">
            <strong>
                <asp:Label ID="label_1" runat="server" Text="1.	您是否想带孩子参加公司运动会？"></asp:Label></strong>
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
                        A.想</p>
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
                        B.不想</p>
                </div>
            </label>
        </div>
        <div id="nextdiv" runat="server" visible="false">
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label_2" runat="server" Text="2.	带孩子参加公司运动会的原因是："></asp:Label></strong>
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
                            A.没有人看孩子</p>
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
                            B.有利于孩子成长或得到快乐</p>
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
                            C.其他</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z2_d" runat="server" id="Label2">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z2_d" runat="server"
                            onchange="change1check(this,'z2')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.没考虑过具体原因</p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label_3" runat="server" Text="3.您认为孩子在运动会上："></asp:Label></strong>
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
                            A.应该遵守观众秩序、文明观赛</p>
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
                            B.难以保证完全遵守，但确保不影响其他人</p>
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
                            C.难以保证不影响其他人</p>
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
                            D.不应该约束，应该自由活动</p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label_4" runat="server" Text="4.您认为孩子在运动会上："></asp:Label></strong>
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
                            A.能够完全听话</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z4_b" runat="server" id="Label5">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_b" runat="server"
                            onchange="change1check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.会受其他孩子影响变得不听话
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
                            C.应该会不听话</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z4_d" runat="server" id="Label6">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z4_d" runat="server"
                            onchange="change1check(this,'z4')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.没想过要约束孩子的行为</p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label_5" runat="server" Text="5.您认为孩子在运动会上的秩序应该由谁负责："></asp:Label></strong>
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
                            A.家长</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z5_b" runat="server" id="Label7">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_b" runat="server"
                            onchange="change1check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>
                            B.公司
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
                            C.孩子自己</p>
                    </div>
                </label>
                <label class="weui_cell weui_check_label" for="z5_d" runat="server" id="Label8">
                    <div class="weui_cell_hd">
                        <input type="checkbox" name="checkbox1" class="weui_check" id="z5_d" runat="server"
                            onchange="change1check(this,'z5')">
                        <i class="weui_icon_checked"></i>
                    </div>
                    <div class="weui_cell_dd weui_cell_primary">
                        <p>
                            D.没考虑过，不知道</p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label_6" runat="server" Text="6.	您认为孩子在运动会上的安全应由谁负责："></asp:Label></strong>
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
                            A.家长</p>
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
                            B.公司
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
                            C.孩子自己</p>
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
                            D.没考虑过，不知道</p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label_7" runat="server" Text="7.如果孩子在运动场违反观众守则，影响秩序或安全，公司是否有权制止或驱逐"></asp:Label></strong>
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
                            A.有</p>
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
                            B.没有
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label_8" runat="server" Text="8.如果孩子不遵守秩序，到赛场玩耍，您认为"></asp:Label></strong>
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
                            A.对孩子和运动员都构成危险</p>
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
                            B.影响秩序但不存在危险
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
                            C.不认为有任何不良后果</p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label_9" runat="server" Text="9.如果孩子在运动会发生意外伤害，您认为"></asp:Label></strong>
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
                            A.由个人承担事故后果
                        </p>
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
                            B.由公司负担医疗费用
                        </p>
                    </div>
                </label>
            </div>
            <div class="weui_cells_title">
                <strong>
                    <asp:Label ID="label_10" runat="server" Text="10.如果孩子在运动会发生意外伤害，您认为"></asp:Label></strong>
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
                            A.由个人负责解决，不应影响活动进程
                        </p>
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
                            B.由公司安排专人负责解决
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
                            C.暂停后续活动进程，优先解决</p>
                    </div>
                </label>
            </div>
        </div>
        <div class="weui_media_box weui_media_text">
            <ul class="weui_media_info">
                <li class="weui_media_info_meta">发起:运动会筹委会</li>
                <li class="weui_media_info_meta">截止时间:2016-09-29 13:00</li>
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
    </form>
</body>
</html>
