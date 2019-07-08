<%@ Page Title="" Language="C#" MasterPageFile="~/artist/artist.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.artwork.create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentMain" runat="server">
    <div class="row">
        <form class="needs-validation col-4" novalidate runat="server">
            <div class="mb-3">
                <label for="artworkTitle">Title</label>
                <asp:TextBox ID="artworkTitle" type="text" class="form-control" runat="server" required></asp:TextBox>
                <div class="invalid-feedback">
                    A title is required.
                </div>
            </div>

            <div class="mb-3">
                <label for="artworkDescription">Description <span class="text-muted">(Optional)</span></label>
                <asp:TextBox ID="artworkDescription" type="text" TextMode="multiline" class="form-control" runat="server" required></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="artworkPrice">Price</label>
                <asp:TextBox ID="artworkPrice" type="number" class="form-control"
                    placeholder="0.00" step="0.01" min="0" max="1000000000" runat="server" required></asp:TextBox>
                <div class="invalid-feedback">
                    Please enter a valid price.
                </div>
            </div>

            <div class="mb-3">
                <label for="artworkStock">Stock</label>
                <asp:TextBox ID="artworkStock" type="number" class="form-control"
                    value="0" step="1" min="0" max="10000" runat="server" required></asp:TextBox>
                <div class="invalid-feedback">
                    Please enter a valid stock.
                </div>
            </div>

            <div class="mb-3">
                <label for="artworkImage">Image</label>
                <div class="input-group">
                    <div class="custom-file">
                        <label id="lblImage" for="artworkImage" class="form-control custom-file-label">Choose file</label>
                        <asp:FileUpload ID="artworkImage" name="image" type="file" class="custom-file-input" onchange="previewFile(this)" accept="image/png" runat="server" required />
                    </div>
                </div>
            </div>

            <div class="d-block my-3">
                <label>Status</label>
                <asp:RadioButtonList ID="artworkStatus" runat="server">
                    <asp:ListItem>Available</asp:ListItem>
                    <asp:ListItem>Unavailable</asp:ListItem>
                    <asp:ListItem>Hidden</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <hr class="mb-4">
            <asp:Button ID="BtnPost" class="btn btn-primary btn-lg btn-block" runat="server" Text="Create Post" OnClick="BtnPost_Click" />
        </form>
        <img class="h-100 w-100 col-8 m-auto" id="artworkPreview" src="150.png" />
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentScript" runat="server">
    <script>
        // Display image after uploading.
        function previewFile(e) {
            var preview = document.querySelector('#artworkPreview');
            var file = e.files[0];
            var label = document.querySelector('#lblImage');

            var reader = new FileReader();

            reader.addEventListener("load", function () {
                preview.src = reader.result;
            }, false);

            if (file) {
                label.innerHTML = file.name;
                reader.readAsDataURL(file);
            }
        }
        $(function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</asp:Content>
