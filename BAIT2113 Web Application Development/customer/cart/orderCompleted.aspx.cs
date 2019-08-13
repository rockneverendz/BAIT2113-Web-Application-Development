using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.customer.cart
{
    public partial class orderCompleted : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            
            WARNING!

            Anyone who stumbles into this page will get their order marked as completed!
            That means a user can complete their order without paying a cent if they just edit their URL.

            The top of this page code should have a part where it captures OrderID from PayPal.
            But due to time constraints and the complication of PayPal SDK or API,
            I've decided to just proceed as-is. 

             */

            if (!IsPostBack)
            {
                List<OrderItem> cart = (List<OrderItem>)Session["cart"];
                Customer customer = (Customer)Session["customer"];
                ArtGalleryEntities context = new ArtGalleryEntities();
                Artwork artwork;
                int quantity;
                decimal? total = 0;

                for (int index = 0; index < cart.Count; index++)
                {
                    // Get price.
                    OrderItem orderItem = cart[index];
                    total += orderItem.Quantity * orderItem.PriceEach;

                    // Validate then update artwork stock
                    artwork = context.Artworks.Find(orderItem.Art_ID);
                    quantity = orderItem.Quantity.GetValueOrDefault();

                    if (artwork.Stock < quantity)
                    {
                        //TODO Return error message
                    }
                    else if (artwork.Stock == quantity)
                    {
                        artwork.Stock -= quantity;
                        artwork.Status = "Unavailable";
                    }
                    else
                    {
                        artwork.Stock -= quantity;
                    }
                }

                // Create order and payment record
                Order order = context.Orders.Add(new Order
                {
                    Order_Status = "Paid",
                    Order_Date = DateTime.Now,
                    Cust_ID = customer.Cust_ID,
                    Pay_ID = context.Payments.Add(new Payment
                    {
                        Pay_Date = DateTime.Now,
                        Pay_Amount = total
                    }).Pay_ID
                });

                // For each item points to the order created
                foreach (var item in cart)
                {
                    item.Order_ID = order.Order_ID;
                    context.OrderItems.Add(item);
                }

                // Add to database
                context.SaveChanges();

                // Destroy cart
                Session.Remove("cart");

            }
        }
    }
}