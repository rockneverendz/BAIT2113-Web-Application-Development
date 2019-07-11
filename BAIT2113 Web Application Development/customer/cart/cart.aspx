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
                    Sample Header Here
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:HiddenField ID="orderIndex" Value='<%# Eval("Index") %>' runat="server" />
                    <asp:Button type='button' ID="btnRemove" runat="server" Text="remove" CommandArgument='<%# Eval("Index") %>' OnClick="removeItem" />
                    <p><%# Eval("Art_ID") %></p>
                    <p><%# Eval("Title") %></p>
                    <img class="w-100 h-100" src='<%#"data:Image/png;base64," + Eval("Image")%>' />
                    <asp:TextBox ID="orderQuantity" type="number" value='<%# Eval("Quantity") %>' runat="server" OnTextChanged="orderQuantity_TextChanged" AutoPostBack="True"></asp:TextBox>
                    <p><%# String.Format("{0:0.00}",Eval("PriceEach")) %></p>
                    <asp:Label ID="orderSubtotal" runat="server" Text='<%# String.Format("{0:0.00}",Eval("Subtotal")) %>'></asp:Label>

                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:Label ID="orderTotal" runat="server" Text="Total"></asp:Label>
            <a href="checkout.aspx">Proceed to checkout</a>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
</asp:Content>
