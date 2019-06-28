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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSignIn_Click(object sender, EventArgs e)
        {
            using (ArtGalleryEntities context = new ArtGalleryEntities())
            {
                Customer customer = context.Customers.Where(
                                c => c.Username == inputUsername.Text
                                ).FirstOrDefault();
                if (customer == null)
                {
                    sysResponse.Text = "User not found.";
                    sysResponseBox.Visible = true;
                    return;
                }
                if (customer.Password != inputPassword.Text)
                {
                    sysResponse.Text = "Incorrect password.";
                    sysResponseBox.Visible = true;
                    return;
                }
                
                // Validated, bind customer into session.
                Session["customer"] = customer;

                // Redirect customer to main page.
                Response.RedirectPermanent("../main.aspx");
            }
        }
    }
}