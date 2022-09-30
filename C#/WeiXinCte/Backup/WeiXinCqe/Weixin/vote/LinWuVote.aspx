<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LinWuVote.aspx.cs" Inherits="WeiXinCqe.LinWuVote"  MaintainScrollPositionOnPostBack="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>运动会舞蹈队员招募通知</title>
    <link rel="stylesheet" href="/style/weui.css"/>
        <script language="javascript" type="text/javascript">
            
            function buttonclick() {
                if (confirm('确定要报名舞蹈队员吗?')) {
                    document.all('ImageButton1').click();
                }

            }
            function buttonclick1() {
                if (confirm('确定要取消报名舞蹈队员吗?')) {
                    document.all('ImageButton2').click();
                }

            }
    </script>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
      <div class="weui_panel">
        <div class="weui_panel_hd" style="font-size: large; font-weight: bold; color: #009900">第3届秋季运动会舞蹈队员招募</div>
           <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_text">         
                              <p  style="  color: #999999;  font-size: 13px;  line-height: 1.2;  overflow: hidden;  text-overflow: ellipsis;  display: -webkit-box;  -webkit-box-orient: vertical;  ">亲爱的各位同事<br>
为弘扬企业文化，展现CQE风采，给员工一个展示自己的舞台，我们公司的运动会正在筹备开场舞节目，现面向公司内部广大员工招募舞蹈队员。
<br/>                      
                                </p>
        <br/>
                <h4 class="weui_media_title">要求</h4>
                    <p class="weui_media_desc">爱好舞蹈表演，有一定舞蹈基础，有表演经验者优先。
</p>
          <br/>
                <h4 class="weui_media_title">服饰</h4>
                            <p class="weui_media_desc">公司提供服饰如下:</p>
                              <p class="weui_media_desc">
                                  <asp:Image ID="Image2" runat="server" Height="200px" 
                                      ImageUrl="~/Weixin/vote/image/fuzhuang.jpg" />
                              </p>

            </div>
        </div>
                <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_text">
                <h4 class="weui_media_title">截止时间</h4>
                <p class="weui_media_desc">报名截止时间:<asp:Label ID="Label_limittime" runat="server" 
                        Text="2016-08-30 17:50"></asp:Label>
                </p>

            </div>
        </div>

   
        <div class="weui_panel_bd">
            <div class="weui_media_box weui_media_text">
                <h4 class="weui_media_title">报名方式&nbsp;&nbsp;  <asp:Image ID="Image1" runat="server" 
                        ImageUrl="~/Weixin/vote/image/2.png" Height="28px" /></h4>
                         
                <p class="weui_media_desc" id="p1" runat="server" style="font-size: 14px">方式1:直接报名</p>
 
                   <p class="weui_media_desc"  id="p9" runat="server"><br/></p>
                       <p class="weui_media_desc" id="p3" runat="server">       
                           <asp:Button ID="Label_Button" runat="server" Text="我要报名" 
                               CssClass="weui_btn weui_btn_primary" onclick="Label_Button_Click"
            Visible="false"    /> <input id="Button2" type="button" value="我要报名"     class="weui_btn weui_btn_primary"  onclick="buttonclick()"/></p>
                             
                     <p class="weui_media_desc" id="p10" runat="server">       
                           <asp:Button ID="Button1" runat="server" Text="取消报名" 
                               CssClass="weui_btn weui_btn_warn" onclick="Label_Button1_Click"
                 Visible="false"/> <input id="Button3" type="button" value="取消报名"     class="weui_btn weui_btn_warn"  onclick="buttonclick1()"/></p>
       <p class="weui_media_desc"  id="p8" runat="server"><br/></p>
                           <p class="weui_media_desc" id="p5" runat="server" style="font-size: 14px">方式2:邮箱报名:
</p>
     <p class="weui_media_desc" id="p6" runat="server" style="font-size: 14px"> 
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; li.peng@mitsumi.co.jp&nbsp;
</p>
     <p class="weui_media_desc" id="p7" runat="server" style="font-size: 14px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meng.fankun@mitsumi.co.jp
</p>

                <p class="weui_media_desc" id="p2" runat="server" style="font-size: large; font-weight: bold; color: #0066FF">
                    <asp:Label ID="Label_Sumcount" runat="server" Text="已经报名人数:100人."></asp:Label>
                </p>
                    <p class="weui_media_desc" id="p4" runat="server"><br/></p>
                                         <ul class="weui_media_info">
                    <li class="weui_media_info_meta">发起:运动会筹委会</li>
                    <li class="weui_media_info_meta">时间:2016-09-13</li>
                                             <asp:ImageButton ID="ImageButton1" runat="server" onclick="ImageButton1_Click" 
                                                 Width="0px" />
                                                      <asp:ImageButton ID="ImageButton2" runat="server" onclick="ImageButton2_Click" 
                                                 Width="0px" />
                </ul>
            </div>
        </div>
       </div>
        </div>
    <asp:Label ID="WEIXIN_ID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="SIGN_ID" runat="server"   Visible="false"></asp:Label>
    <asp:Label ID="SIGN_WEIXINID" runat="server"   Visible="false"></asp:Label>
      <asp:Label ID="Label1" runat="server"   Visible="false"></asp:Label>
    </form>
</body>
</html>

