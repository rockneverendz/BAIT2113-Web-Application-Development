﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.account.signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" />
    <title>User Login</title>
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        html,
        body {
            height: 100%;
        }

        body {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            width: 100%;
            max-width: 420px;
            padding: 15px;
            margin: auto;
        }

        .form-label-group {
            position: relative;
            margin-bottom: 1rem;
        }

            .form-label-group > input,
            .form-label-group > label {
                height: 3.125rem;
                padding: .75rem;
            }

            .form-label-group > label {
                position: absolute;
                top: 0;
                left: 0;
                display: block;
                width: 100%;
                margin-bottom: 0; /* Override default `<label>` margin */
                line-height: 1.5;
                color: #495057;
                pointer-events: none;
                cursor: text; /* Match the input under the label */
                border: 1px solid transparent;
                border-radius: .25rem;
                transition: all .1s ease-in-out;
            }

            .form-label-group input::-webkit-input-placeholder {
                color: transparent;
            }

            .form-label-group input:-ms-input-placeholder {
                color: transparent;
            }

            .form-label-group input::-ms-input-placeholder {
                color: transparent;
            }

            .form-label-group input::-moz-placeholder {
                color: transparent;
            }

            .form-label-group input::placeholder {
                color: transparent;
            }

            .form-label-group input:not(:placeholder-shown) {
                padding-top: 1.25rem;
                padding-bottom: .25rem;
            }

                .form-label-group input:not(:placeholder-shown) ~ label {
                    padding-top: .25rem;
                    padding-bottom: .25rem;
                    font-size: 12px;
                    color: #777;
                }
        /* Fallback for Edge
            -------------------------------------------------- */
        @supports (-ms-ime-align: auto) {
            .form-label-group > label {
                display: none;
            }

            .form-label-group input::-ms-input-placeholder {
                color: #777;
            }
        }
        /* Fallback for IE
            -------------------------------------------------- */
        @media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
            .form-label-group > label {
                display: none;
            }

            .form-label-group input:-ms-input-placeholder {
                color: #777;
            }
        }
    </style>
</head>
<body>
    <form class="form-signin" id="form1" runat="server">

        <%-- Header --%>
        <div class="mx-auto mb-4 w-100">
            <div class="display-4 text-muted">Member</div>
            <h1 class="display-3">Sign In</h1>
        </div>

        <%-- Error Messages --%>
        <div id="sysResponseBox" class="alert alert-danger" role="alert" visible="false" runat="server">
            <asp:Label ID="sysResponse" runat="server"></asp:Label>
        </div>

        <%-- Form --%>
        <div class="form-label-group">
            <asp:TextBox ID="inputUsername" name="Username" type="text" class="form-control"
                placeholder="Username" value="" runat="server" required="true" autofocus="true"></asp:TextBox>
            <label for="inputUsername">Username</label>
        </div>
        <div class="form-label-group">
            <asp:TextBox ID="inputPassword" name="Password" type="password" class="form-control"
                placeholder="Password" runat="server" required="true"></asp:TextBox>
            <label for="inputPassword">Password</label>
        </div>

        <%--Submit Button--%>
        <asp:Button ID="BtnSignIn" class="btn btn-lg btn-primary btn-block" runat="server" Text="Sign In" OnClick="BtnSignIn_Click" />
        <hr />
        <a class="btn btn-lg btn-secondary btn-block" style="color: white;" href="signup.aspx">Create New Account</a>

        <div class="mt-5 mb-3 d-flex text-muted">
            <div>
                <a href="../../artist/account/loginArtist.aspx">Artist Portal</a>
                <br />
                <a href="../../ArtGallery.aspx">Home</a>
            </div>
            <div class="ml-auto">Bricks © 2019</div>
        </div>
    </form>
</body>
</html>
