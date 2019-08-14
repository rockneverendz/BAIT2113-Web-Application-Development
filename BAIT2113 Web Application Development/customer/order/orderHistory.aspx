<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.Master" AutoEventWireup="true" CodeBehind="orderHistory.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.order.orderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <form id="form1" runat="server">
        <!-- Jumbotron --->
        <div class="jumbotron jumbotron-fluid" style="margin-top: 50px;">
            <div class="container">
                <h1 class="display-4">Order History</h1>
            </div>
        </div>
        <!-- Content --->
        <div class="container">
            <div class="card border-top-0 mb-5">
                <table class="table mb-0">
                    <thead>
                        <tr>
                            <th scope="col" style="width: 25%">Order ID</th>
                            <th scope="col" style="width: 25%">Status</th>
                            <th scope="col" style="width: 25%">Date</th>
                            <th scope="col" style="width: 25%">Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <tr onclick="window.location='orderDetails.aspx?id=<%# Eval("Order_ID") %>';" style="cursor: pointer">
                                    <th><%# Eval("Order_ID") %></th>
                                    <td><%# Eval("Order_Status") %></td>
                                    <td><%# Eval("Payment.Pay_Date") %></td>
                                    <td><%# Eval("Payment.Pay_Amount") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
</asp:Content>
