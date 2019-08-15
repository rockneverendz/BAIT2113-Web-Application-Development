<%@ Page Title="" Language="C#" MasterPageFile="~/artist/artist.Master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.artwork.view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
    <style>
        .jumbotron {
            padding-top: 3rem;
            padding-bottom: 3rem;
            margin-bottom: 0;
            background-color: #fff;
        }

        @media (min-width: 768px) {
            .jumbotron {
                padding-top: 6rem;
                padding-bottom: 6rem;
            }
        }

        .jumbotron p:last-child {
            margin-bottom: 0;
        }

        .jumbotron-heading {
            font-weight: 300;
        }

        .jumbotron .container {
            max-width: 40rem;
        }

        footer {
            padding-top: 3rem;
            padding-bottom: 3rem;
        }

            footer p {
                margin-bottom: .25rem;
            }

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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <form class="container-fluid mt-4" runat="server">
        <asp:Label ID="lblServerResponse" CssClass="d-block alert" role="alert" Visible="false" runat="server"></asp:Label>
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm">
                            <asp:Image ID="Image" runat="server" CssClass="card-img-top"
                                ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Image"))%>' />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Title") %></h5>
                                <p class="card-text"><%# Eval("Description") %></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="display-4" style="font-size: 1.5rem;"><%# String.Format("RM {0:0.00}", Eval("Price")) %></div>
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <button type="button" class="artwork-status btn" data-toggle="tooltip" data-placement="bottom" title="Status"><%# Eval("Status") %></button>
                                        <button type="button" class="btn btn-outline-dark" data-toggle="tooltip" data-placement="bottom" title="Stock"><%# Eval("Stock") %></button>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="text-muted">Posted on <%# Eval("Date") %></div>
                            </div>
                            <a class="stretched-link" style="cursor: pointer" href="edit.aspx?id=<%# Eval("Art_ID") %>"></a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScript" runat="server">
    <script>
        document.getElementsByClassName('nav-link')[3].classList += ' active';

        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })

        Array.from(document.querySelectorAll('.artwork-status')).forEach(function (element) {
            switch (element.innerHTML) {
                case "Available":
                    element.classList.add("btn-outline-success");
                    break;
                case "Unavailable":
                    element.classList.add("btn-outline-danger");
                    break;
                case "Hidden":
                    element.classList.add("btn-outline-warning");
                    break;
                default:
                    element.classList.add("btn-outline-secondary");
                    console.log("Unknown status");
            }
        });
    </script>
</asp:Content>
