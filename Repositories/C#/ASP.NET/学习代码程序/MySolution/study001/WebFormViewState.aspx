<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormViewState.aspx.cs" Inherits="study001.WebFormViewState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnCount"  runat="server" Text="点击计数据" OnClick="btnCount_Click" />
            <div>
                姓名：<asp:TextBox ID="txtName" runat="server" />
            </div>
            <div>
                年龄：<asp:TextBox ID="txtAge" runat="server" />    <br />
            </div>
            <div>
                <asp:Button ID="btnaddStudent"  runat="server" Text="添加学生信息数据" OnClick="btnaddStudent_Click" />
            </div>
        </div>
    </form>
</body>
</html>
