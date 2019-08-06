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
            if (!IsPostBack)
            {
                Customer customer = (Customer)Session["customer"];
                HttpCookie cookie = Request.Cookies.Get("customer");
                // Check session if the user is logged in.
                if (customer != null)
                {
                    // User found! Redirecting to main page
                    Response.Redirect("../main.aspx");
                }
                // Session not found, checking cookie
                else if (cookie != null)
                {
                    using (ArtGalleryEntities context = new ArtGalleryEntities())
                    {
                        customer = context.Customers.Find(Convert.ToInt32(cookie.Value));

                        if (customer != null)
                        {
                            // Artist found! Binding user into session. Then redirect to main page
                            Session["customer"] = customer;
                            Response.Redirect("../main.aspx");
                        }
                        else
                        {
                            // Unknown credentials, destroying cookie.
                            cookie.Expires = DateTime.Now.AddDays(-1d);
                            Response.Cookies.Add(cookie);
                        }
                    }
                }
            }
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

                /*-- Validated --*/
                // Add cookie if requested.
                // https://stackoverflow.com/questions/244882/what-is-the-best-way-to-implement-remember-me-for-a-website
                // Follow above if security is a requirement. Below is a zero security makeshift "Remember Me"
                if (inputRemember.Checked)
                {
                    HttpCookie cookie = new HttpCookie("customer")
                    {
                        Value = customer.Cust_ID.ToString(),
                        Expires = DateTime.Now.AddDays(30d)
                    };
                    Response.Cookies.Add(cookie);
                }

                // Bind customer into session.
                Session["customer"] = customer;

                // Redirect customer to main page.
                Response.Redirect("../main.aspx");
            }
        }
    }
}