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
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Customer customer = (Customer)Session["customer"];
                HttpCookie cookie = Request.Cookies.Get("customer");
                // Check session if the user is logged in.
                if (customer != null)
                {
                    // User found! Changing label name.
                    dropdownMenuLink.InnerHtml = customer.Username;
                }
                // Session not found, checking cookie.
                else if (cookie != null)
                {
                    using (ArtGalleryEntities context = new ArtGalleryEntities())
                    {
                        customer = context.Customers.Find(Convert.ToInt32(cookie.Value));

                        if (customer != null)
                        {
                            // Artist found! Binding user into session. Then changing label name.
                            Session["customer"] = customer;
                            dropdownMenuLink.InnerHtml = customer.Username;
                        }
                        else
                        {
                            // Unknown credentials, destroying cookie. Redirecting user to login page.
                            cookie.Expires = DateTime.Now.AddDays(-1d);
                            Response.Cookies.Add(cookie);
                            Response.Redirect("~/customer/account/signout.aspx");
                        }
                    }
                }
                else
                {
                    // No session, no cookie. Redirecting user to login page.
                    Response.Redirect("~/customer/account/signout.aspx");
                }
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            List<OrderItem> cart = (List<OrderItem>)Session["cart"];
            if (cart == null || cart.Count == 0)
            {
                // remove badge
            }
            else
            {
                cartCount.Text = cart.Count.ToString();
            }
        }
    }
}