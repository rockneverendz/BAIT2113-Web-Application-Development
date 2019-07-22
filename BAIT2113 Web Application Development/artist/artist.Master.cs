using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.artist
{
    public partial class artist : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Artist artist = (Artist)Session["artist"];
                HttpCookie cookie = Request.Cookies.Get("artist");
                // Check session if the user is logged in.
                if (artist != null)
                {
                    // User found! Changing label name.
                    lblAccount.Text = artist.Username;
                }
                // Session not found, checking cookie.
                else if (cookie != null)
                {
                    using (ArtGalleryEntities context = new ArtGalleryEntities())
                    {
                        artist = context.Artists.Find(Convert.ToInt32(cookie.Value));

                        if (artist != null)
                        {
                            // Artist found! Binding user into session. Then changing label name.
                            Session["artist"] = artist;
                            lblAccount.Text = artist.Username;
                        }
                        else
                        {
                            // Unknown credentials, destroying cookie. Redirecting user to login page.
                            cookie.Expires = DateTime.Now.AddDays(-1d);
                            Response.Cookies.Add(cookie);
                            Response.Redirect("~/artist/account/loginArtist.aspx");
                        }
                    }
                }
                else
                {
                    // No session, no cookie. Redirecting user to login page.
                    Response.Redirect("~/artist/account/loginArtist.aspx");
                }
            }
        }
    }
}