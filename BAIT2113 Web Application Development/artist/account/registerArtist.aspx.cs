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
	public partial class registerArtist : System.Web.UI.Page
	{
		SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtGalleryConnStr"].ConnectionString);
		protected void Page_Load(object sender, EventArgs e)
		{

			lblAns.Visible = false;
			if (Session["Username"] != null)
			{
				Response.Redirect("Homepage.aspx");
			}
		}

		protected void btnRegister_Click(object sender, EventArgs e)
		{
			string check = "select count(*) from [Artist] where Username = '" + txtUsername.Text + "' ";
			SqlCommand com = new SqlCommand(check, con);
			con.Open();
			int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
			con.Close();
			if (temp == 1)
			{
				lblAns.Visible = true;
				lblAns.Text = "Account with certain details already exists!";
			}
			else
			{
				check = "select count(*) from [Artist] where  email = '" + txtEmail.Text + "' and contactNo = '" + txtContactNo.Text + "' ";
				com = new SqlCommand(check, con);
				con.Open();
				temp = Convert.ToInt32(com.ExecuteScalar().ToString());
				con.Close();
				if (temp == 1)
				{
					lblAns.Text = "Account with certain details already exists!";
				}
				else
				{
					check = "select count(*) from [Artist] where contactNo = '" + txtContactNo.Text + "' ";
					com = new SqlCommand(check, con);
					con.Open();
					temp = Convert.ToInt32(com.ExecuteScalar().ToString());
					con.Close();
					if (temp == 1)
					{
						lblAns.Text = "Account with certain details already exists!";
					}
					else
					{
						string ins = "Insert into [Artist](Username, Email, ContactNo, Password) values('" + txtUsername.Text + "', '" + txtEmail.Text + "', '" + txtContactNo.Text + "', '" + txtPassword.Text + "')";
						com = new SqlCommand(ins, con);
						con.Open();
						com.ExecuteNonQuery();
						con.Close();
						Response.Redirect("loginArtist.aspx?RegisSucc=1");
					}
				}
			}
		}
	}
}