using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.customer
{
    public partial class customer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Customer customer = (Customer)Session["customer"];
            if (customer != null)
            {
                dropdownMenuLink.InnerHtml = customer.Username;
            }
            else
            {
                // TODO Redirect user
                dropdownMenuLink.InnerHtml = "ERROR";
            }


        }
    }
}