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
            GridView1.DataSource = context.Artists.ToList();
            GridView1.DataBind();

            Repeater1.DataSource = context.Artworks.ToList();
            Repeater1.DataBind();
        }
    }
}