using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.artist.artwork
{
    public partial class create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnPost_Click(object sender, EventArgs e)
        {
            ArtGalleryEntities context = new ArtGalleryEntities();
            Artwork artwork = new Artwork();
            artwork.Title = artworkTitle.Text;
            artwork.Description = artworkDescription.Text;
            artwork.Date = DateTime.Now;
            artwork.Price = Convert.ToDecimal(artworkPrice.Text);
            artwork.Stock = Convert.ToInt32(artworkStock.Text);
            artwork.Status = artworkStatus.SelectedValue; //TODO validate this shit.
            artwork.Artist_ID = ((Artist)Session["artist"]).Artist_ID;
            using (Stream fs = artworkImage.PostedFile.InputStream) //TODO check if image is uploaded
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    artwork.Image = bytes;
                }
            }
            
            context.Artworks.Add(artwork);
            context.SaveChanges();
        }
    }
}