<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCookie.aspx.cs" Inherits="study001.WebFormCookie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            姓名：<asp:TextBox ID="txtUserName"  runat="server" /> <br /> 
            密码：<asp:TextBox ID="txtPassWord"  runat="server" /> <br />
            <asp:CheckBox ID="chkRemberMe" runat="server" Text="十天内免登陆" />
            <asp:Button ID="btnLOGin" Text="Login" runat="server" onClick="btnLOGin_Click" />            
        </div>
    </form>

</body>
</html>
