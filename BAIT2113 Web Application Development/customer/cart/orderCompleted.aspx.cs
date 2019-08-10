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
                ArtGalleryEntities context = new ArtGalleryEntities();
                Artwork artwork;
                decimal? total = 0;

                for (int index = 0; index < cart.Count; index++)
                {
                    OrderItem orderItem = cart[index];
                    total += orderItem.Quantity * orderItem.PriceEach;

                    artwork = context.Artworks.Find(orderItem.Art_ID);
                    artwork.Stock -= orderItem.Quantity.GetValueOrDefault();

                }

            }


        }
    }
}