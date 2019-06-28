using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.customer.account
{
    public partial class signin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["ArtGalleryConnStr"].ConnectionString
            );
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}