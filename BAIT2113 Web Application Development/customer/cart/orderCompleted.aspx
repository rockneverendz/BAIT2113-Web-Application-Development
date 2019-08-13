<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.Master" AutoEventWireup="true" CodeBehind="orderCompleted.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.cart.orderCompleted" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <form id="form1" runat="server">
        <!-- Jumbotron --->
        <div class="jumbotron jumbotron-fluid" style="margin-top: 50px;">
            <div class="container">
                <asp:Label ID="jumbotronHeader" CssClass="display-4 d-block" Style="margin-bottom: .5rem;" runat="server" Text="Order Successful"></asp:Label>
            </div>
        </div>

        <!-- Content --->
        <div class="container">
            Thank yewww for ur purrrchase
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
</asp:Content>
