<%@ Page Title="" Language="C#" MasterPageFile="~/artist/artist.Master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.artwork.view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentMain" runat="server">
    <form runat="server">
        <asp:GridView DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Art_ID" runat="server">
            <Columns>
                <asp:BoundField DataField="Art_ID" HeaderText="Art_ID" InsertVisible="False" ReadOnly="True" SortExpression="Art_ID" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                <asp:BoundField DataField="Artist_ID" HeaderText="Artist_ID" SortExpression="Artist_ID" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="Image" runat="server" Height="100px" Width="100px"
                            ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Image"))%>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtGalleryConnStr %>" SelectCommand="SELECT * FROM [Artwork]"></asp:SqlDataSource>
    </form>
</asp:Content>
