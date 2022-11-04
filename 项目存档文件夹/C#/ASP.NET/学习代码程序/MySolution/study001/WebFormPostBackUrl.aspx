<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormPostBackUrl.aspx.cs" Inherits="study001.WebFormPostBackUrl" %>

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
                姓名:<asp:TextBox ID="username" runat="server" /> <br />
                密码:<asp:TextBox ID="txtpwd" runat="server" /> <br />
                <asp:Button ID="btnsend" runat="server" text="传递值" PostBackUrl="~/details.aspx"/>
            </div>
        </div>
    </form>
</body>
</html>

