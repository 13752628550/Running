<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormResponse.aspx.cs" Inherits="study001.WebFormResponse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnWrite" runat="server" Text="Write方法" OnClick="btnWrite_Click" />
            <asp:Button ID="btnEnd" runat="server" Text="End方法" OnClick="btnEnd_Click" />
            <asp:Button ID="btnRedirect" runat="server" Text="Redirect方法" onClick="btnRedirect_Click"/>
        </div>
    </form>
</body>
</html>
