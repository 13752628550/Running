<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FY_everyday.aspx.cs" Inherits="WeiXinCqe.FY_everyday" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>连休期间防控冠状病毒调查</title>
    <script type="text/javascript" src="../shitang/Javascript/jquery-1.8.3.min.js"></script>
    <link href="../../style2/weui.css" rel="stylesheet" />
    <link href="../../style2/weui.min.css" rel="stylesheet" />
    <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
    <link rel="stylesheet" href="/style/weui.css" />
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
    <script type="text/javascript"> 
        $(document).ready(function () {
          
             
           // re_set();
        });
         
        function re_set()
        {
            var link = location.href; 
            $.ajax({
                url: "FY_everyday.aspx/GetInfoMation",//后台给你提供的接口
                type: "Post",
                data: "{ 'url': '" +  link + "' }",
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var datad = JSON.parse(data.d); //转译为Json字符串 
                    //   alert("01>>>"  +data.d);
                    wx.config({
                        beta: true,
                        debug: false,// 开启调试模式,调用的所有api的返回值会在客户端alert出来
                        appId: datad.appid, // 必填，公众号的唯一标识
                        timestamp: datad.timestamp, // 必填，生成签名的时间戳
                        nonceStr: datad.noncestr, // 必填，生成签名的随机串
                        signature: datad.signature,// 必填，签名，见附录1
                        jsApiList: [
                            "getLocation"
                        ]// 必填，需要使用的JS接口列表，所有JS接口列表见附录2 
                        
                    });
                    wx.ready(function () {

                        wx.getLocation({
                            type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
                            success: function (res) {
                                var lat = res.latitude; // 纬度，浮点数，范围为90 ~ -90
                                var lng = res.longitude; // 经度，浮点数，范围为180 ~ -180。
                                var speed = res.speed; // 速度，以米/每秒计
                                var accuracy = res.accuracy; // 位置精度
                                //   alert("04>>>" + res.latitude + ";" +res.longitude); 


                                var url = "https://api.map.baidu.com/reverse_geocoding/v3/?ak=P22O7V9xFeWWCvamKYyl0b7pBMAFvGbe&output=json&coordtype=wgs84&location=" + lat + "," + lng + "&callback=?";
                                $.getJSON(url, function (result) { 
                                    var country = result.result.addressComponent.country;
                                    var province = result.result.addressComponent.province;
                                    var city = result.result.addressComponent.city;
                                    var district = result.result.addressComponent.district; 

                                    document.getElementById('lbl_loc').value =  country + "," + province + "," + city + "," + district;

                                    alert("位置获取成功。");
                                }); 
                            }
                        });
                    });

                    wx.error(function (res) {
                        //alert("05>>>"  +res.errMsg);
                    });
                },
                error: function (error) {
                    //      alert("06>>>"  +error)
                }
            });

        }
        
        function aclick(strvalue) {
            document.getElementById('Hidden1').value = strvalue;
            document.getElementById('ImageButton1').click();
        }
   
    </script>
    <style>
        .tc caption
        {
            font-size: 15pt;
        }
    </style>
