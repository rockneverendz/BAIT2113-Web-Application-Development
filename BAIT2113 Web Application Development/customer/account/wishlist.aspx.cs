using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.customer.account
{
    public partial class wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ArtGalleryEntities context = new ArtGalleryEntities();
                Customer customer = (Customer)Session["customer"];

                // Find artworks, where it's from the logged in user, sort by newest.
                // Then create a new set object containing all the required data 

                var resultSet = context.Artworks
                    .Join(context.WishLists
                        .Where(c => c.Cust_ID == customer.Cust_ID)
                        .OrderByDescending(wl => wl.W_Date),
                            a => a.Art_ID,
                            wl => wl.Art_ID,
                            (a, wl) => new
                            {
                                a.Title,
                                a.Artist.Username,
                                a.Date,
                                a.Status,
                                a.Description,
                                a.Price,
                                a.Art_ID,
                                a.Image,
                                wl.W_Date
                            })
                    .ToList();

                Repeater1.DataSource = resultSet;
                Repeater1.DataBind();
            }
        }

        protected void removeFromWishlist(object sender, EventArgs e)
        {
            ArtGalleryEntities context = new ArtGalleryEntities();
            Customer customer = (Customer)Session["customer"];
            int Cust_ID = customer.Cust_ID;
            int Art_ID = Convert.ToInt32(((ImageButton)sender).CommandArgument);

            WishList wishList = context.WishLists
                .Where(
                    wl => wl.Cust_ID == Cust_ID 
                    && wl.Art_ID == Art_ID
                    )
                .FirstOrDefault();

            if (wishList != null)
            {
                context.WishLists.Remove(wishList);
                context.SaveChanges();
            }
            else
            {
                //TODO return error "Item doesn't exist in your wishlist!"
            }

            Response.Redirect(Request.RawUrl);
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