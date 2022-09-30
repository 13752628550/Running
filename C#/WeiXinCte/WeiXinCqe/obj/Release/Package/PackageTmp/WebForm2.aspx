<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WeiXinCqe.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>测试</title>
    <link rel="stylesheet" href="/style/weui.css"/>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:HyperLink
    ID="HyperLink1" runat="server" NavigateUrl="~/Weixin/salary/MySalary.aspx">工资</asp:HyperLink>

        <br />

    <asp:HyperLink
    ID="HyperLink2" runat="server" NavigateUrl="~/Weixin/attendance/Attendance.aspx">考勤</asp:HyperLink>

        <br />

    <asp:HyperLink
    ID="HyperLink3" runat="server" 
            NavigateUrl="~/Weixin/rewardpunishment/RewardPunishment.aspx">奖励</asp:HyperLink>


        <br />


    <asp:HyperLink
    ID="HyperLink4" runat="server" NavigateUrl="~/Weixin/baseinfo/BaseInfo.aspx">基本信息</asp:HyperLink>
        <br />


    <asp:HyperLink
    ID="HyperLink5" runat="server" NavigateUrl="~/Weixin/dinner/MyBooking.aspx">订餐</asp:HyperLink>
    </div>
    </form>
</body>
</html>

