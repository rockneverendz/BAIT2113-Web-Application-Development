<%@ Page Title="" Language="C#" MasterPageFile="~/artist/artist.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.artwork.create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentMain" runat="server">
    <div class="row">
        <form class="needs-validation col-4" novalidate runat="server">
            <div class="mb-3">
                <label for="artworkTitle">Title</label>
                <input type="text" class="form-control" id="artworkTitle" placeholder="" value="" required>
                <div class="invalid-feedback">
                    A title is required.
                </div>
            </div>

            <div class="mb-3">
                <label for="artworkDescription">Description <span class="text-muted">(Optional)</span></label>
                <textarea class="form-control" id="artworkDescription" placeholder=""></textarea>
            </div>

            <div class="mb-3">
                <label for="artworkPrice">Price</label>
                <input type="number" class="form-control" id="artworkPrice"
                    placeholder="0.00" step="0.01" min="0" max="1000000000" required>
                <div class="invalid-feedback">
                    Please enter a valid price.
                </div>
            </div>

            <div class="mb-3">
                <label for="artworkImage">Image</label>
                <div class="input-group">
                    <div class="custom-file">
                        <label id="lblImage" for="artworkImage" class="form-control custom-file-label">Choose file</label>
                        <input id="artworkImage" name="image" type="file" class="custom-file-input" onchange="previewFile()" accept="image/png" required>
                    </div>
                </div>
            </div>

            <div class="d-block my-3">
                <label>Status</label>                
                <div class="custom-control custom-radio">
                    <input id="rbtnAvailable" name="artworkStatus" type="radio" class="custom-control-input" checked required>
                    <label class="custom-control-label" for="rbtnAvailable">Available</label>
                </div>
                <div class="custom-control custom-radio">
                    <input id="rbtnReserved" name="artworkStatus" type="radio" class="custom-control-input" required>
                    <label class="custom-control-label" for="rbtnReserved">Reserved</label>
                </div>
                <div class="custom-control custom-radio">
                    <input id="rbtnUnavailable" name="artworkStatus" type="radio" class="custom-control-input" required>
                    <label class="custom-control-label" for="rbtnUnavailable">Unavailable</label>
                </div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Create Post</button>
        </form>
        <img class="h-100 w-100 col-8" id="artworkPreview" src="150.png" />
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentScript" runat="server">
    <script>
        // Display image after uploading.
        function previewFile() {
            var preview = document.querySelector('#artworkPreview');
            var file = document.querySelector('#artworkImage').files[0];
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

        // Example starter JavaScript for disabling form submissions if there are invalid fields
        $(function () {
            'use strict'

            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation')

                // Loop over them and prevent submission
                Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
            }, false)
        }())
    </script>
</asp:Content>
