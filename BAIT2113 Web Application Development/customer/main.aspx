<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Art Gallery - Main</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <%-- Jumbotron --%>
        <div class="jumbotron jumbotron-fluid" style="margin-top: 50px;">
            <div class="container">
                <h1 class="display-4">Welcome to Art Gallery</h1>
                <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
            </div>
        </div>

        <%-- Content --%>
        <div class="container">

            <asp:DataList ID="DataList1" runat="server" DataKeyField="Art_ID" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-5 shadow-sm h-md-250 position-relative">
                        <div class="col-4 p-4 d-flex flex-column position-static">
                            <h3 class="mb-0"><%# Eval("Title") %></h3>
                            <a href="#" class="mb-1 text-muted"><%# Eval("Username") %></a>
                            <p class="card-text mb-auto"><%# Eval("Description") %></p>
                            <div><%# Eval("Status") %> - <%# Eval("Price") %></div>
                            <asp:Button type='button' ID="btnWishlist" runat="server" Text="wishlist" CommandArgument='<%# Eval("Art_ID") %>' OnClick="addToWishlist" />
                            <asp:Button type='button' ID="btnAddToCart" runat="server" Text="addToCart" CommandArgument='<%# Eval("Art_ID") %>' OnClick="addToCart" />
                        </div>
                        <a href="#" class="col-8 d-none d-lg-block">
                            <img class="w-100 h-100" src='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Image"))%>' />
                            <a />
                    </div>
                </ItemTemplate>
            </asp:DataList>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ArtGalleryConnStr %>' SelectCommand="SELECT Artwork.Art_ID, Artwork.Title, Artwork.Description, Artist.Username, Artwork.Date, Artwork.Status, Artwork.Price, Artwork.Image, Artwork.Stock, Artwork.Artist_ID FROM Artwork INNER JOIN Artist ON Artwork.Artist_ID = Artist.Artist_ID ORDER BY Artwork.Art_ID DESC"></asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
