using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace BAIT2113_Web_Application_Development
{
	public partial class Testing : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				lblMessage.Visible = false;
				
			}
		}

		protected void BtnUpload_Click(object sender, EventArgs e)
		{
			
			using (Stream fs = FileUpload1.PostedFile.InputStream)
			{
				using (BinaryReader br = new BinaryReader(fs))
				{
					byte[] bytes = br.ReadBytes((Int32)fs.Length);
					string constr = ConfigurationManager.ConnectionStrings["UploadImage"].ConnectionString;
					using (SqlConnection con = new SqlConnection(constr))
					{
						string query = "UPDATE Artwork SET Image = @Data WHERE Art_ID = 1001";
						using (SqlCommand cmd = new SqlCommand(query))
						{
							cmd.Connection = con;
							cmd.Parameters.AddWithValue("@Data", bytes);
							con.Open();
							cmd.ExecuteNonQuery();
							con.Close();
						}
					}
				}
			}
			Response.Redirect(Request.Url.AbsoluteUri);

		}

	}
}