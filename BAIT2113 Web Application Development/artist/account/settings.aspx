<%@ Page Title="" Language="C#" MasterPageFile="~/artist/artist.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.account.settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <form class="container mt-4" runat="server">
        <asp:Label ID="lblServerResponse" CssClass="d-block alert" role="alert" Visible="false" runat="server"></asp:Label>
        <div class="row">
            <div class="col-4">
                <div class="mb-3">
                    <label for="inputEmail">Email</label>
                    <asp:TextBox ID="inputEmail" name="Email" type="email" class="form-control"
                        placeholder="Email address" required="true" runat="server"></asp:TextBox>
                    <asp:Label ID="lblEmail" CssClass="invalid-feedback d-block" Visible="false" Text="An email is required." runat="server"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="inputPassword">Password</label>
                    <asp:TextBox ID="inputPassword" name="Password" type="password" class="form-control"
                        placeholder="Password" runat="server"></asp:TextBox>
                    <asp:Label ID="lblPassword" CssClass="invalid-feedback d-block" Visible="false" runat="server"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="inputRetypePassword">Retype Password</label>
                    <asp:TextBox ID="inputRetypePassword" name="Password" type="password" class="form-control"
                        placeholder="Password" runat="server"></asp:TextBox>
                    <asp:Label ID="lblRetypePassword" CssClass="invalid-feedback d-block" Visible="false" Text="Retyped password is not the same." runat="server"></asp:Label>
                </div>

                <hr class="mb-4">

                <div class="mb-3">
                    <label for="inputOldPassword">Current Password</label>
                    <asp:TextBox ID="inputOldPassword" name="Password" type="password" class="form-control"
                        placeholder="Password" runat="server" required="true"></asp:TextBox>
                    <asp:Label ID="lblOldPassword" CssClass="invalid-feedback d-block" Visible="false" Text="Current password does not match." runat="server"></asp:Label>
                </div>

                <asp:Button ID="BtnSave" class="btn btn-primary btn-lg btn-block" runat="server" Text="Save Changes" OnClick="BtnSave_Click" />
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
    <script>
        document.getElementsByClassName('nav-link')[4].classList += ' active';
    </script>
</asp:Content>
