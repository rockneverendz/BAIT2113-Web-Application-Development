using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.customer.cart
{
    public partial class cartList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Visible)
            {
                List<OrderItem> cart = (List<OrderItem>)Session["cart"];

                if (cart == null || cart.Count == 0)
                {
                    Response.Redirect("~/customer/main.aspx");
                }

                List<CartList> list = new List<CartList>();
                ArtGalleryEntities context = new ArtGalleryEntities();
                Artwork artwork;
                decimal? subtotal;
                decimal? total = 0;

                for (int index = 0; index < cart.Count; index++)
                {
                    OrderItem orderItem = cart[index];
                    artwork = context.Artworks.Find(orderItem.Art_ID);
                    subtotal = orderItem.Quantity * orderItem.PriceEach;
                    total += subtotal;

                    list.Add(new CartList
                    {
                        Index = index + 1,
                        Art_ID = artwork.Art_ID,
                        Title = artwork.Title,
                        Base64image = Convert.ToBase64String(artwork.Image),
                        Quantity = orderItem.Quantity,
                        PriceEach = orderItem.PriceEach,
                        Subtotal = subtotal
                    });
                }

                Repeater1.DataSource = list;
                Repeater1.DataBind();

                orderTotal.Text = String.Format("RM {0:0.00}", total);
            }
        }

        protected void removeItem(object sender, EventArgs e)
        {
            List<OrderItem> cart = (List<OrderItem>)Session["cart"];
            cart.RemoveAt(Convert.ToInt32(((ImageButton)sender).CommandArgument) - 1);
            Response.Redirect(Request.RawUrl);
        }

        protected void orderQuantity_TextChanged(object sender, EventArgs e)
        {
            // Get the sender, find the required labels.
            TextBox orderQuantity = (TextBox)sender;
            Label lblIndex = (Label)orderQuantity.NamingContainer.FindControl("lblIndex");
            Label lblSubtotal = (Label)orderQuantity.NamingContainer.FindControl("lblSubtotal");

            // Find cart element by index.
            int orderIndex = Convert.ToInt32(lblIndex.Text) - 1;
            List<OrderItem> cart = (List<OrderItem>)Session["cart"];
            OrderItem orderItem = cart.ElementAt(orderIndex);

            // Update Quantity
            orderItem.Quantity = Convert.ToInt32(orderQuantity.Text);

            // Update Subtotal
            lblSubtotal.Text = String.Format("{0:0.00}", orderItem.Quantity * orderItem.PriceEach);

            // Update Total
            decimal? total = 0;
            foreach (OrderItem oi in cart)
                total += oi.Quantity * oi.PriceEach;
            orderTotal.Text = String.Format("RM {0:0.00}", total);
        }
    }
}