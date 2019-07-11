using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.customer.cart
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<OrderItem> cart = (List<OrderItem>)Session["cart"];

                if (cart == null || cart.Count == 0)
                    Response.Redirect("~/customer/cart/cartEmpty.aspx");

                ArtGalleryEntities context = new ArtGalleryEntities();
                DataTable dt = new DataTable();
                Artwork artwork;
                decimal? subtotal;
                decimal? total = 0;

                dt.Columns.AddRange(new DataColumn[7] {
                    new DataColumn("Index"),
                    new DataColumn("Art_ID"),
                    new DataColumn("Title"),
                    new DataColumn("Image"),
                    new DataColumn("Quantity"),
                    new DataColumn("PriceEach"),
                    new DataColumn("Subtotal")
                });

                for (int index = 0; index < cart.Count; index++)
                {
                    OrderItem orderItem = cart[index];
                    artwork = context.Artworks.Find(orderItem.Art_ID);
                    subtotal = orderItem.Quantity * orderItem.PriceEach;
                    total += subtotal;

                    dt.Rows.Add(
                        index + 1,
                        artwork.Art_ID,
                        artwork.Title,
                        Convert.ToBase64String(artwork.Image),
                        orderItem.Quantity,
                        String.Format("{0:0.00}", orderItem.PriceEach),
                        String.Format("{0:0.00}", subtotal)
                        );
                }

                GridView1.DataSource = dt;
                GridView1.DataBind();

                orderTotal.Text = String.Format("RM {0:0.00}", total);

            }
        }

        protected void removeItem(object sender, EventArgs e)
        {
            List<OrderItem> cart = (List<OrderItem>)Session["cart"];
            cart.RemoveAt(Convert.ToInt32(((Button)sender).CommandArgument) - 1);
            Response.Redirect(Request.RawUrl);
        }

        protected void orderQuantity_TextChanged(object sender, EventArgs e)
        {
            TextBox orderQuantity = (TextBox)sender;
            GridViewRow row = (GridViewRow)orderQuantity.NamingContainer;
            int orderIndex = Convert.ToInt32(row.Cells[0].Text) - 1;
            List<OrderItem> cart = (List<OrderItem>)Session["cart"];
            OrderItem orderItem = cart.ElementAt(orderIndex);
            orderItem.Quantity = Convert.ToInt32(orderQuantity.Text);

            //Update Subtotal
            row.Cells[6].Text = String.Format("{0:0.00}", orderItem.Quantity * orderItem.PriceEach);

            //Update Total
            decimal? total = 0;
            foreach (OrderItem oi in cart)
            {
                total += oi.Quantity * oi.PriceEach;
            }
            orderTotal.Text = String.Format("RM {0:0.00}", total);
        }
    }
}