</head>
<body>
    <div id="allmap"  visible="false"  ></div>
    <form id="form1" runat="server">


        <%-- 答题人数 --%>
    <div class=" weui_cells_form" id="divjiben" runat="server" style="width:100%">
        
        <div class="page__hd">
            <p class="page__desc">各位员工：</p>

            <p class="page__desc">为加强新型冠状病毒感染肺炎疫情的防控工作，阻断疫情传播，更好地保障员工生命和健康安全，请大家务必根据目前自己的现状，真实、理性地填写，感谢大家的配合！</p>
             
        </div>
        <div class="weui_cells" id="div_cc" runat="server" style="width:100%">
          
         <div class="weui-cells__title"  runat="server" style="color:blue">位置：<input type="text" class="weui-cells__title" readonly="readonly" style="border:none;font-size:14px; width:250px;" id="lbl_loc" name="lbl_loc" /> </div>
         <input type="button" id="btn_re_set" name="btn_re_set" value="重新获取位置" class="weui-btn weui-btn_primary" style="margin:15px 0"  onclick="re_set()" /> 
         <div class="weui-cells__title" id="lbl_yyyymmdd" runat="server"> </div>
         <div class="weui-cells__title">身体是否有咳嗽，浑身无力，腹泻等不适状况？</div>
            <div class="weui-cells  weui-cells_radio">
                
                <asp:RadioButton ID="b1" runat="server" Text="   是  " GroupName="radio2"  style="float:left; margin-left:20px;" /> 
             
                <asp:RadioButton ID="b2" runat="server" Text="   否  "  Checked="true" GroupName="radio2"  style="float:right; margin-right:20px;" />
            </div>
         <div class="weui-cells__title">是否在服用退热剂等和降温药物？</div>
            <div class="weui-cells  ">
                
                <asp:RadioButton ID="c1" runat="server" Text="   是  " GroupName="radio3"  style="float:left; margin-left:20px; " /> 
             
                <asp:RadioButton ID="c2" runat="server" Text="   否  "  Checked="true"   GroupName="radio3"  style="float:right; margin-right:20px;" />
            </div>
       <%--     <div class="weui-cells__title">当前是否在青岛？</div>
            <div class="weui-cells  ">
                
             
                <asp:RadioButton ID="d2" runat="server" Text="   不在  " GroupName="radio4" style="float:left; margin-left:20px;"/>
                <asp:RadioButton ID="d1" runat="server" Text="   在  "   GroupName="radio4"  style="float:right; margin-right:20px; "   /> 
            </div>--%>
            <div class="weui-cells__title">最近14天同住人员有无发烧、咳嗽等身体异常的情况？</div>
            <div class="weui-cells  " style="width:100%">
                <asp:RadioButton ID="e1" runat="server" Text="   有  " GroupName="radio5"  style="float:left; margin-left:20px;  " /> 
             
                <asp:RadioButton ID="e2" runat="server" Text="   无  "  Checked="true"  GroupName="radio5"  style="float:right; margin-right:20px;" />
               
            </div>
            <div class="weui-cells__title">最近21天，同住人员有无去过疫情中、高风险区？</div>
            <div class="weui-cells  " style="width:100%">
                <asp:RadioButton ID="f1" runat="server" Text="   有  " GroupName="radio6"  style="float:left; margin-left:20px;  " /> 
             
                <asp:RadioButton ID="f2" runat="server" Text="   无  "  Checked="true"  GroupName="radio6"  style="float:right; margin-right:20px;" />
               
            </div>
          <%--  <div  class="weui-cells__title">2019-nCOV检测结果？ </div>
            <div class="weui-cells  " style="width: 100%">
                <div>
                    <asp:RadioButton ID="g1" runat="server" Text="未检测" GroupName="radio7" Style="float: left; margin-left: 20px;" />

                    <asp:RadioButton ID="g2" runat="server" Text="未出结果" GroupName="radio7" Style="margin-left: 80px;" />


                    <asp:RadioButton ID="g3" runat="server" Text="阴性" GroupName="radio7" Style="float: right; margin-right: 20px;" />
                </div>
                <div Style="margin-top: 20px;" >
                    <asp:RadioButton ID="g4" runat="server" Text="阳性" GroupName="radio7" Style="float: left; margin-left: 20px;" />


                    <asp:RadioButton ID="g5" runat="server" Text="可疑" GroupName="radio7" Style="float: right; margin-right: 20px;" />
                </div>
            </div>--%>

         <div class="weui-cell weui-cell_active">
            <div class="weui-cell__hd"><label class="weui-label" id="lbl_ty" runat="server">今日体温</label></div>
            <div class="weui-cell__bd">
                <input  type="text" id="txt_tw" runat="server" class="weui-input" placeholder="今日体温"   pattern="^(([3,4]?[0-9](\.[0-9]{1,2})?)|45)$" />
            </div>
        </div>

            
            <asp:Button ID="Button1" runat="server" class="weui-btn weui-btn_primary" style="margin:25px 0"  Text="提交" OnClick="Button1_Click"  />
    </div>
            
        <div class="weui_cells" style="margin-top:25px">
            <div class="weui_cells_title">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                    CssClass="tc">
                    <Columns>
                        <asp:BoundField DataField="YYYYMMDD" HeaderText="日期">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TEMPERATURE" HeaderText="体温" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                     <%--   <asp:BoundField DataField="COUGH" HeaderText="咳嗽等">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MEDICINE" HeaderText="就医">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="QD" HeaderText="在青">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ONEHOUSE" HeaderText="同住异常">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HUBEI" HeaderText="同住异常2">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>--%>
                             <asp:BoundField DataField="YC" HeaderText="异常">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LOC" HeaderText="签到位置">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" ForeColor="#33CC33" />
                    <FooterStyle Font-Bold="True" ForeColor="#33CC33" HorizontalAlign="Right" VerticalAlign="Middle" />
                    <HeaderStyle Font-Bold="True" Font-Size="12pt" ForeColor="Gray" />
                </asp:GridView>
            </div>
        </div>

        </div>

    <asp:Label ID="staffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <asp:Label ID="newstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <asp:Label ID="nowstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
       <%--<asp:Label ID="location" runat="server" ForeColor="Red" Visible="False"></asp:Label>--%>
        <%--<input type="text"  id="txt_loc"  runat="server"   />--%>
    <asp:Label ID="deviceid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <asp:Label ID="staffname" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    </form>
</body>
</html>



