<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dvote03.aspx.cs" Inherits="WeiXinCqe.Weixin.vote.Dvote03" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>自愿接种新冠疫苗调查</title>
    <link href="../../style2/weui.css" rel="stylesheet" />
    <link href="../../style2/weui.min.css" rel="stylesheet" />
    <style type="text/css">
        .weui-cells__title {
            font-size:17px;
            color:black;
        }
        .weui-check__label ,.page__desc{
            font-size:16px;
            color:#808080;
        }
    </style>
    
 
</head>
<body>
    <div class="page">
        <div class="page__hd">
            <h2 class="page__title">自愿接种新冠疫苗调查</h2><asp:Label ID="Label16" runat="server" Text=""  class="page__title"></asp:Label>
                    <p class="page__desc">&nbsp;&nbsp;各位员工：</p>

            <p class="page__desc"  >&nbsp;&nbsp;&nbsp;&nbsp;按照市、区新冠疫苗接种工作要求，万新街道对所辖企业进行新冠病毒疫苗免费接种需求预统计有意向自愿接种疫苗人数。 </p>
            <p class="page__desc" style="color:red"> &nbsp;&nbsp;&nbsp;&nbsp;接种年龄及身体条件要求，请仔细阅读 新冠病毒疫苗禁忌症 。接种时，卫生部门会有详细说明。 </p>
            <p class="page__desc" >&nbsp;&nbsp;&nbsp;&nbsp; 新冠病毒疫苗禁忌症共包括10类15种，主要为：1.过敏体质；2.1急性疾病，2.2严重慢性疾病；3.孕期妇女及备孕；4.神经系统疾病；5.免疫系统疾病；6.1严重呼吸系统疾病，6.2严重心血管疾病，6.3严重肝肾疾病，6.4不可控高血压，6.5恶性肿瘤；7.免疫抑制剂使用者；8.出血性疾病；9.新冠病毒感染史；10.其他</p>
             
        </div>
        <div class="weui_media_box weui_media_text" id="link26">
            <ul class="weui_media_info">
                <li class="weui_media_info_meta">&nbsp;&nbsp;&nbsp;&nbsp;截止时间:<asp:Label ID="Labellimittime" runat="server" Text="2021-4-17 10:00"></asp:Label></li>
            </ul>
        </div>

        <div class="page__bd">
            <form id="form1" runat="server">

                <div class="weui-cells__title">是否自愿接种新冠疫苗?</div>
                <div class="weui-cells weui-cells_radio">
                    <label class="weui-cell weui-check__label" for="c1">
                        <div class="weui-cell__bd">
                            <p>是</p>
                        </div>
                        <div class="weui-cell__ft">
                            <input type="radio" class="weui-check" name="radio3" id="c1" runat="server" />
                            <span class="weui-icon-checked"></span>
                        </div>
                    </label>
                    <label class="weui-cell weui-check__label" for="c2">
                        <div class="weui-cell__bd">
                            <p>否</p>
                        </div>
                        <div class="weui-cell__ft">
                            <input type="radio" name="radio3" class="weui-check" id="c2" runat="server" />
                            <span class="weui-icon-checked"></span>
                        </div>
                    </label>
                </div>

                <div class="weui-cells__title">是否已经接种新冠疫苗?</div>
                <div class="weui-cells weui-cells_radio">
                    <label class="weui-cell weui-check__label" for="a1">
                        <div class="weui-cell__bd">
                            <p>是</p>
                        </div>
                        <div class="weui-cell__ft">
                            <input type="radio" class="weui-check" name="radio1" id="a1" runat="server" />
                            <span class="weui-icon-checked"></span>
                        </div>
                    </label>
                    <label class="weui-cell weui-check__label" for="a2">
                        <div class="weui-cell__bd">
                            <p>否</p>
                        </div>
                        <div class="weui-cell__ft">
                            <input type="radio" name="radio1" class="weui-check" id="a2" runat="server" />
                            <span class="weui-icon-checked"></span>
                        </div>
                    </label>
                </div>

                <asp:Button ID="Button1" runat="server" class="weui-btn weui-btn_primary" Text="提交" OnClick="Button1_Click"   />
              <%--  <asp:Button ID="Button2" runat="server" class="weui-btn weui-btn_primary" Text="修改" OnClick="Button2_Click" />--%>

                </form>
            </div>

        
    </div>
    <asp:Label ID="staffid" runat="server" Text="Label" Visible="false" ></asp:Label>

</body>
</html>
