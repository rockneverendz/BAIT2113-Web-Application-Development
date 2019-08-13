<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.Master" AutoEventWireup="true" CodeBehind="orderDetails.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.order.orderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <!-- Jumbotron --->
    <div class="jumbotron jumbotron-fluid" style="margin-top: 50px;">
        <div class="container">
            <asp:Label ID="jumbotronHeader" CssClass="display-4 d-block" Style="margin-bottom: .5rem;" runat="server" Text="Hello world!"></asp:Label>
        </div>
    </div>
    <!-- Content --->
    <div class="container">
        <div class="card border-top-0">
            <table class="table mb-0">
                <thead>
                    <tr>
                        <th scope="col" style="width: 10%">#</th>
                        <th scope="col" style="width: 25%">Title</th>
                        <th scope="col" style="width: 25%">Image</th>
                        <th scope="col" style="width: 10%">Quantity</th>
                        <th scope="col" style="width: 15%">Price</th>
                        <th scope="col" style="width: 15%">Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <th scope="row"><%# Eval("Index") %></th>
                                <td><%# Eval("Title") %></td>
                                <td>
                                    <img style="max-height: 150px; max-width: 150px" src='<%#"data:Image/png;base64," + Eval("Base64image")%>' />
                                </td>
                                <td><%# Eval("quantity") %></td>
                                <td><%# String.Format("RM {0:0.00}", Eval("PriceEach")) %></td>
                                <td><%# String.Format("RM {0:0.00}", Eval("Subtotal")) %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
                <tfoot>
                    <tr>
                        <th scope="col" colspan="4"></th>
                        <th scope="col">Total</th>
                        <th scope="col">
                            <asp:Label ID="orderTotal" runat="server" Text="RM 0.00"></asp:Label>
                        </th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
</asp:Content>
