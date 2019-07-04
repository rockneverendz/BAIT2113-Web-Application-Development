<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registerArtist.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.account.registerArtist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" />
    <title>Artist | Register Account</title>
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

        .form-signup {
            width: 100%;
            max-width: 450px;
            padding: 15px;
            margin: auto;
        }

        .form-label-group {
            position: relative;
            margin-bottom: 0.25rem;
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
    <form id="form1" runat="server" class="form-signup">
        
        <%-- Header --%>        
        <div class="text-center mb-4">
            <h1 class="text-center">Register Account</h1>
        </div>

        <%-- Error Messages --%>
        <div id="sysResponseBox" class="alert alert-danger" role="alert" visible="false" runat="server">
            <asp:Label ID="sysResponse" runat="server"></asp:Label>
        </div>

        <%-- Form --%>
        <div class="form-label-group">
            <asp:TextBox ID="inputUsername" name="Username" type="text" class="form-control"
                placeholder="Username" value="" required="true" runat="server"></asp:TextBox>
            <label for="inputUsername">Username</label>
        </div>
        <div class="form-label-group">
            <asp:TextBox ID="inputEmail" name="Email" type="email" class="form-control"
                placeholder="Email address" required="true" runat="server"></asp:TextBox>
            <label for="inputEmail">Email address</label>
        </div>
        <div class="form-label-group">
            <asp:TextBox ID="inputContactNo" name="ContactNo" type="tel" class="form-control"
                placeholder="Contact Number" pattern="[0-9]{10}" required="true" runat="server"></asp:TextBox>
            <label for="inputContactNo">Contact Number</label>
        </div>
        <div class="form-label-group">
            <asp:TextBox ID="inputPassword" name="Password" type="password" class="form-control"
                placeholder="Password" required="true" data-toggle="tooltip" data-placement="left"
                title="At least 8 Alpanumeric characters with at least one uppercase and lowercase letter"
                pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" runat="server"></asp:TextBox>
            <label for="inputPassword">Password</label>
        </div>
        <div class="form-label-group">
            <asp:TextBox ID="inputConfirmPass" name="CPassword" type="password" class="form-control"
                placeholder=" Confirm Password" required="true" runat="server"></asp:TextBox>
            <label for="inputConfirmPass">Confirm Password</label>
        </div>

        <%--Submit Button--%>
        <asp:Button ID="BtnRegister" runat="server" OnClick="BtnRegister_Click" Text="Create Account" CssClass="btn btn-lg btn-primary btn-block" />
        <hr />
        <a class="btn btn-lg btn-secondary btn-block" href="loginArtist.aspx">Back to log in</a>
        <p class="mt-5 mb-3 text-muted text-center">Bricks © 2019</p>
    </form>
</body>
</html>
