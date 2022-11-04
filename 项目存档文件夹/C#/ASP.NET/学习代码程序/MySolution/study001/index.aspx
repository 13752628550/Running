<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="study001.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%-- ASP.NET服务端控件--%>
            <asp:TextBox ID="txtTime" runat="server"></asp:TextBox> 
            <%--控件+时间驱动模型--%>
            <asp:Button ID="btnSetTime" Text="设置时间" runat="server" OnClick="btnSetTime_Click" /> <br />
            <%--添加其他按钮--%>
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>
    </form>
</body>
</html>
