using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.artist.artwork
{
    public partial class view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ArtGalleryEntities context = new ArtGalleryEntities();
                Artist artist = (Artist)Session["artist"];

                List<Artwork> artwork = context.Artworks.Where(a =>
                a.Artist_ID == artist.Artist_ID
                ).OrderByDescending(a => a.Art_ID).ToList();

                Repeater1.DataSource = artwork;
                Repeater1.DataBind();
            }
        }
    }
}