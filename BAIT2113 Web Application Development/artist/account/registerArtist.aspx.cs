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
		protected void Page_Load(object sender, EventArgs e)
		{
            if (Session["artist"] != null)
			{
				Response.RedirectPermanent("../main.aspx");
			}
		}

		protected void BtnRegister_Click(object sender, EventArgs e)
		{

            using (ArtGalleryEntities context = new ArtGalleryEntities())
            {
                // Check if the username is available
                if (context.Artists.Where(a =>
                a.Username == inputUsername.Text).Any())
                {
                    sysResponse.Text = "Username already exists.";
                    sysResponseBox.Visible = true;
                    return;
                }

                // Check if the email is available
                if (context.Artists.Where(a =>
                a.Email == inputEmail.Text).Any())
                {
                    sysResponse.Text = "Email is already registered.";
                    sysResponseBox.Visible = true;
                    return;
                }

                // Check if the contact no is available
                if (context.Artists.Where(a =>
                a.ContactNo == inputContactNo.Text).Any())
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

				Artist artist = new Artist
				{
					Username = inputUsername.Text,
					Email = inputEmail.Text,
					ContactNo = inputContactNo.Text,
                    Password = inputPassword.Text
                };

                context.Artists.Add(artist);
                context.SaveChanges();

                // Retrive from database to get genuine object
                artist = context.Artists.Where(a =>
                a.Username == artist.Username).FirstOrDefault();

                // Validated, bind customer into session.
                Session["artist"] = artist;

                // Redirect customer to main page.
                Response.RedirectPermanent("../main.aspx");
            }
		}
	}
}