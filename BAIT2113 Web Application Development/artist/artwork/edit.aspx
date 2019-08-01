<%@ Page Title="" Language="C#" MasterPageFile="~/artist/artist.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.artwork.edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <form runat="server">
        <asp:Label ID="lblServerResponse" CssClass="d-block alert" role="alert" Visible="false" runat="server"></asp:Label>
        <div class="row">
            <div class="col-4">
                <div class="mb-3">
                    <label for="artworkTitle">Title</label>
                    <asp:TextBox ID="artworkTitle" type="text" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblArtworkTitle" CssClass="invalid-feedback d-block" Visible="false" Text="A title is required." runat="server"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="artworkDescription">Description <span class="text-muted">(Optional)</span></label>
                    <asp:TextBox ID="artworkDescription" type="text" TextMode="multiline" class="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblArtworkDescription" CssClass="invalid-feedback d-block" Visible="false" runat="server"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="artworkPrice">Price</label>
                    <asp:TextBox ID="artworkPrice" type="number" class="form-control"
                        placeholder="0.00" step="0.01" min="0" max="1000000000" runat="server"></asp:TextBox>
                    <asp:Label ID="lblArtworkPrice" CssClass="invalid-feedback d-block" Visible="false" Text="Please enter a valid price." runat="server"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="artworkStock">Stock</label>
                    <asp:TextBox ID="artworkStock" type="number" class="form-control"
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
                <asp:Button ID="BtnUpdate" class="btn btn-primary btn-lg btn-block" runat="server" Text="Update Post" OnClick="BtnUpdate_Click" />
                <button type="button" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#deleteModal">Remove Post</button>
                <a role="button" class="btn btn-secondary btn-lg btn-block" href="<%= ResolveUrl("~/artist/artwork/view.aspx") %>">Cancel</a>

                <!-- Remove post confirmation modal -->
                <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalCenterTitle">Remove Post</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Are you sure you want to remove this post?
                            <br />
                                <strong>This action cannot be undone!</strong>
                            </div>
                            <div class="modal-footer d-flex justify-content-between align-items-center">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <asp:Button ID="BtnRemove" runat="server" CssClass="btn btn-danger" Text="Confirm Remove" OnClick="BtnRemove_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Image ID="artworkPreview" runat="server" CssClass="h-100 w-100 col-8 m-auto artwork-preview" />
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
    <script>
        // Display image after uploading.
        function previewFile(e) {
            var preview = document.querySelector('.artwork-preview');
            var file = e.files[0];
            var label = document.querySelector('.lblArtworkImageFileName');

            var reader = new FileReader();

            if (file && file.type === "image/png") {

                reader.addEventListener("load", function () {
                    preview.src = reader.result;
                }, false);

                label.innerHTML = file.name;
                reader.readAsDataURL(file);
            }
        }
    </script>
</asp:Content>
