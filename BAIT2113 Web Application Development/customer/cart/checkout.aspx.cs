using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.customer.cart
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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

                orderTotal.Text = string.Format("RM {0:0.00}", total);
                orderTotalPayPal.Text = string.Format("{0:0.00}", total);

            }
        }
    }
}