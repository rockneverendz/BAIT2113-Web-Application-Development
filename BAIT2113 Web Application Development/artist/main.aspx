<%@ Page Title="" Language="C#" MasterPageFile="~/artist/artist.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <form class="container mt-4" runat="server"></form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
    <script>
        document.getElementsByClassName('nav-link')[0].classList += ' active';
    </script>
</asp:Content>
