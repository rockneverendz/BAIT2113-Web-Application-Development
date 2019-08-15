<%@ Page Title="" Language="C#" MasterPageFile="~/artist/artist.Master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.order.view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <form class="container-fluid mt-4" runat="server">
        <div class="card border-top-0 mb-5">
            <table class="table mb-0">
                <thead>
                    <tr>
                        <th style="width: 10%">Order ID</th>
                        <th style="width: 10%">Date</th>
                        <th style="width: 10%">Artwork ID</th>
                        <th style="width: 10%">Status</th>
                        <th style="width: 10%">Action</th>
                        <th style="width: 10%">Price</th>
                        <th style="width: 10%">Quantity</th>
                        <th style="width: 10%">Sales</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>#<asp:Label ID="lblOrder_ID" runat="server" Text='<%# Eval("Order_ID") %>'></asp:Label></td>
                                <td><%# ((DateTime)(Eval("Order_Date"))).ToShortDateString() %></td>
                                <td>
                                    <asp:Label ID="lblArt_ID" runat="server" Text='<%# Eval("Art_ID") %>'></asp:Label>
                                </td>
                                <td><%# Eval("Status") %></td>
                                <td class="py-0 align-middle">
                                    <asp:Button ID="btnToShipped" Text="Shipped" class="btn btn-sm btn-outline-primary"
                                        data-toggle="tooltip" data-placement="right" title="Update status to 'Shipped'"
                                        AlternateText="Shipped" OnClick="ToShipped"
                                        Visible='<%# (Eval("Status").ToString() != "Shipped") %>' runat="server" />
                                </td>
                                <td><%# String.Format("RM {0:0.00}", Eval("PriceEach")) %></td>
                                <td><%# Eval("Quantity") %></td>
                                <td><%# String.Format("RM {0:0.00}", Eval("Sales")) %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
    <script>
        document.getElementsByClassName('nav-link')[1].classList += ' active';

        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
</asp:Content>
