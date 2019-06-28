using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.artist.account
{
	public partial class Homepage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["Username"] != null)
			{
				txtGreetings.Text = Session["Username"].ToString();
				btnLogout.Enabled = true;
				btnLogout.Visible = true;
			}
			else
			{
				btnLogin.Enabled = true;
				btnLogin.Visible = true;
			}
		}

		protected void btnLogout_Click(object sender, EventArgs e)
		{
			Session.RemoveAll();
			Response.Redirect("loginArtist.aspx");
		}

		protected void btnLogin_Click(object sender, EventArgs e)
		{
			Response.Redirect("loginArtist.aspx");
		}
	}
}