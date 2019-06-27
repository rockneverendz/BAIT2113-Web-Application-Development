<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.account.signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
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
		<div class="text-center mb-4">
			<%--<img class="img-fluid" src="../../resource/Logo1.png" alt="logo" width="75%" />--%>
			<h1 class="display-3">Sign In</h1>
		</div>
		<div class="form-label-group">
			<asp:TextBox ID="inputUsername" name="Username" type="text" class="form-control"
				placeholder="Username" value="" runat="server" required autofocus></asp:TextBox>
			<label for="inputUsername">Username</label>
		</div>
		<div class="form-label-group">
			<asp:TextBox ID="inputPassword" name="Password" type="password" class="form-control"
				placeholder="Password" runat="server" required></asp:TextBox>
			<label for="inputPassword">Password</label>
			<p>
				<small><a href="./passrecovery.jsp">Forget Password?</a></small>
			</p>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign In</button>
		<hr />
		<a class="btn btn-lg btn-secondary btn-block" style="color: white;" href="./signup.jsp">Create New Account</a>
		<p class="mt-5 mb-3 text-muted text-center">Bricks © 2019</p>
	</form>
</body>
</html>
