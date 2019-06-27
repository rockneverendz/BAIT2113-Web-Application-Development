using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BAIT2113_Web_Application_Development
{
	public partial class DisplayImage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string constr = ConfigurationManager.ConnectionStrings["UploadImage"].ConnectionString;
			using (SqlConnection con = new SqlConnection(constr))
			{

				string query = "SELECT Image FROM Artwork WHERE Art_ID = @ArtID";
				using (SqlCommand cmd = new SqlCommand(query))
				{
					cmd.Connection = con;
					cmd.Parameters.AddWithValue("@ArtID", Request.QueryString["ArtID"]);
					con.Open();
					byte[] bytes = (byte[])cmd.ExecuteScalar();
					string strBase64 = Convert.ToBase64String(bytes);
					Image1.ImageUrl = "data:Image/png;base64," + strBase64;


					con.Close();
				}

			}
		}
	}
}