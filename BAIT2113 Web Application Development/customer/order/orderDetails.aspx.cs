using BAIT2113_Web_Application_Development.customer.cart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.customer.order
{
    public partial class orderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<CartList> list = new List<CartList>();
                ArtGalleryEntities context = new ArtGalleryEntities();
                Artwork artwork;
                Order order;
                decimal? subtotal;
                decimal? total = 0;

                int order_id = Convert.ToInt32(Request.QueryString.Get("id"));
                order = context.Orders.Find(order_id);
                // TODO check order is the customer's before displaying

                jumbotronHeader.Text = string.Format("Order Details - Order #{0}", order.Order_ID);
                List<OrderItem> orderitems = order.OrderItems.ToList();

                for (int index = 0; index < orderitems.Count; index++)
                {
                    OrderItem orderItem = orderitems[index];
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
            }
        }
    }
}