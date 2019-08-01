using System;
using System.Collections.Generic;
using System.IO;
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
            if (!IsPostBack)
            {
                ArtGalleryEntities context = new ArtGalleryEntities();
                Artist artist = (Artist)Session["artist"];
                Artwork artwork;

                int artwork_id = Convert.ToInt32(Request.QueryString.Get("id"));
                artwork = context.Artworks.Find(artwork_id);

                // Check if the artwork exists.
                if (artwork == null)
                {
                    // Artwork not found, returning to view.aspx with error.
                    Response.Redirect("~/artist/artwork/view.aspx?status=N");
                    return;
                }

                // Check if the owner of the artwork is the artist.
                if (artwork.Artist_ID != artist.Artist_ID)
                {
                    // Invaild credentials, an attack?
                    Response.Redirect("~/artist/account/logoutArtist.aspx");
                    return;
                }

                artworkTitle.Text = artwork.Title;
                artworkDescription.Text = artwork.Description;
                artworkPrice.Text = String.Format("{0:0.00}", artwork.Price);
                artworkStock.Text = artwork.Stock.ToString();
                artworkStatus.SelectedValue = artwork.Status;
                artworkPreview.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String(artwork.Image);
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (ValidateForm(out decimal price, out int stock) == false)
            {
                lblServerResponse.Visible = true;
                lblServerResponse.Text = "Update failed, please check again.";
                lblServerResponse.CssClass += " alert-danger";
                return;
            }

            ArtGalleryEntities context = new ArtGalleryEntities();
            Artwork artwork;

            int artwork_id = Convert.ToInt32(Request.QueryString.Get("id"));
            artwork = context.Artworks.Find(artwork_id);

            artwork.Title = artworkTitle.Text;
            artwork.Description = artworkDescription.Text;
            artwork.Price = Convert.ToDecimal(artworkPrice.Text);
            artwork.Stock = Convert.ToInt32(artworkStock.Text);
            artwork.Status = artworkStatus.SelectedValue; //TODO validate this shit.

            // Check if user wants to update image
            if (artworkImage.HasFile)
            {
                // Check if the image is type ".png"
                if (System.IO.Path.GetExtension(artworkImage.FileName) == ".png")
                {
                    using (Stream fs = artworkImage.PostedFile.InputStream)
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        artwork.Image = bytes;
                    }
                }
                else
                {
                    lblArtworkImage.Visible = true;
                    lblArtworkImage.Text = "File type not supported!";
                    return;
                }
            }

            context.SaveChanges();
            Response.Redirect("~/artist/artwork/view.aspx?status=U");
        }

        protected void BtnRemove_Click(object sender, EventArgs e)
        {
            ArtGalleryEntities context = new ArtGalleryEntities();
            Artwork artwork;

            int artwork_id = Convert.ToInt32(Request.QueryString.Get("id"));
            artwork = context.Artworks.Find(artwork_id);

            artwork.Status = "Deleted";

            context.SaveChanges();
            Response.Redirect("~/artist/artwork/view.aspx?status=R");
        }

        private bool ValidateForm(out decimal price, out int stock)
        {
            string is_invalid = "form-control is-invalid";
            string is_valid = "form-control is-valid";
            bool validity = true;

            // Check if title exists and vaild for database
            if (artworkTitle.Text == null || artworkTitle.Text.Length == 0)
            {
                artworkTitle.CssClass = is_invalid;
                lblArtworkTitle.Visible = true;
                lblArtworkTitle.Text = "A title is required.";
                validity = false;
            }
            // Check if title valid for database
            else if (artworkTitle.Text.Length > 50)
            {
                artworkTitle.CssClass = is_invalid;
                lblArtworkTitle.Visible = true;
                lblArtworkTitle.Text = "Title must have less than 50 characters.";
                validity = false;
            }
            // Then title is valid.
            else
            {
                artworkTitle.CssClass = is_valid;
                lblArtworkTitle.Visible = false;
            }

            // Check if description valid for database
            if (artworkDescription.Text.Length > 100)
            {
                artworkDescription.CssClass = is_invalid;
                lblArtworkDescription.Visible = true;
                lblArtworkDescription.Text = "Title must have less than 100 characters.";
                validity = false;
            }
            // Then description is valid.
            else
            {
                artworkDescription.CssClass = is_valid;
                lblArtworkDescription.Visible = false;
            }

            // Check if it's a vaild price
            if (decimal.TryParse(artworkPrice.Text, out price) == false)
            {
                artworkPrice.CssClass = is_invalid;
                lblArtworkPrice.Visible = true;
                lblArtworkPrice.Text = "Please enter a valid price!";
                validity = false;
            }
            // Then price is valid.
            else
            {
                artworkPrice.CssClass = is_valid;
                lblArtworkPrice.Visible = false;
            }

            // Check if it's a vaild stock
            if (int.TryParse(artworkStock.Text, out stock) == false)
            {
                artworkStock.CssClass = is_invalid;
                lblArtworkStock.Visible = true;
                lblArtworkStock.Text = "Please enter a valid stock!";
                validity = false;
            }
            // Then stock is valid.
            else
            {
                artworkStock.CssClass = is_valid;
                lblArtworkStock.Visible = false;
            }

            // Check if the image is type ".png"
            if (artworkImage.HasFile == true && System.IO.Path.GetExtension(artworkImage.FileName) != ".png")
            {
                lblArtworkImageFileName.CssClass = "lblArtworkImageFileName custom-file-label d-block " + is_invalid;
                lblArtworkImage.Visible = true;
                lblArtworkImage.Text = "File type not supported!";
                validity = false;
            }
            // Then image is valid.
            else
            {
                // Cannot use 'is-valid' as image will be removed after postback
                lblArtworkImageFileName.CssClass = "lblArtworkImageFileName custom-file-label d-block";
                lblArtworkImage.Visible = false;
            }

            return validity;
        }
    }
}