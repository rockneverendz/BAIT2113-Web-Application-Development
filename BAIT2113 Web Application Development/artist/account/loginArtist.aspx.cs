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
            if (!IsPostBack)
            {
                Artist artist = (Artist)Session["artist"];
                HttpCookie cookie = Request.Cookies.Get("artist");
                // Check session if the user is logged in.
                if (artist != null)
                {
                    // User found! Redirecting to main page
                    Response.Redirect("../main.aspx");
                }
                // Session not found, checking cookie
                else if (cookie != null)
                {
                    using (ArtGalleryEntities context = new ArtGalleryEntities())
                    {
                        artist = context.Artists.Find(Convert.ToInt32(cookie.Value));

                        if (artist != null)
                        {
                            // Artist found! Binding user into session. Then redirect to main page
                            Session["artist"] = artist;
                            Response.Redirect("../main.aspx");
                        }
                        else
                        {
                            // Unknown credentials, destroying cookie.
                            cookie.Expires = DateTime.Now.AddDays(-1d);
                            Response.Cookies.Add(cookie);
                        }
                    }
                }
            }
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

                /*-- Validated --*/
                // Add cookie if requested.
                // https://stackoverflow.com/questions/244882/what-is-the-best-way-to-implement-remember-me-for-a-website
                // Follow above if security is a requirement. Below is a zero security makeshift "Remember Me"
                if (inputRemember.Checked)
                {
                    HttpCookie cookie = new HttpCookie("artist")
                    {
                        Value = artist.Artist_ID.ToString(),
                        Expires = DateTime.Now.AddDays(30d)
                    };
                    Response.Cookies.Add(cookie);
                }

                // Bind customer into session.
                Session["artist"] = artist;

                // Redirect customer to main page.
                Response.Redirect("../main.aspx");
            }
        }
    }
}