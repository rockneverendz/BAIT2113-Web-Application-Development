<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.Master" AutoEventWireup="true" CodeBehind="wishlist.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.account.wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <form id="form1" runat="server">
        <%-- Jumbotron --%>
        <div class="jumbotron jumbotron-fluid" style="margin-top: 50px;">
            <div class="container">
                <h1 class="display-4">Wishlist</h1>
            </div>
        </div>

        <!-- Content --->
        <div class="container">
            <asp:Repeater ID="Repeater1" runat="server">
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
                                    <asp:ImageButton ID="btnRemoveWishlist" class="far btn btn-secondary" Style="width: 3rem; height: 2rem" ImageUrl="../../resource/bookmark-regular.svg"
                                        data-toggle="tooltip" data-placement="bottom" title="Remove from Wishlist"
                                        AlternateText="Remove from  Wishlist" CommandArgument='<%# Eval("Art_ID") %>' OnClick="removeFromWishlist" runat="server" />
                                    <asp:ImageButton ID="btnAddToCart" class="fas btn btn-primary" Style="width: 3rem; height: 2rem" ImageUrl="../../resource/cart-plus-solid.svg"
                                        data-toggle="tooltip" data-placement="bottom" title="Add to Cart"
                                        AlternateText="Add To Cart" CommandArgument='<%# Eval("Art_ID") %>' OnClick="addToCart" runat="server" />
                                </div>
                            </div>
                        </div>
                        <!-- Artwork image on the left, covers 66% of the card --->
                        <a href="#" class="col-8 d-none d-lg-block card-img">
                            <img class="w-100 h-100" style="object-fit: cover;" src='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Image"))%>' />
                        </a>
                        <!-- Card footer --->
                        <div class="card-footer col-12 text-muted">
                            <div class="px-4">
                                Added to wishlist on <%# ((DateTime)Eval("W_Date")).ToShortDateString() %>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
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
