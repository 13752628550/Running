<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="study001.details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--<div>
                <label for="txtsid">学号</label>
                <asp:TextBox ID="txtsno" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div>
                <label for="txtname">姓名</label>
                <asp:TextBox ID="txtname" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div>
                <label for="txtcounty">城市</label>
                <asp:TextBox ID="txtcounty" runat="server"></asp:TextBox>
            </div>--%>
            <asp:Label ID="lblCurrentUser" runat="server" /><br />
            <asp:Label ID="lblOnLine" runat="server" /> 
        </div>
    </form>
</body>

</html>
