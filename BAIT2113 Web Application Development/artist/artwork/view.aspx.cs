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

                List<Artwork> artwork = context.Artworks
                    .Where(a => a.Artist_ID == artist.Artist_ID)
                    .Where(a => a.Status != "Deleted")
                    .OrderByDescending(a => a.Art_ID)
                    .ToList();

                Repeater1.DataSource = artwork;
                Repeater1.DataBind();

                String status = Request.QueryString.Get("status");
                if (status != null)
                {
                    lblServerResponse.Visible = true;
                    switch (status)
                    {
                        case "P":
                            lblServerResponse.Text = "Successfully posted artwork.";
                            lblServerResponse.CssClass += " alert-success";
                            break;
                        case "U":
                            lblServerResponse.Text = "Successfully updated artwork.";
                            lblServerResponse.CssClass += " alert-success";
                            break;
                        case "R":
                            lblServerResponse.Text = "Successfully removed artwork.";
                            lblServerResponse.CssClass += " alert-success";
                            break;
                        case "N":
                            lblServerResponse.Text = "Artwork not found.";
                            lblServerResponse.CssClass += " alert-danger";
                            break;
                        default:
                            lblServerResponse.Text = "Unknown error occured.";
                            lblServerResponse.CssClass += " alert-danger";
                            break;
                    }
                }
            }
        }
    }
}