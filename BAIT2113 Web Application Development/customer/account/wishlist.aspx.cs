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

                List<Artwork> artworks = context.Artworks
                    .Join(context.WishLists
                        .Where(c => c.Cust_ID == customer.Cust_ID)
                        .OrderByDescending(wl => wl.W_Date),
                            a => a.Art_ID,
                            wl => wl.Art_ID,
                            (a, wl) => a)
                    .ToList();

                Repeater1.DataSource = artworks;
                Repeater1.DataBind();
            }
        }
    }
}