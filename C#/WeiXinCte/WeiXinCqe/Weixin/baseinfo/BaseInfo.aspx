<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BaseInfo.aspx.cs" Inherits="WebApplication7.WebForm3" MaintainScrollPositionOnPostBack="true"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>基本信息</title>
    <link rel="stylesheet" href="/style/weui.css" />
    <script language="JAVASCRIPT">

        function aclick(strvalue) {
            document.getElementById('Hidden1').value = strvalue;
            document.getElementById('ImageButton1').click();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
 
        <input id="Hidden1" type="hidden" runat="server" />
        <div class="bd" style="height: 100%;">
            <div class="weui_tab">
                <div class="weui_navbar">
                    <div id="divlabel1" class="weui_navbar_item "  style="cursor:pointer" onclick="aclick('个人信息')" runat="server" >
                        <asp:Label ID="Label1" runat="server" Text="个人" ></asp:Label>
                    </div>
                    <div id="divlabel2" class="weui_navbar_item "  style="cursor:pointer"   onclick="aclick('工作信息')" runat="server">
                        <asp:Label ID="Label2" runat="server" Text="工作"></asp:Label>
                    </div>
                    <div id="divlabel3" class="weui_navbar_item" style="cursor:pointer"  onclick="aclick('联络信息')" runat="server">
                        <asp:Label ID="Label3" runat="server" Text="联络"></asp:Label>
                    </div>
                    <div id="divlabel4" class="weui_navbar_item" style="cursor:pointer"  onclick="aclick('年假信息')" runat="server">
                        <asp:Label ID="Label5" runat="server" Text="年假"></asp:Label>
                    </div>
                    <div id="divlabel5" class="weui_navbar_item" style="cursor:pointer"  onclick="aclick('学历信息')" runat="server">
                        <asp:Label ID="Label6" runat="server" Text="学历"></asp:Label>
                    </div>
                    <div id="divlabel6" class="weui_navbar_item" style="cursor:pointer"  onclick="aclick('账号信息')" runat="server">
                        <asp:Label ID="Label7" runat="server" Text="账号"></asp:Label>
                    </div>
                    <div id="divlabel7" class="weui_navbar_item" style="cursor:pointer"  onclick="aclick('基数信息')" runat="server">
                        <asp:Label ID="Label13" runat="server" Text="基数"></asp:Label>
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
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        姓名:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_JiBen_Name" runat="server" Text=""></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        身份证号:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_JiBen_Sfz" runat="server"></asp:Label></strong></div>
            </div>
        
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        民族:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_JiBen_Nation" runat="server" Text=""></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        性别:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_JiBen_Sex" runat="server" Text=""></asp:Label></strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        出生日期:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_JiBen_Birthday" runat="server" Text=""></asp:Label></strong>
                </div>
            </div>
            <div class="weui_cell weui_cell_select weui_select_after">
                <div class="weui_cell_hd">
                    <label for="" class="weui_label" style="color: #996633">生日福利:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <select class="weui_select" name="selectB" runat="server" id="selectB" style="color: #996633;font-weight: bold">
                        <option value="丹香蛋糕券">丹香蛋糕券</option>
                        <option value="丹香储值卡">丹香储值卡</option>
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="weui_cell weui_cell_select weui_select_after">
                <div class="weui_cell_hd">
                    <label for="" class="weui_label" style="color: #996633">
                        婚姻状况:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <select class="weui_select" name="selectM" runat="server" id="selectM" style="color: #996633;font-weight: bold">
                        <option value="未婚">未婚</option>
                        <option value="已婚">已婚</option>
                        <option value="离婚">离婚</option>
                        <option value="丧偶">丧偶</option>
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label"> 户籍类别:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong><asp:Label ID="Label_JiBen_HuJILeiBie" runat="server" Text=""></asp:Label></strong>
                    <asp:Label ID="Label_JiBen_Marriage" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="Label_JiBen_Welfare" runat="server" Visible="False"></asp:Label>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        户籍所在地:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_JiBen_HuJi" runat="server"></asp:Label></strong></div>
            </div>
             
            <asp:Button ID="Label_JiBen_Button" runat="server" Text="保存" CssClass="weui_btn weui_btn_primary"
                ToolTip="保存修改的婚姻状况" onclick="Label_JiBen_Button_Click" />
        </div>
        <div class="weui_cells weui_cells_form" id="divgongzuo" runat="server">
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
                        转正日期:</label></div>
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
                        通勤方式:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Communication" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        其他工龄:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Old" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        人员类别1:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Type1" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        人员类别2:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Type2" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        合同次数:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Contract" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        合同到期:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Contract_Date" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label" style="color: #996633">
                        办公电话:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_Tel" runat="server" Visible="False"></asp:Label>
                           <input class="weui_input" id="TextBox_GongZuo_Tel" runat="server" 
                        type="text" 
                        placeholder="请输入办公电话(3位)" style="color: #996633;font-weight: bold" maxlength="3" />
                    </strong>
                </div>
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
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        部门全称:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_GongZuo_DeptLongName" runat="server"></asp:Label></strong></div>
            </div>
            <asp:Button ID="Label_GongZuo_Button" runat="server" Text="保存" CssClass="weui_btn weui_btn_primary"
                ToolTip="保存修改的办公电话" onclick="Label_GongZuo_Button_Click" />
        </div>
        <div class="weui_cells weui_cells_form" id="divlianluo" runat="server">
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label" style="color: #996633">
                        手机:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_LianLuo_Mobile" runat="server" Visible="False"></asp:Label>
                           <input class="weui_input" id="TextBox_LianLuo_Mobile" runat="server"   type="text" 
                        placeholder="请输入11位手机号" style="color: #996633;font-weight: bold" maxlength="11" />
                          

                    </strong>
                </div>
               
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label"  style="color: #996633">
                        &nbsp;家庭电话:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_LianLuo_Home_Tel" runat="server" Visible="False"></asp:Label>
                     <input class="weui_input" id="TextBox_LianLuo_Home_Tel" runat="server"   type="text" 
                        placeholder="请输入电话(区号电话号)" style="color: #996633;font-weight: bold" maxlength="12" />
                    </strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label" style="color: #996633">
                        紧急联络人:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_LianLuo_E_To" runat="server" Visible="False"></asp:Label>
                   <input class="weui_input" id="TextBox_LianLuo_E_To" runat="server"   type="text" 
                        placeholder="请输入紧急联络人姓名" style="color: #996633;font-weight: bold" maxlength="20" />
                    </strong>
                </div>

            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label" style="color: #996633">
                        紧急电话:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_LianLuo_E_Tel" runat="server" Visible="False"></asp:Label>
                                       <input class="weui_input" id="TextBox_LianLuo_E_Tel" runat="server"   type="text" 
                        placeholder="请输入电话/手机" style="color: #996633;font-weight: bold" maxlength="12" />
                    </strong>
                </div>
                
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label" style="color: #996633">
                        家庭住址:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_LianLuo_Address" runat="server" Visible="False"></asp:Label>
                     <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
                                       <input class="weui_input" id="TextBox_LianLuo_Address" runat="server"   type="text" 
                        placeholder="请输入家庭住址" style="color: #996633;font-weight: bold" maxlength="100" />
          
                    </strong>
                </div>
            </div>
            <asp:Button ID="Label_LianLuo_Button" runat="server" Text="保存" CssClass="weui_btn weui_btn_primary"
                ToolTip="保存修改的信息" onclick="Label_LianLuo_Button_Click" />
        </div>
        <div class="weui_cells weui_cells_form" id="divnianji" runat="server">
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        年份:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_NianJia_Yyyy" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        工龄:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_NianJia_Gl" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        应休:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_NianJia_Nj" runat="server"></asp:Label></strong>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        已休:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_NianJia_Pnj" runat="server"></asp:Label></strong>&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton_NianJian" runat="server" Font-Size="9pt" 
                        onclick="LinkButton_NianJian_Click" ToolTip="点击查看已休年假的详细信息" 
                        Font-Bold="True">查看明细&gt;&gt;</asp:LinkButton></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        年假说明:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_NianJia_Memo" runat="server"></asp:Label></strong></div>
            </div>
        </div>
        <div class="weui_cells weui_cells_form" id="divxueli" runat="server">
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        学历:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_XueLi_Academic" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        学位:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_XueLi_Degree" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        毕业学校:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_XueLi_School" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        毕业时间:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_XueLi_G_Date" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        英语能力:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_XueLi_English" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        日语能力:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_XueLi_Japanese" runat="server"></asp:Label></strong></div>
            </div>
        </div>
        <div class="weui_cells weui_cells_form" id="divzhanghao" runat="server">
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        公积金:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_ZhangHao_Gjj" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        社保:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_ZhangHao_Sb" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">              
                    <asp:Label ID="Label_S" runat="server" Text="工资卡号:" Visible="False"></asp:Label>  
                    <asp:Label ID="Label_S_T" runat="server" Text="工资卡号:" ForeColor="#996633"></asp:Label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="TextBox_ZhangHao_Slr" runat="server" type="text" 
                        placeholder="请输入工资卡号" style="color: #996633;font-weight: bold" maxlength="19" />
                    <asp:Label ID="Label_ZhangHao_Slr" runat="server" Visible="False"></asp:Label></div>
            </div>
            <asp:Button ID="Label_ZhangHao_Button" runat="server" Text="保存" CssClass="weui_btn weui_btn_primary"
                ToolTip="保存修改的工资卡号" onclick="Label_ZhangHao_Button_Click" />
        </div>
        <div class="weui_cells weui_cells_form" id="divjishu" runat="server">
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        基本工资:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_JiShu_BasePay" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        加班基数:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_JiShu_BasePayJs" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        社保基数:</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_JiShu_SbIndex" runat="server"></asp:Label></strong></div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd">
                    <label class="weui_label">
                        公积金基数:
                    </label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <strong>
                        <asp:Label ID="Label_JiShu_GjjIndex" runat="server"></asp:Label></strong></div>
            </div>
        </div>
         <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" 
            Height="0px" Width="0px" />
        <asp:Label ID="staffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="newstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="nowstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="chaoqi" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="deviceid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="staffname" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    </form>
</body>
</html>
