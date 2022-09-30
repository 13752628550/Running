<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="study001.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            姓名：<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <asp:Button ID="btn" runat="server" Text="设置消息" OnClick="btn_Click"/>
        </div>
    </form>
</body>
</html>
