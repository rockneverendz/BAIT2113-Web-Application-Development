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
            <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="Art_ID">
                <Columns>
                    <asp:BoundField DataField="Index" HeaderText="Index" SortExpression="Index"></asp:BoundField>
                    <asp:BoundField DataField="Art_ID" HeaderText="Art_ID" SortExpression="Art_ID" Visible="False"></asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img style="max-height:150px; max-width:150px" src='<%#"data:Image/png;base64," + Eval("Image")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="orderQuantity" type="number" value='<%# Eval("Quantity") %>' runat="server" OnTextChanged="orderQuantity_TextChanged" AutoPostBack="True"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PriceEach" HeaderText="PriceEach" SortExpression="PriceEach"></asp:BoundField>
                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" SortExpression="Subtotal"></asp:BoundField>
                    <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                            <asp:Button type='button' ID="btnRemove" runat="server" Text="Remove" CommandArgument='<%# Eval("Index") %>' OnClick="removeItem" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="float-right">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <button type="button" class="btn btn-info btn-lg">Grand Total</button>
                    <asp:Label class="btn btn-light btn-lg" ID="orderTotal" runat="server" Text="RM 0.00"></asp:Label>
                    <a href="checkout.aspx" role="button" class="btn btn-primary btn-lg">Proceed to checkout ≫</a>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
</asp:Content>
