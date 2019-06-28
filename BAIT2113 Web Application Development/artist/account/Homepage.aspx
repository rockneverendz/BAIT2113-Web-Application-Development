<%@ Page Title="" Language="C#" MasterPageFile="~/artist/artist.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.account.Homepage" %>

<%--Main Content--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<form id="form1" runat="server">
		<p>
			Welcome!<asp:Label ID="txtGreetings" runat="server"></asp:Label>
		</p>
		<asp:Button ID="btnLogout" runat="server" Enabled="False" OnClick="btnLogout_Click" Text="Log out" Visible="False" />
		<asp:Button ID="btnLogin" runat="server" Enabled="False" OnClick="btnLogin_Click" Text="Button" Visible="False" />
	</form>
</asp:Content>



