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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                txtGreetings.Text = "Welcome ! " + Session["Username"].ToString();

            }
            Artist artist = (Artist)Session["artist"];
            if (artist != null)
            {
                lblAccount.Text = artist.Username;
            }
            else
            {
                // TODO Redirect user
                lblAccount.Text = "ERROR";
            }
        }
    }
}