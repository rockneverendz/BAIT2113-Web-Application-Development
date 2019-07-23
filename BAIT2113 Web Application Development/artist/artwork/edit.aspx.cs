using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.artist.artwork
{
    public partial class edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // TODO also check if the artwork is the user's.

            if (!IsPostBack)
            {
                ArtGalleryEntities context = new ArtGalleryEntities();
                Artist artist = (Artist)Session["artist"];
                Artwork artwork;

                int artwork_id = Convert.ToInt32(Request.QueryString.Get("id"));
                artwork = context.Artworks.Find(artwork_id);

                // Check if the owner of the artwork is the artist.
                if (artwork.Artist_ID != artist.Artist_ID)
                {
                    // Invaild credentials, an attack?
                    Response.Redirect("~/artist/account/logoutArtist.aspx");
                }

                artworkTitle.Text = artwork.Title;
                artworkDescription.Text = artwork.Description;
                artworkPrice.Text = String.Format("{0:0.00}", artwork.Price);
                artworkStock.Text = artwork.Stock.ToString();
                artworkStatus.SelectedValue = artwork.Status;
                artworkPreview.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String(artwork.Image);
            }
        }

        protected void BtnUpate_Click(object sender, EventArgs e)
        {

        }
    }
}