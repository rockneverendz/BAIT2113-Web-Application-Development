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
            ArtGalleryEntities context = new ArtGalleryEntities();
            //DataList1.DataSource = context.Artworks.ToList();
            //DataList1.DataBind();
        }

        protected void addToWishlist(object sender, EventArgs e)
        {
            ArtGalleryEntities context = new ArtGalleryEntities();
            Customer customer = (Customer)Session["customer"];
            int Cust_ID = customer.Cust_ID;
            int Art_ID = Convert.ToInt32(((Button)sender).CommandArgument);

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
                //TODO return error message here.
            }
        }

        protected void addToCart(object sender, EventArgs e)
        {

        }
    }
}