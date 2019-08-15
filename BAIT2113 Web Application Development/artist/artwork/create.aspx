<%@ Page Title="" Language="C#" MasterPageFile="~/artist/artist.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.artwork.create" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <form class="container mt-4" runat="server">
        <asp:Label ID="lblServerResponse" CssClass="d-block alert" role="alert" Visible="false" runat="server"></asp:Label>
        <div class="row">
            <div class="col-4">
                <div class="mb-3">
                    <label for="artworkTitle">Title</label>
                    <asp:TextBox ID="artworkTitle" type="text" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblArtworkTitle" CssClass="invalid-feedback d-block" Visible="false" Text="A title is required." runat="server"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="artworkDescription">Description <span class="text-muted">(Optional)</span></label>
                    <asp:TextBox ID="artworkDescription" type="text" TextMode="multiline" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblArtworkDescription" CssClass="invalid-feedback d-block" Visible="false" runat="server"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="artworkPrice">Price</label>
                    <asp:TextBox ID="artworkPrice" type="number" CssClass="form-control"
                        placeholder="0.00" step="0.01" min="0" max="1000000000" runat="server"></asp:TextBox>
                    <asp:Label ID="lblArtworkPrice" CssClass="invalid-feedback d-block" Visible="false" Text="Please enter a valid price." runat="server"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="artworkStock">Stock</label>
                    <asp:TextBox ID="artworkStock" type="number" CssClass="form-control"
                        value="0" step="1" min="0" max="10000" runat="server"></asp:TextBox>
                    <asp:Label ID="lblArtworkStock" CssClass="invalid-feedback d-block" Visible="false" Text="Please enter a valid stock." runat="server"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="artworkImage">Image</label>
                    <div class="input-group">
                        <div class="custom-file">
                            <asp:Label ID="lblArtworkImageFileName" for="artworkImage" CssClass="lblArtworkImageFileName custom-file-label d-block form-control" Text="Choose file" runat="server"></asp:Label>
                            <asp:FileUpload ID="artworkImage" name="image" type="file" class="custom-file-input" onchange="previewFile(this)" accept="image/png" runat="server" />
                        </div>
                    </div>
                    <asp:Label ID="lblArtworkImage" CssClass="invalid-feedback d-block" Visible="false" runat="server"></asp:Label>
                </div>

                <div class="d-block my-3">
                    <label>Status</label>
                    <asp:RadioButtonList ID="artworkStatus" runat="server">
                        <asp:ListItem Selected="True">Available</asp:ListItem>
                        <asp:ListItem>Unavailable</asp:ListItem>
                        <asp:ListItem>Hidden</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <hr class="mb-4">
                <asp:Button ID="BtnPost" class="btn btn-primary btn-lg btn-block" runat="server" Text="Create Post" OnClick="BtnPost_Click" />
            </div>
            <img class="h-100 w-100 col-8 m-auto" id="artworkPreview" src="150.png" />
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
    <script>
        document.getElementsByClassName('nav-link')[2].classList += ' active';

        // Display image after uploading.
        function previewFile(e) {
            var preview = document.querySelector('#artworkPreview');
            var file = e.files[0];
            var label = document.querySelector('.lblArtworkImageFileName');

            var reader = new FileReader();

            reader.addEventListener("load", function () {
                preview.src = reader.result;
            }, false);

            if (file) {
                label.innerHTML = file.name;
                reader.readAsDataURL(file);
            }
        }
    </script>
</asp:Content>
