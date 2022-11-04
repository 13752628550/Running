<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rule01.aspx.cs" Inherits="WeiXinCqe.rule01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>CQE 第三届运动会</title>
    <link rel="stylesheet" href="/style/weui.css" />
    <style type="text/css">
        .style1
        {
            padding: 14px 15px 10px;
            color: #333333;
            font-size: 13px;
            position: relative;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="weui_panel">
            <div class="style1" style="font-size: large; font-weight: bold;">
                CQE 第三届运动会</div>
            <div class="weui_panel_bd">
           
                <div class="weui_media_box weui_media_text">
                     <h4 class="weui_media_title">
                        一.<asp:HyperLink ID="HyperLink29" runat="server" 
                                        Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="http://pan.baidu.com/s/1o7GGKVS">运动会整片下载</asp:HyperLink>
                      &nbsp;
                        <asp:ImageMap ID="ImageMap1" runat="server" 
                     ImageUrl="~/Weixin/rule/n4a11.gif">
                 </asp:ImageMap></h4>

                         <h4 class="weui_media_title">
                        二.<asp:HyperLink ID="HyperLink27" runat="server" 
                                        Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="http://m.youku.com/video/id_XMTgyOTA4MjgyNA==.html?refer=pc-sns-1&from=groupmessage">运动会短片在线浏览</asp:HyperLink>
                      &nbsp;
                       </h4>
                          <h4 class="weui_media_title">
                        三.<asp:HyperLink ID="HyperLink28" runat="server" 
                                        Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="http://pan.baidu.com/s/1o7GGKVS">运动会短片下载</asp:HyperLink>
                      &nbsp;
                     </h4>

                                <h4 class="weui_media_title">
                        四.<asp:HyperLink ID="HyperLink24" runat="server" 
                                        Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule25.aspx">运动会比赛结果</asp:HyperLink>
                      &nbsp;
                     </h4>
                            <h4 class="weui_media_title">
                        五.<asp:HyperLink ID="HyperLink25" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/vote/Dvote2.aspx">运动会调查问卷</asp:HyperLink>  &nbsp;
                
                    </h4>
                             <h4 class="weui_media_title">
                       六.<asp:HyperLink ID="HyperLink26" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="http://pan.baidu.com/s/1o7GGKVS">运动会照片</asp:HyperLink>  &nbsp;
                            
                    </h4>
                 <hr style="height:1px; border-top:1px solid #555555; border-width: thin; border-top-color: #C0C0C0; border-right-color: inherit; border-bottom-color: inherit; border-left-color: inherit; border-style: solid none none none;"/>

                    <h4 class="weui_media_title">
                        一.<asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule02.aspx">CQE第三届运动会竞赛规程</asp:HyperLink>
                    </h4>
                       <h4 class="weui_media_title">
                           二.<asp:HyperLink ID="HyperLink19" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule20.aspx">运动会医疗手册</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        三.<asp:HyperLink ID="HyperLink20" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule21.aspx">观众手册</asp:HyperLink>
                    </h4>
                    
                                 <h4 class="weui_media_title">
                                     四.<asp:HyperLink ID="HyperLink22" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule23.aspx">运动员手册</asp:HyperLink>
                    </h4>
                                 <h4 class="weui_media_title">
                                     五.<asp:HyperLink ID="HyperLink23" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule24.aspx">领队手册</asp:HyperLink>
                    </h4>
                       <h4 class="weui_media_title">
                           六.<asp:HyperLink ID="HyperLink18" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule19.aspx">各领队一览表</asp:HyperLink>
                    </h4>
                             <h4 class="weui_media_title">
                                 七.<asp:HyperLink ID="HyperLink21" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule22.aspx">调查问卷</asp:HyperLink>
                    </h4>
                       <hr style="height:1px; border-top:1px solid #555555; border-width: thin; border-top-color: #C0C0C0; border-right-color: inherit; border-bottom-color: inherit; border-left-color: inherit; border-style: solid none none none;"/>
                      <h4 class="weui_media_title">
                        八.<asp:HyperLink ID="HyperLink2" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule03.aspx">4X100米接力比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        九.<asp:HyperLink ID="HyperLink3" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule04.aspx">4X400米接力比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        十.<asp:HyperLink ID="HyperLink4" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule05.aspx">100 米短跑比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        十一.<asp:HyperLink ID="HyperLink5" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule06.aspx">400米短跑比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        十二.<asp:HyperLink ID="HyperLink6" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule07.aspx">拔河比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        十三.<asp:HyperLink ID="HyperLink7" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule08.aspx">袋鼠跳比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        十四.<asp:HyperLink ID="HyperLink8" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule09.aspx">倒跑接力比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        十五.<asp:HyperLink ID="HyperLink9" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule10.aspx">夺宝奇兵比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        十六.<asp:HyperLink ID="HyperLink10" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule11.aspx">二龙戏珠比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        十七.<asp:HyperLink ID="HyperLink11" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule12.aspx">摸石过河比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        十八.<asp:HyperLink ID="HyperLink12" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule13.aspx">齐头并进比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        十九.<asp:HyperLink ID="HyperLink13" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule14.aspx">跳大绳比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        二十.<asp:HyperLink ID="HyperLink14" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule15.aspx">腿夹球接力比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        二十一.<asp:HyperLink ID="HyperLink15" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule16.aspx">托球跑比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        二十二.<asp:HyperLink ID="HyperLink16" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule17.aspx">指压板跳绳比赛规则</asp:HyperLink>
                    </h4>
                    <h4 class="weui_media_title">
                        二十三.<asp:HyperLink ID="HyperLink17" runat="server" Font-Size="Large" ForeColor="#3399FF"
                            NavigateUrl="~/Weixin/rule/rule18.aspx">自行车慢骑比赛规则</asp:HyperLink>
                    </h4>      
                 
                </div>
            </div>
        </div>
      
        
    </div>
    </form>
</body>
</html>
