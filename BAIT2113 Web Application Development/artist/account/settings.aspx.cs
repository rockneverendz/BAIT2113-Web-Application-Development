using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.artist.account
{
    public partial class settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Artist artist = (Artist)Session["artist"];
                inputEmail.Text = artist.Email;
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            using (ArtGalleryEntities context = new ArtGalleryEntities())
            {
                Artist artist = (Artist)Session["artist"];
                string email = inputEmail.Text;
                string password = inputPassword.Text;
                string retypePassword = inputRetypePassword.Text;
                string oldPassword = inputOldPassword.Text;


                if (oldPassword == artist.Password)
                {
                    if (password == null)
                    {
                        artist.Email = email;

                        context.SaveChanges();

                        lblServerResponse.Visible = true;
                        lblServerResponse.CssClass = "d-block alert alert-success";
                        lblServerResponse.Text = "Successfully Updated";

                    }
                    else if (password == retypePassword)
                    {
                        artist.Email = email;
                        artist.Password = password;

                        context.SaveChanges();

                        lblServerResponse.Visible = true;
                        lblServerResponse.CssClass = "d-block alert alert-success";
                        lblServerResponse.Text = "Successfully Updated";

                    }
                    else
                    {
                        inputEmail.Text = artist.Email;
                        lblServerResponse.Visible = true;
                        lblServerResponse.CssClass = "d-block alert alert-danger";
                        lblServerResponse.Text = "Error";
                    }
                }
                else
                {
                    inputEmail.Text = artist.Email;
                    lblServerResponse.Visible = true;
                    lblServerResponse.CssClass = "d-block alert alert-danger";
                    lblServerResponse.Text = "Error";
                }

            }
        }
    }
}