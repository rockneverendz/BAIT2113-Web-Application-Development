<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.account.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <p>Welcome!<asp:Label ID="txtGreetings" runat="server"></asp:Label>
        </p>
        <asp:Button ID="btnLogout" runat="server" Enabled="False" OnClick="btnLogout_Click" Text="Log out" Visible="False" />
        <asp:Button ID="btnLogin" runat="server" Enabled="False" OnClick="btnLogin_Click" Text="Button" Visible="False" />
    </form>
</body>
</html>
