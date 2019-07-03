<%@ Page Title="" Language="C#" MasterPageFile="~/customer/customer.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="BAIT2113_Web_Application_Development.customer.main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Art Gallery - Main</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <%-- Jumbotron --%>
        <div class="jumbotron jumbotron-fluid" style="margin-top: 50px;">
            <div class="container">
                <h1 class="display-4">Welcome to Art Gallery</h1>
                <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
            </div>
        </div>

        <%-- Content --%>
        <div class="container ">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-5 shadow-sm h-md-250 position-relative">
                        <div class="col-4 p-4 d-flex flex-column position-static">
                            <strong class="d-inline-block mb-2 text-primary">World</strong>
                            <h3 class="mb-0"><%# Eval("Title") %></h3>
                            <a href="#" class="mb-1 text-muted"><%# Eval("Artist.Username") %></a>
                            <p class="card-text mb-auto"><%# Eval("Description") %></p>
                            <div><%# Eval("Status") %> - <%# Eval("Price") %></div>
                        </div>
                        <a href="#" class="col-8 d-none d-lg-block">
                            <img class="w-100 h-100" src='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Image"))%>' />
                        <a/>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</asp:Content>
