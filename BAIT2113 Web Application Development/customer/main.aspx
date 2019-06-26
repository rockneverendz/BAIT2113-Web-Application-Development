<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Art Gallery - Main</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <%--Jumbotron--%>
        <div class="jumbotron jumbotron-fluid" style="margin-top: 50px;">
            <div class="container">
                <h1 class="display-4">Welcome to Art Gallery</h1>
                <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
            </div>
        </div>

        <%--Content--%>
        <div class="container ">
            <div class="row">
                <div class="card col">
                    <asp:Image ID="Image3" runat="server" />
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
                <div class="card col">
                    <asp:Image ID="Image2" runat="server" />
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
                <div class="card col">
                    <asp:Image ID="Image1" runat="server" />
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>
            <hr />
        </div>
    </form>
</asp:Content>
