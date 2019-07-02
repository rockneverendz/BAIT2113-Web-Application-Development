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
		SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtGalleryConnStr"].ConnectionString);
		protected void Page_Load(object sender, EventArgs e)
		{
			string getStatus = Request.QueryString["Status"];

			lblAns.Visible = false;



			if (getStatus == "1")
			{
				lblAns.CssClass = "alert alert-success small";
				lblAns.Text = "Your account has successfully created, please login again.";
				lblAns.Visible = true;
			} else if(getStatus == "Logout"){
				Session.RemoveAll();
				Response.Redirect("loginArtist.aspx");
			}

			if (Session["Username"] != null)
			{
				Response.Redirect("Homepage.aspx");
			}

			

		}

		protected void btnLogin_Click(object sender, EventArgs e)
		{
			string check = "select count(*) from [Artist] where Username = '" + txtUsername.Text + "' and password = '" + txtPassword.Text + "' ";
			SqlCommand com = new SqlCommand(check, con);
			con.Open();
			int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
			con.Close();
			if (temp == 1)
			{
				Session["Username"] = txtUsername.Text;
				Response.Redirect("Homepage.aspx");
			}
			else
			{
				lblAns.CssClass = "alert alert-danger";
				lblAns.Text = "Your username or password is invalid.";
				lblAns.Visible = true;
			}
		}
	}
}