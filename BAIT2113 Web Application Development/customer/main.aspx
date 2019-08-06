<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
    <title>Art Gallery - Main</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <form id="form1" runat="server">
        <!-- Jumbotron --->
        <div class="jumbotron jumbotron-fluid" style="margin-top: 50px;">
            <div class="container">
                <asp:Label ID="jumbotronHeader" CssClass="display-4 d-block" style="margin-bottom: .5rem;" runat="server" Text="Hello world!"></asp:Label>
            </div>
        </div>

        <!-- Content --->
        <div class="container">

            <asp:DataList ID="DataList1" runat="server" DataKeyField="Art_ID" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-5 shadow-sm h-md-250 position-relative h-100 w-100">
                        <!-- Artwork information on the right, covers 33% of the card --->
                        <div class="col-4 p-4 d-flex flex-column position-static h-auto">
                            <h3 class="mb-0"><%# Eval("Title") %></h3>
                            <div class="mb-1 d-flex justify-content-between">
                                <a href="#" class="text-muted">by <%# Eval("Username") %> on <%# ((DateTime)Eval("Date")).ToShortDateString() %></a>
                                <div class="text-muted"><%# Eval("Status") %></div>
                            </div>
                            <div class="overflow-auto card-text" style="height: 13vw">
                                <%# Eval("Description") %>
                            </div>
                            <div class="mt-auto d-flex justify-content-between">
                                <div class="display-4" style="font-size: 1.5rem;"><%# String.Format("RM {0:0.00}", Eval("Price")) %></div>
                                <div>
                                    <asp:ImageButton ID="btnWishlist" class="far btn btn-info" Style="width: 3rem; height: 2rem" ImageUrl="../resource/bookmark-regular.svg"
                                        data-toggle="tooltip" data-placement="bottom" title="Add to Wishlist"
                                        AlternateText="Add to Wishlist" CommandArgument='<%# Eval("Art_ID") %>' OnClick="addToWishlist" runat="server" />
                                    <asp:ImageButton ID="btnAddToCart" class="fas btn btn-primary" Style="width: 3rem; height: 2rem" ImageUrl="../resource/cart-plus-solid.svg"
                                        data-toggle="tooltip" data-placement="bottom" title="Add to Cart"
                                        AlternateText="Add To Cart" CommandArgument='<%# Eval("Art_ID") %>' OnClick="addToCart" runat="server" />
                                </div>
                            </div>
                        </div>
                        <!-- Artwork image on the left, covers 66% of the card --->
                        <a href="#" class="col-8 d-none d-lg-block card-img">
                            <img class="w-100 h-100" style="object-fit: cover;" src='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Image"))%>' />
                        </a>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ArtGalleryConnStr %>' SelectCommand="SELECT Artwork.Art_ID, Artwork.Title, Artwork.Description, Artist.Username, Artwork.Date, Artwork.Status, Artwork.Price, Artwork.Image, Artwork.Stock, Artwork.Artist_ID FROM Artwork INNER JOIN Artist ON Artwork.Artist_ID = Artist.Artist_ID WHERE (Artwork.Status <> 'Hidden') AND (Artwork.Status <> 'Deleted') ORDER BY Artwork.Art_ID DESC" EnableCaching="True" CacheDuration="60"></asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
</asp:Content>
