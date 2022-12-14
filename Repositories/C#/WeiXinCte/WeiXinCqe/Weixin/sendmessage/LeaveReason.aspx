<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveReason.aspx.cs" Inherits="WeiXinCqe.Weixin.sendmessage.LeaveReason" %>
<<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="/style/weui.css" />
    <link href="../../style2/weui.min.css" rel="stylesheet" />
    <link href="image/weuix.css" rel="stylesheet" />
    <link href="image/weui.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">


          <div class="page__hd" style="padding:5px;">
            <h2 class="page__title" style="text-align:center">离职原因调查</h2>
            <asp:Label ID="Label16" runat="server" Text="" class="page__title"></asp:Label>
            <p class="page__desc">亲爱的同事：</p>

            <p class="page__desc">&nbsp;&nbsp;&nbsp;&nbsp;您好！感谢您为公司付出的辛勤劳动，为您离开公司，公司表示深切的遗憾，并送上真挚的祝福。为了更深入了解同仁离职的真实原因，期盼获得您的宝贵意见，使公司以后的福利措施及政策能够更好为完善，有关于的您提供的信息不会向外透漏，对于您没有任何不利影响，请放心作答，感谢您的配合！</p>

            <p class="page__desc">&nbsp;&nbsp;&nbsp;&nbsp;本次调查不记名，不公布，只作为改善参考，请如实回答。</p>
        </div>

        <div class="weui-cells__title" style="color: #996633">离职原因</div>
            <div class="weui-cells weui-cells_radio">
                <label class="weui-cell weui-check__label" for="a1">
                    <div class="weui-cell__bd">
                        <p>其他原因</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" class="weui-check" name="radio1" id="a1" runat="server" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a2"> 
                    <div class="weui-cell__bd">
                        <p>工作强度大</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a2" runat="server"  />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a3">

                    <div class="weui-cell__bd">
                        <p>工作难度大</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a3" runat="server"  />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a4">

                    <div class="weui-cell__bd">
                        <p>请假受限</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a4" runat="server"  />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a5">

                    <div class="weui-cell__bd">
                        <p>工作分配不均</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a5" runat="server"  />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a6">

                    <div class="weui-cell__bd">
                        <p>长久站立</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a6" runat="server"  />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a7">

                    <div class="weui-cell__bd">
                        <p>车间噪音</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a7" runat="server"  />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a8">

                    <div class="weui-cell__bd">
                        <p>夜班</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a8" runat="server"  />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a9">

                    <div class="weui-cell__bd">
                        <p>同级同事性格差</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a9" runat="server" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a10">

                    <div class="weui-cell__bd">
                        <p>直接领导性格差</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a10" runat="server" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a11">

                    <div class="weui-cell__bd">
                        <p>加班多</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a11" runat="server" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a12">

                    <div class="weui-cell__bd">
                        <p>加班少</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a12" runat="server"  />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a13">

                    <div class="weui-cell__bd">
                        <p>生活不便利</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a13" runat="server"  />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a14">

                    <div class="weui-cell__bd">
                        <p>交通不便利</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a14" runat="server" />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
                <label class="weui-cell weui-check__label" for="a15">

                    <div class="weui-cell__bd">
                        <p>工资低</p>
                    </div>
                    <div class="weui-cell__ft">
                        <input type="radio" name="radio1" class="weui-check" id="a15" runat="server"  />
                        <span class="weui-icon-checked"></span>
                    </div>
                </label>
            </div>

        <div class="weui_cells weui_cells_form" id="divjiben" runat="server">
              
            
           <%-- <div class="weui_cell weui_cell_select weui_select_after">
                <div class="weui_cell_hd">
                    <label for="" class="weui_label" style="color: #996633">离职原因:</label>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <select class="weui_select" name="selectB" runat="server" id="selectB" style="color: #996633; font-weight: bold">
                        <option value="工作强度大">工作强度大</option>
                        <option value="工作难度大">工作难度大</option>
                        <option value="请假受限">请假受限</option>
                        <option value="工作分配不均">工作分配不均</option>
                        <option value="长久站立">长久站立</option>
                        <option value="车间噪音">车间噪音</option>
                        <option value="夜班">夜班</option>
                        <option value="同级同事性格差">同级同事性格差</option>
                        <option value="直接领导性格差">直接领导性格差</option>
                        <option value="加班多">加班多</option>
                        <option value="加班少">加班少</option>
                        <option value="生活不便利">生活不便利</option>
                        <option value="交通不便利">交通不便利</option>
                        <option value="工资低">工资低</option>
                        <option value="其他">其他原因</option>
                    </select>
                </div>
            </div>--%>
            <div class="weui-cells__title" style="color: #996633">其他原因说明</div>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <textarea class="weui-textarea" placeholder="请输入文本"  id="area_1" runat="server" rows="3"></textarea>
                        <div class="weui-textarea-counter"><span>0</span>/50</div>
                    </div>
                </div>
            </div>

            <asp:Button ID="btn_save" runat="server" Text="保存" CssClass="weui_btn weui_btn_primary"
                ToolTip="保存" OnClick="btn_save_Click" />
        </div> 

        <asp:Label ID="newstaffid" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    </form>
</body>
</html>
