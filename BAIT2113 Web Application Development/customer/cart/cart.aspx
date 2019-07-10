<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.cart.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <%-- Jumbotron --%>
        <div class="jumbotron jumbotron-fluid" style="margin-top: 50px;">
            <div class="container">
                <h1 class="display-4">Cart</h1>
            </div>
        </div>

        <%-- Content --%>
        <div class="container">
            <asp:DataList ID="DataList1" runat="server">
                <HeaderTemplate>
                    Index Image Quantity PriceEach
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Button type='button' ID="btnRemove" runat="server" Text="remove" CommandArgument='<%# Eval("Index") %>' OnClick="removeItem" />
                    <p><%# Eval("Order_ID") %></p>
                    <p><%# Eval("Art_ID") %></p>
                    <asp:TextBox ID="orderQuantity" type="number" value='<%# Eval("Quantity") %>' runat="server" OnTextChanged="orderQuantity_TextChanged"></asp:TextBox>
                    <p><%# Eval("PriceEach") %></p>
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
</asp:Content>
