using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.customer.account
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            using (ArtGalleryEntities context = new ArtGalleryEntities())
            {
                // Check if the username is available
                if (context.Customers.Where(c =>
                c.Username == inputUsername.Text).Any())
                {
                    sysResponse.Text = "Username already exists.";
                    sysResponseBox.Visible = true;
                    return;
                }

                // Check if the email is available
                if (context.Customers.Where(c =>
                c.Email == inputEmail.Text).Any())
                {
                    sysResponse.Text = "Email is already registered.";
                    sysResponseBox.Visible = true;
                    return;
                }

                // Check if the password is the same
                if (inputPassword.Text != inputConfirmPass.Text)
                {
                    sysResponse.Text = "Password does not match.";
                    sysResponseBox.Visible = true;
                    return;
                }

                Customer customer = new Customer();
                customer.Username = inputUsername.Text;
                customer.Email = inputEmail.Text;
                customer.Password = inputPassword.Text;

                context.Customers.Add(customer);
                context.SaveChanges();

                // Retrive from database to get genuine object
                customer = context.Customers.Where(c =>
                c.Username == customer.Username).FirstOrDefault();

                // Validated, bind customer into session.
                Session["customer"] = customer;

                // Redirect customer to main page.
                Response.RedirectPermanent("../main.aspx");
            }
        }
    }
}