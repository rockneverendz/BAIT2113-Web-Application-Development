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
                ArtGalleryEntities context = new ArtGalleryEntities();
                DataTable dt = new DataTable();
                Artwork artwork;

                dt.Columns.AddRange(new DataColumn[6] {
                    new DataColumn("Index"),
                    new DataColumn("Art_ID"),
                    new DataColumn("Title"),
                    new DataColumn("Image"),
                    new DataColumn("Quantity"),
                    new DataColumn("PriceEach")
                });

                for (int index = 0; index < cart.Count; index++)
                {
                    OrderItem orderItem = cart[index];
                    artwork = context.Artworks.Find(orderItem.Art_ID);

                    dt.Rows.Add(
                        index + 1,
                        artwork.Art_ID,
                        artwork.Title,
                        Convert.ToBase64String(artwork.Image),
                        orderItem.Quantity,
                        orderItem.PriceEach
                        );
                }

                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
        }

        protected void removeItem(object sender, EventArgs e)
        {
            List<OrderItem> cart = (List<OrderItem>)Session["cart"];
            cart.RemoveAt(Convert.ToInt32(((Button)sender).CommandArgument));
            // Refresh..?
        }

        protected void orderQuantity_TextChanged(object sender, EventArgs e)
        {
            TextBox orderQuantity = (TextBox)sender;
            int orderIndex = Convert.ToInt32(((Label)orderQuantity.Parent.FindControl("orderIndex")).Text);
            List<OrderItem> cart = (List<OrderItem>)Session["cart"];
            OrderItem orderItem = cart.ElementAt(orderIndex - 1);
            orderItem.Quantity = Convert.ToInt32(orderQuantity.Text);
        }
    }
}