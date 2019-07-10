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
                List<DisplayCart> displayCarts = new List<DisplayCart>();
                DisplayCart displayCart;
                int index = 1;

                if (cart == null)
                {
                    //TODO return error "your cart is empty!"
                }
                else
                {
                    using (ArtGalleryEntities context = new ArtGalleryEntities())
                    {
                        foreach (OrderItem orderItem in cart)
                        {
                            displayCart = new DisplayCart
                            {
                                Index = index,
                                Image = context.Artworks.Find(orderItem.Art_ID).Image,
                                Quantity = orderItem.Quantity,
                                PriceEach = orderItem.PriceEach,
                                Subtotal = orderItem.Quantity * orderItem.PriceEach
                            };
                            displayCarts.Add(displayCart);
                            index++;
                        }
                    }

                    DataList1.DataSource = displayCarts;
                    DataList1.DataBind();
                }
            }
        }

        protected void removeItem(object sender, EventArgs e)
        {

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

    struct DisplayCart
    {
        public int Index { get; set; }
        public byte[] Image { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<decimal> PriceEach { get; set; }
        public Nullable<decimal> Subtotal { get; set; }
    }
}