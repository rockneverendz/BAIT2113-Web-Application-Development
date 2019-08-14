<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cartList.ascx.cs" Inherits="BAIT2113_Web_Application_Development.customer.cart.cartList" %>

<div class="card border-top-0 mb-5">
    <table class="table mb-0">
        <thead>
            <tr>
                <th scope="col" style="width: 5%">#</th>
                <th scope="col" style="width: 20%">Title</th>
                <th scope="col" style="width: 20%">Image</th>
                <th scope="col" style="width: 15%">Quantity</th>
                <th scope="col" style="width: 15%">Price</th>
                <th scope="col" style="width: 15%">Subtotal</th>
                <th scope="col" style="width: 10%"></th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <th scope="row">
                            <asp:Label ID="lblIndex" runat="server" Text='<%# Eval("Index") %>'></asp:Label>
                        </th>
                        <td><%# Eval("Title") %></td>
                        <td>
                            <img style="max-height: 150px; max-width: 150px" src='<%#"data:Image/png;base64," + Eval("Base64image")%>' />
                        </td>
                        <td>
                            <asp:TextBox ID="orderQuantity" type="number" class="form-control" placeholder="Quantity" value='<%# Eval("Quantity") %>' min="1" max='<%# Eval("Stock") %>' runat="server" OnTextChanged="orderQuantity_TextChanged" AutoPostBack="True"></asp:TextBox>
                        </td>
                        <td><%# String.Format("RM {0:0.00}", Eval("PriceEach")) %></td>
                        <td>
                            <asp:Label ID="lblSubtotal" runat="server" Text='<%# String.Format("RM {0:0.00}", Eval("Subtotal")) %>'></asp:Label>
                        </td>
                        <td>
                            <asp:ImageButton ID="btnRemove" class="far btn btn-danger" Style="width: 3rem; height: 2rem" ImageUrl="../../resource/trash-alt-solid.svg"
                                data-toggle="tooltip" data-placement="right" title="Remove from Cart"
                                AlternateText="Remove from Cart" CommandArgument='<%# Eval("Index") %>' OnClick="removeItem" runat="server" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
        <tfoot>
            <tr>
                <th scope="col" colspan="4"></th>
                <th scope="col">Total</th>
                <th scope="col">
                    <asp:Label ID="orderTotal" runat="server" Text="RM 0.00"></asp:Label>
                </th>
                <th></th>
            </tr>
        </tfoot>
    </table>
</div>
<div class="float-right mt-4">
    <a href="checkout.aspx" role="button" class="btn btn-primary btn-lg">Proceed to Checkout</a>
</div>
