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
		<div class="text-center mb-4">
			<h1 class="text-center">Register Account</h1>
		</div>

		<%--Error Message--%>
		<p>
			<asp:Label ID="lblAns" runat="server" ForeColor="Red" CssClass="small alert alert-danger"></asp:Label>
		</p>

		<%--Form Group--%>
		<div class="form-label-group">
			<asp:TextBox ID="txtUsername" runat="server" placeholder="User Name" CssClass="form-control"></asp:TextBox>
			<label for="lblUsername">User Name</label>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="txtUsername" ForeColor="Red" CssClass="small"></asp:RequiredFieldValidator>
		</div>
		<div class="form-label-group">
			<asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
			<label for="lblEmail">Email</label>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="txtEmail" ForeColor="Red" CssClass="small"></asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator ID="remail" runat="server"
				ControlToValidate="txtemail" ErrorMessage="Please enter valid email!"
				ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" CssClass="small">
			</asp:RegularExpressionValidator>
		</div>
		<div class="form-label-group">
			<asp:TextBox ID="txtContactNo" runat="server" placeholder="Contact No" CssClass="form-control" TextMode="Phone"></asp:TextBox>
			<label for="lblContact">Contact No</label>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="txtContactNo" ForeColor="Red" CssClass="small"></asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator ID="rePhNum" runat="server"
				ControlToValidate="txtContactNo" ErrorMessage="Please enter a valid contact number!"
				ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$" ForeColor="Red" CssClass="small">
			</asp:RegularExpressionValidator>
		</div>
		<div class="form-label-group">
			<asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
			<label for="lblPassword">Password</label>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="txtPassword" ForeColor="Red" CssClass="small"></asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator ID="repassword" runat="server"
				ControlToValidate="txtPassword" ErrorMessage="At least 8 Alpanumeric characters with at least one uppercase and lowercase letter"
				ValidationExpression="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" ForeColor="Red" CssClass="small">
			</asp:RegularExpressionValidator>
		</div>
		<div class="form-label-group">
			<asp:TextBox ID="txtRePassword" runat="server" placeholder="Re-Type Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
			<label for="lblRePassword">Re-Type Password</label>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="txtRePassword" ForeColor="Red" CssClass="small"></asp:RequiredFieldValidator>
			<asp:CompareValidator ID="cmpPassword" runat="server" ErrorMessage="Password not match!" 
				ControlToCompare="txtPassword" ControlToValidate="txtRePassword" Operator="Equal" Type="String" ForeColor="Red" CssClass="small"></asp:CompareValidator>
		</div>

		<%--Submit Button--%>
		<asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Create Account" CssClass="btn btn-lg btn-primary btn-block" />
		<hr />
		<asp:HyperLink ID="hlLogin" runat="server" CssClass="btn btn-lg btn-secondary btn-block" NavigateUrl="~/artist/account/loginArtist.aspx">Back to Login</asp:HyperLink>
	</form>
</body>
</html>
