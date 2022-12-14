<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormApplication.aspx.cs" Inherits="study001.WebFormApplication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <label for="txtUserName">用户名:</label> <asp:TextBox ID="txtUserName" runat="server" />
            </div>
            <div>
                <label for="txtPassWord">密码:</label> <asp:TextBox ID="txtPassWord" runat="server" />
            </div>
            <div>
                <asp:Button ID="btnLogin" runat="server" Text="登录" OnClick="btnLogin_Click" />
            </div>
        </div>
    </form>

</body>
</html>
