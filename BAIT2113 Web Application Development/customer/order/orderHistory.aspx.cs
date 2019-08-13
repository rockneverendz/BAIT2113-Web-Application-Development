using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.customer.order
{
    public partial class orderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ArtGalleryEntities context = new ArtGalleryEntities();
                Customer customer = (Customer)Session["customer"];

                List<Order> orders = context.Orders
                    .Where(c => c.Cust_ID == customer.Cust_ID)
                    .OrderByDescending(o => o.Order_ID)
                    .ToList();

                Repeater1.DataSource = orders;
                Repeater1.DataBind();
            }
        }
    }
}