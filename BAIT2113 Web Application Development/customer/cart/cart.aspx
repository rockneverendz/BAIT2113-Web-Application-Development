<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.cart.cart" %>

<%@ Register Src="~/customer/cart/cartList.ascx" TagPrefix="cart" TagName="List" %>
<%@ Register Src="~/customer/cart/cartEmpty.ascx" TagPrefix="cart" TagName="Empty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <form id="form1" runat="server">
        <!-- Jumbotron --->
        <div class="jumbotron jumbotron-fluid" style="margin-top: 50px;">
            <div class="container">
                <h1 class="display-4">Cart</h1>
            </div>
        </div>
        <!-- Content --->
        <div class="container">
            <cart:List runat="server" id="cartList"/>
            <cart:Empty runat="server" id="cartEmpty" Visible="false"/>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
</asp:Content>
