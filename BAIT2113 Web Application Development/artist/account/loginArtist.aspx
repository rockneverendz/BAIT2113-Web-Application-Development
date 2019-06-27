<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginArtist.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.account.loginArtist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" />
	<title>Artist | Login</title>
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
	<form id="form1" class="form-signin" runat="server">
		<div class="text-center mb-4">
			<%--<img class="img-fluid" src="../../resource/Logo1.png" alt="logo" width="75%" />--%>
			<h1 class="display-3">Sign In</h1>
		</div>
		<div class="text-center mb-4">
			<asp:Label ID="lblAns" runat="server"></asp:Label>
		</div>
		<div class="form-label-group">
			<asp:TextBox ID="txtUsername" name="Username" type="text" class="form-control"
				placeholder="Username" value="" runat="server"></asp:TextBox>
			<label for="inputUsername">Username</label>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
		</div>
		<div class="form-label-group">
			<asp:TextBox ID="txtPassword" name="Password" type="password" class="form-control"
				placeholder="Password" runat="server"></asp:TextBox>
			<label for="inputPassword">Password</label>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
			<p>
				<small><a href="#">Forget Password?</a></small>
			</p>
		</div>

		<asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-lg btn-primary btn-block" />
		<hr />
		<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/artist/account/registerArtist.aspx" CssClass="btn btn-lg btn-secondary btn-block">Register an account?</asp:HyperLink>

		
	</form>
</body>
</html>
