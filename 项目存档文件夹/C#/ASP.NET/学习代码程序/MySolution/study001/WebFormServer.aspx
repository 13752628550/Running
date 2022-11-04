<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormServer.aspx.cs" Inherits="study001.WebFormServer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnHtmlEncode" runat="server" Text="HTML编码" onClick="btnHtmlEncode_Click"/>
            <asp:Button ID="btnHtmlDecode" runat="server" Text="HTML解码" onClick="btnHtmlDecode_Click"/><br />
            <asp:Button ID="btnUrlEncode" runat="server" Text="Url编码" onClick="btnUrlEncode_Click"/>
            <asp:Button ID="btnUrlDecode" runat="server" Text="Url解码" onClick="btnUrlDecode_Click"/><br />
            <asp:Button ID="btnMapPath" runat="server" Text="MapPath" onClick="btnMapPath_Click"/>
            <asp:Button ID="btnTransfer" runat="server" Text="Transfer" onClick="btnTransfer_Click"/>
            <asp:Button ID="btnExecute" runat="server" Text="Execute" onClick="btnExecute_Click"/>
        </div>
    </form>
</body>
</html>


