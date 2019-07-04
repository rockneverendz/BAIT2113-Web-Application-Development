using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace BAIT2113_Web_Application_Development.artist.account
{
    public partial class loginArtist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            using (ArtGalleryEntities context = new ArtGalleryEntities())
            {
                Artist artist = context.Artists.Where(
                    a => a.Username == inputUsername.Text
                    ).FirstOrDefault();
                if (artist == null)
                {
                    sysResponse.Text = "User not found.";
                    sysResponseBox.Visible = true;
                    return;
                }
                if (artist.Password != inputPassword.Text)
                {
                    sysResponse.Text = "Incorrect password.";
                    sysResponseBox.Visible = true;
                    return;
                }

                // Validated, bind customer into session.
                Session["artist"] = artist;

                // Redirect customer to main page.
                Response.RedirectPermanent("../main.aspx");
            }
        }
    }
}