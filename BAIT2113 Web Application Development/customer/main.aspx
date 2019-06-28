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
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    Art_ID:
                    <asp:Label ID="Art_IDLabel" runat="server" Text='<%# Eval("Art_ID") %>' />
                    <br />
                    Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    Status:
                    <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />
                    Image:
                    <%--<asp:Label ID="ImageLabel" runat="server" Text='<%# Eval("Image") %>' />--%>
                    <asp:Image ID="ImageLabel" runat="server"
                        src='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Image"))%>' />
                    <br />
                    Artist_ID:
                    <asp:Label ID="Artist_IDLabel" runat="server" Text='<%# Eval("Artist_ID") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</asp:Content>
