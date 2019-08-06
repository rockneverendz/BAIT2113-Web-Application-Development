<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.Master" AutoEventWireup="true" CodeBehind="orderHistory.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.order.orderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1"></asp:Repeater>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ArtGalleryConnStr %>' SelectCommand="SELECT [Order].Order_ID, [Order].Order_Status, [Order].Order_Date, Payment.Pay_Amount FROM OrderItem INNER JOIN [Order] ON OrderItem.Order_ID = [Order].Order_ID INNER JOIN Payment ON [Order].Pay_ID = Payment.Pay_ID WHERE ([Order].Cust_ID = @Cust_ID)">
        <SelectParameters>
            <asp:SessionParameter SessionField="Cust_ID" DefaultValue="0" Name="Cust_ID"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
</asp:Content>
