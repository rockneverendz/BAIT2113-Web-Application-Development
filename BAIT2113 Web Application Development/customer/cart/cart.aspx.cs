using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.customer.cart
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<OrderItem> cart = (List<OrderItem>)Session["cart"];
                DataList1.DataSource = cart;
                DataList1.DataBind();
            }
        }

        protected void removeItem(object sender, EventArgs e)
        {
            List<OrderItem> cart = (List<OrderItem>)Session["cart"];
            cart.RemoveAt(Convert.ToInt32(((Button)sender).CommandArgument));
            // Refresh..?
        }

        protected void orderQuantity_TextChanged(object sender, EventArgs e)
        {
            TextBox orderQuantity = (TextBox)sender;
            int orderIndex = Convert.ToInt32(((Label)orderQuantity.Parent.FindControl("orderIndex")).Text);
            List<OrderItem> cart = (List<OrderItem>)Session["cart"];
            OrderItem orderItem = cart.ElementAt(orderIndex - 1);
            orderItem.Quantity = Convert.ToInt32(orderQuantity.Text);
        }
    }
}