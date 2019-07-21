<%@ Page Title="" Language="C#" MasterPageFile="~/artist/artist.Master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="BAIT2113_Web_Application_Development.artist.artwork.view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentMain" runat="server">
    <form runat="server">
        <asp:GridView DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Art_ID" runat="server">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ShowEditButton="True"></asp:CommandField>
                <asp:BoundField DataField="Art_ID" HeaderText="Art_ID" InsertVisible="False" ReadOnly="True" SortExpression="Art_ID" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="Image" runat="server" Height="100px" Width="100px"
                            ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Image"))%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Image ID="Image" runat="server" Height="100px" Width="100px"
                            ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Image"))%>' /><br />
                        <%--<asp:FileUpload ID="artworkImage" name="image" type="file" accept="image/png" runat="server" />--%>
                        <%--https://forums.asp.net/t/2068827.aspx?GridView+Uploade+an+image+in+edit+--%>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" ReadOnly="True" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                <asp:BoundField DataField="Artist_ID" HeaderText="Artist_ID" SortExpression="Artist_ID" ReadOnly="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtGalleryConnStr %>" 
            SelectCommand="SELECT * FROM [Artwork] WHERE ([Artist_ID] = @Artist_ID) ORDER BY [Art_ID] DESC" 
            UpdateCommand="UPDATE [Artwork] SET [Title] = @Title, [Description] = @Description, [Status] = @Status, [Price] = @Price, [Stock] = @Stock WHERE [Art_ID] = @Art_ID">
            <SelectParameters>
                <asp:SessionParameter SessionField="Artist_ID" Name="Artist_ID" Type="Int32"></asp:SessionParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String"></asp:Parameter>
                <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                <asp:Parameter DbType="DateTime2" Name="Date"></asp:Parameter>
                <asp:Parameter Name="Status" Type="String"></asp:Parameter>
                <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                <%--<asp:Parameter Name="Image" Type="Object"></asp:Parameter>--%>
                <asp:Parameter Name="Stock" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Artist_ID" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Art_ID" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
