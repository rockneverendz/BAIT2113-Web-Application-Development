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
                    <asp:Label ID="orderIndex" runat="server" Text='<%# Eval("Index") %>'></asp:Label>
                    <img class="w-100 h-100" src='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Image"))%>' />
                    <asp:TextBox ID="orderQuantity" type="number" value='<%# Eval("Quantity") %>' CommandArgument='<%# Eval("Index") %>'
                        step="1" min="0" max="10" runat="server" required OnTextChanged="orderQuantity_TextChanged" AutoPostBack="True"></asp:TextBox>
                    <p><%# Eval("PriceEach") %></p>
                    <asp:Button type='button' ID="btnRemove" runat="server" Text="remove" CommandArgument='<%# Eval("Index") %>' OnClick="removeItem" />
                    <p><%# Eval("Quantity") %></p>
                                        <p><%# Eval("Subtotal") %></p>

                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
</asp:Content>
