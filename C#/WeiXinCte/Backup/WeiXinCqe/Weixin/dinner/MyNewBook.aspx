<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyNewBook.aspx.cs" Inherits="WeiXinCqe.MyNewBook" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>预约就餐</title>
        
        <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css"/>
       <link rel="stylesheet" href="/bootstrap/css/bootstrap-datetimepicker.min.css"/>
 
    <link rel="stylesheet" href="/style/weui.css"/>

   <script type="text/javascript">
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

           }
           function change() {
               document.all('ImageButton1').click();
           }

       </script>
 

     


</head>
<body>
    <form id="form1" runat="server">
  
    
    <div class="weui_cells_title" >
           
           <div class="input-append date form_date" id="ash" data-date="2016-07-06" data-date-format="yyyy-mm-dd">
    <input size="16" type="text" value="2016-07-06" readonly>
    <span class="add-on"><i class="icon-th"></i></span>
</div>
           
        </div>
     
             <div class="weui_cells weui_cells_form">
                 <div class="weui_cells_title">
            <div class="weui_check_label">
               
                姓名:<strong><asp:Label 
                    ID="staffname" runat="server"></asp:Label>&nbsp;</strong>出勤日:<strong><asp:Label 
                    ID="yyyymmdd_t" runat="server"></asp:Label>
                </strong></div>
              
                 </div>
                          <div class="weui_cells_title">
            <div class="weui_check_label">
               
                    出勤状况：<strong><asp:Label 
                        ID="classworkmaker" runat="server"></asp:Label>
                    </strong>&nbsp;交替：<strong><asp:Label ID="classworktype" runat="server"></asp:Label>
                    </strong>&nbsp;</div>
              
                 </div>
                          <div class="weui_cells_title">
            <div class="weui_check_label">
               
                    加班计划：<strong><asp:Label 
                        ID="overtime_plan" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;  
                </strong>请假：<strong><asp:Label ID="timeoff_type" runat="server"></asp:Label></strong>
                              </div>
              
                 </div>
                        <div class="weui_cells_title">
            <div class="weui_check_label">
               
                <asp:Label ID="label_memo" runat="server" ForeColor="Red"></asp:Label>
               
                            </div>
              
                 </div>                 
    </div>
    <div class="weui_cells_title"><strong><asp:Label ID="label_zao" runat="server" 
            Text="早餐"></asp:Label></strong>
        <asp:Label ID="label_ZaoCan_Error" runat="server" ForeColor="Red"></asp:Label>
        </div>
            <div class="weui_cells weui_cells_checkbox" >
        <label class="weui_cell weui_check_label" for="zaocan_d" style="height: 35px">
            <div class="weui_cell_hd">
                <input type="checkbox" class="weui_check" name="checkbox1" id="zaocan_d" checked="checked" runat="server" onchange ="changecheck(this,'zaocan_x')">
                <i class="weui_icon_checked"></i>
            </div>
            <div class="weui_cell_bd weui_cell_primary">
                <p>就餐</p>
            </div>
        </label>
        <label class="weui_cell weui_check_label" for="zaocan_x" runat="server" id="zaodai" style="height: 35px">
            <div class="weui_cell_hd">
                <input type="checkbox" name="checkbox1" class="weui_check" id="zaocan_x" runat="server"  onchange ="changecheck(this,'zaocan_d')" >
                <i class="weui_icon_checked"></i>
            </div>
            <div class="weui_cell_bd weui_cell_primary">
                <p>外带</p>
            </div>
        </label>
    </div>
        <div class="weui_cells_title"><strong>
            <asp:Label ID="label_wu" runat="server" 
            Text="午餐"></asp:Label></strong>
        <asp:Label ID="label_WuCan_Error" runat="server" ForeColor="Red"></asp:Label>
        </div>
            <div class="weui_cells weui_cells_checkbox" >
        <label class="weui_cell weui_check_label" for="wucan_d" style="height: 35px">
            <div class="weui_cell_hd" >
                <input type="checkbox" class="weui_check" name="checkbox1" id="wucan_d" checked="checked" runat="server" >
                <i class="weui_icon_checked"></i>
            </div>
            <div class="weui_cell_bd weui_cell_primary" style="height: 30px">
                <p>就餐</p>
            </div>
        </label>
    </div>
        <div class="weui_cells_title"><strong>
            <asp:Label ID="label_wan" runat="server" 
            Text="晚餐"></asp:Label></strong>
        <asp:Label ID="label_WanCan_Error" runat="server" ForeColor="Red"></asp:Label>
        </div>
            <div class="weui_cells weui_cells_checkbox" >
        <label class="weui_cell weui_check_label" for="wancan_d" style="height: 35px">
            <div class="weui_cell_hd">
                <input type="checkbox" class="weui_check" name="wancan_d" id="wancan_d" checked="checked" runat="server" onchange ="changecheck(this,'wancan_x')">
                <i class="weui_icon_checked"></i>
            </div>
            <div class="weui_cell_bd weui_cell_primary">
                <p>就餐</p>
            </div>
        </label>
        <label class="weui_cell weui_check_label" for="wancan_x" runat="server" id="wandai" style="height: 35px">
            <div class="weui_cell_hd">
                <input type="checkbox" name="checkbox1" class="weui_check" id="wancan_x" runat="server"  onchange ="changecheck(this,'wancan_d')" >
                <i class="weui_icon_checked"></i>
            </div>
            <div class="weui_cell_bd weui_cell_primary">
                <p>外带</p>
            </div>
        </label>
    </div>
    <asp:Button ID="Button1" runat="server" Text="保存" 
            CssClass="weui_btn weui_btn_primary" onclick="Button1_Click"  />
        <asp:Label ID="classworkmaker_B" runat="server" ForeColor="Red" Visible="False"></asp:Label>
      <asp:Label ID="classworkmaker_B_S" runat="server" ForeColor="Red" 
          Visible="False"></asp:Label>
                 <asp:Label ID="staffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
      <asp:Label ID="newstaffid" runat="server" ForeColor="Red" 
          Visible="False"></asp:Label>
      <asp:Label ID="nowstaffid" runat="server" ForeColor="Red" 
          Visible="False"></asp:Label>
      <asp:Label ID="chaoqi" runat="server" ForeColor="Red" 
          Visible="False"></asp:Label>
        <strong>出勤日:</strong><asp:TextBox ID="TextBox1" 
            runat="server" Height="24px" Width="76px"></asp:TextBox>
                    <asp:Button ID="Button4" runat="server" Text="检索" 
            CssClass="weui_btn weui_btn_mini weui_btn_primary" onclick="Button4_Click" />
        &nbsp;&nbsp;<a class="weui_panel_ft" 
            href="MyDinner.aspx"><strong>我的预约</strong></a>
            <script type="text/javascript" src="/bootstrap/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

            <script type="text/javascript">

                                                              $('.form_date').datetimepicker({
                                                                  language: 'zh-CN',
                                                                  weekStart: 1,
                                                                  todayBtn: 1,
                                                                  autoclose: 1,
                                                                  todayHighlight: 1,
                                                                  startView: 2,
                                                                  minView: 2,
                                                                  forceParse: 0
                                                              });

</script>  <asp:ImageButton ID="ImageButton1" runat="server" 
                    onclick="ImageButton1_Click" Height="0px" Width="0px" /></form>
</body>
</html>
