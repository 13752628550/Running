<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dvote15.aspx.cs" Inherits="WeiXinCqe.Weixin.vote.Dvote15" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>食堂改善满意度调查</title>
    <link href="../../style2/weui.css" rel="stylesheet" />
    <link href="../../style2/weui.min.css" rel="stylesheet" />
    <style>
        .weui-cells__title {
            font-size:17px;
            color:black;
        }
        .weui-check__label ,.page__desc{
            font-size:16px;
            color:#808080;
        }
    </style>
    <script>
        //function an_s(ss,wz)
        //{
        //    var an_s = document.getElementById("an_s").innerText;
        //    document.getElementById("an_s").innerText = an_s.substr(0, wz - 1) + ss + an_s.substr(wz, 23 - wz);

        //}

    </script>
</head>
<body>
    <div class="page">
        <div class="page__hd">
            <h2 class="page__title">食堂改善满意度调查</h2><asp:Label ID="Label16" runat="server" Text=""  class="page__title"></asp:Label>
            <p class="page__desc">各位员工：</p>

            <p class="page__desc">大家好！今年6月份实施了食堂餐费调整，	为了进一步了解近调整后的情况及您对食堂伙食的期望，希望您能抽出几分钟的时间完成本次问卷调查。	
我们将会认真总结、分析并加以改进，努力把食堂管理工作做得更好，感谢您的支持！</p>

            <p class="page__desc">本次调查共7道单选题及1道开放题。</p>
        </div>
        <div class="weui_media_box weui_media_text" id="link26">
            <ul class="weui_media_info">
                <li class="weui_media_info_meta">截止时间:<asp:Label ID="Labellimittime" runat="server" Text="2016-10-29 13:00"></asp:Label></li>
            </ul>
        </div>

        <div class="page__bd">
            <form id="form" runat="server">
                
            <div class="weui-cells__title">1、菜谱跟以前相比好了吗？</div>
            <div class="weui-cells weui-cells_radio">
                <label class="weui-cell weui-check__label" for="a1">
                    <div class="weui-cell__bd">
                        <p>好</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" class="weui-check" name="radio1" id="a1"   onclick="an_s('A', 1)" runat="server" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a2">

                    <div class="weui-cell__bd">
                        <p>有所改善</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a2" runat="server"  onclick="an_s('B', 1)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a3">

                    <div class="weui-cell__bd">
                        <p>没有变化</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a3" runat="server" onclick="an_s('C', 1)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a4">

                    <div class="weui-cell__bd">
                        <p>有点不好</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a4" runat="server"  onclick="an_s('D', 1)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a5">

                    <div class="weui-cell__bd">
                        <p>不好</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a5" runat="server"  onclick="an_s('E', 1)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
            </div>
        
            <div class="weui-cells__title">2、菜比以前好吃吗？</div>
            <div class="weui-cells weui-cells_radio">
                <label class="weui-cell weui-check__label" for="b1">
                    <div class="weui-cell__bd">
                        <p>好</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" class="weui-check" name="radio2" id="b1"    runat="server" onclick="an_s('A', 2)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="b2">
                    <div class="weui-cell__bd">
                        <p>有所改善</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio2" class="weui-check" id="b2" runat="server"  onclick="an_s('B', 2)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="b3">

                    <div class="weui-cell__bd">
                        <p>没有变化</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio2" class="weui-check" id="b3" runat="server"  onclick="an_s('C', 2)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="b4">

                    <div class="weui-cell__bd">
                        <p>有点不好</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio2" class="weui-check" id="b4" runat="server"  onclick="an_s('D', 2)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="b5">

                    <div class="weui-cell__bd">
                        <p>不好</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio2" class="weui-check" id="b5" runat="server"  onclick="an_s('E', 2)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
            </div>
            
            <div class="weui-cells__title">3、对分餐速度满意吗？</div>
            <div class="weui-cells weui-cells_radio">
                <label class="weui-cell weui-check__label" for="c1">
                    <div class="weui-cell__bd">
                        <p>满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" class="weui-check" name="radio3" id="c1"   runat="server" onclick="an_s('A', 3)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="c2">
                    <div class="weui-cell__bd">
                        <p>比较满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio3" class="weui-check" id="c2" runat="server"  onclick="an_s('B', 3)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="c3">

                    <div class="weui-cell__bd">
                        <p>一般</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio3" class="weui-check" id="c3" runat="server" onclick="an_s('C', 3)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="c4">

                    <div class="weui-cell__bd">
                        <p>有点不满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio3" class="weui-check" id="c4" runat="server" onclick="an_s('D', 3)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="c5">

                    <div class="weui-cell__bd">
                        <p>不满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio3" class="weui-check" id="c5" runat="server" onclick="an_s('E', 3)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
            </div>
            
            <div class="weui-cells__title">4、对肉类和鱼的大小（切的大小程度）满意吗？</div>
            <div class="weui-cells weui-cells_radio">
                <label class="weui-cell weui-check__label" for="d1">
                    <div class="weui-cell__bd">
                        <p>满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" class="weui-check" name="radio4" id="d1"   runat="server"  onclick="an_s('A', 4)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="d2">
                    <div class="weui-cell__bd">
                        <p>比较满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio4" class="weui-check" id="d2"  runat="server" onclick="an_s('B', 4)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="d3">

                    <div class="weui-cell__bd">
                        <p>一般</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio4" class="weui-check" id="d3" runat="server" onclick="an_s('C', 4)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="d4">

                    <div class="weui-cell__bd">
                        <p>不满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio4" class="weui-check" id="d4" runat="server" onclick="an_s('D', 4)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="d5">

                    <div class="weui-cell__bd">
                        <p>不满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio4" class="weui-check" id="d5" runat="server" onclick="an_s('E', 4)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
            </div>
            
            <div class="weui-cells__title">5、对菜品种类满意吗？</div>
            <div class="weui-cells weui-cells_radio">
                <label class="weui-cell weui-check__label" for="e1">
                    <div class="weui-cell__bd">
                        <p>满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" class="weui-check" name="radio5" id="e1"   runat="server"  onclick="an_s('A', 5)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="e2">
                    <div class="weui-cell__bd">
                        <p>比较满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio5" class="weui-check" id="e2"  runat="server" onclick="an_s('B', 5)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="e3">

                    <div class="weui-cell__bd">
                        <p>一般</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio5" class="weui-check" id="e3" runat="server" onclick="an_s('C', 5)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="e4">

                    <div class="weui-cell__bd">
                        <p>有点不满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio5" class="weui-check" id="e4" runat="server"  onclick="an_s('D', 5)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="e5">

                    <div class="weui-cell__bd">
                        <p>不满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio5" class="weui-check" id="e5" runat="server"  onclick="an_s('E', 5)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
            </div>
            
            <div class="weui-cells__title">6、对菜的口味满意吗？</div>
            <div class="weui-cells weui-cells_radio">
                <label class="weui-cell weui-check__label" for="f1">
                    <div class="weui-cell__bd">
                        <p>满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" class="weui-check" name="radio6" id="f1"    runat="server" onclick="an_s('A', 6)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="f2">
                    <div class="weui-cell__bd">
                        <p>比较满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio6" class="weui-check" id="f2" runat="server" onclick="an_s('B', 6)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="f3">

                    <div class="weui-cell__bd">
                        <p>一般</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio6" class="weui-check" id="f3" runat="server" onclick="an_s('C', 6)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="f4">

                    <div class="weui-cell__bd">
                        <p>有点不满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio6" class="weui-check" id="f4" runat="server" onclick="an_s('D', 6)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="f5">

                    <div class="weui-cell__bd">
                        <p>不满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio6" class="weui-check" id="f5" runat="server" onclick="an_s('E', 6)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
            </div>

            <div class="weui-cells__title">7、综合评价对食堂的饭菜满意吗？</div>
             <div class="weui-cells weui-cells_radio">
                <label class="weui-cell weui-check__label" for="g1">
                    <div class="weui-cell__bd">
                        <p>满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" class="weui-check" name="radio7" id="g1"    runat="server" onclick="an_s('A', 7)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="g2">
                    <div class="weui-cell__bd">
                        <p>比较满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio7" class="weui-check" id="g2"  runat="server" onclick="an_s('B', 7)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="g3">

                    <div class="weui-cell__bd">
                        <p>一般</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio7" class="weui-check" id="g3"  runat="server" onclick="an_s('C', 7)"/>
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="g4">

                    <div class="weui-cell__bd">
                        <p>有点不满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio7" class="weui-check" id="g4" runat="server" onclick="an_s('D', 7)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="g5">

                    <div class="weui-cell__bd">
                        <p>不满意</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio7" class="weui-check" id="g5" runat="server" onclick="an_s('D', 7)" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
            </div>


           

            <div class="weui-cells__title">你喜欢吃的菜有哪些（填几道菜名）：</div>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <textarea class="weui-textarea" placeholder="请输入文本"  id="area_1" runat="server" rows="3"></textarea>
                        <div class="weui-textarea-counter"><span>0</span>/200</div>
                    </div>
                </div>
            </div>

            <asp:Button ID="Button1" runat="server" class="weui-btn weui-btn_primary" Text="提交" OnClick="Button1_Click"   />

            

                </form>
        </div>
        
    </div>
    <asp:Label ID="staffid" runat="server" Text="Label" Visible="false" ></asp:Label>
































































































































</body>
</html>



















































































































