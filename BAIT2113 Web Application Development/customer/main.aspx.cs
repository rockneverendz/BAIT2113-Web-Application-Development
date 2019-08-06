using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.customer
{
    public partial class main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (DateTime.Now.Hour < 12)
                    jumbotronHeader.Text = "Good morning, " + ((Customer)Session["customer"]).Username + '.';
                else
                    jumbotronHeader.Text = "Good afternoon, " + ((Customer)Session["customer"]).Username + '.';
            }
        }

        protected void addToWishlist(object sender, EventArgs e)
        {
            ArtGalleryEntities context = new ArtGalleryEntities();
            Customer customer = (Customer)Session["customer"];
            int Cust_ID = customer.Cust_ID;
            int Art_ID = Convert.ToInt32(((ImageButton)sender).CommandArgument);

            bool exists = context.WishLists.Where(
                wl => wl.Cust_ID == Cust_ID
                && wl.Art_ID == Art_ID)
                .Any();

            if (!exists)
            {
                WishList wishList = new WishList
                {
                    Cust_ID = Cust_ID,
                    Art_ID = Art_ID,
                    W_Date = DateTime.Now
                };
                context.WishLists.Add(wishList);
                context.SaveChanges();
            }
            else
            {
                //TODO return error "Item laready wishlisted!"
            }
        }

        protected void addToCart(object sender, EventArgs e)
        {
            ArtGalleryEntities context = new ArtGalleryEntities();
            List<OrderItem> cart = (List<OrderItem>)Session["cart"];
            int Art_ID = Convert.ToInt32(((ImageButton)sender).CommandArgument);
            bool exists = false;
            Artwork artwork = context.Artworks.Find(Art_ID);

            if (cart == null)
            {
                cart = new List<OrderItem>();
                OrderItem orderItem = new OrderItem
                {
                    Art_ID = artwork.Art_ID,
                    Quantity = 1,
                    PriceEach = artwork.Price
                };
                cart.Add(orderItem);
                Session["cart"] = cart;
            }
            else
            {
                // Check if the item already exists.
                foreach (OrderItem orderItem in cart)
                    if (orderItem.Art_ID == Art_ID)
                        exists = true;

                if (!exists)
                {
                    OrderItem orderItem = new OrderItem
                    {
                        Art_ID = artwork.Art_ID,
                        Quantity = 1,
                        PriceEach = artwork.Price
                    };
                    cart.Add(orderItem);
                    Session["cart"] = cart;
                }
                else
                {
                    //TODO return error "Item laready existed in cart!"
                }
            }
        }
    }
}