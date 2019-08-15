using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_Web_Application_Development.artist.order
{
    public partial class view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ArtGalleryEntities context = new ArtGalleryEntities();
                Artist artist = (Artist)Session["artist"];

                List<Artwork> artwork;

                var resultSet = context.OrderItems
                .Join(context.Artworks
                    .Where(a => a.Artist_ID == artist.Artist_ID),
                        oi => oi.Art_ID,
                        a => a.Art_ID,
                        (oi, a) => new
                        {
                            oi.Order_ID,
                            oi.Order.Order_Date,
                            oi.Art_ID,
                            oi.Status,
                            oi.PriceEach,
                            oi.Quantity,
                            Sales = (oi.Quantity * oi.PriceEach)
                        })
                .OrderByDescending(oi => oi.Order_ID)
                .ToList();

                Repeater1.DataSource = resultSet;
                Repeater1.DataBind();

            }
        }
        protected void ToShipped(object sender, EventArgs e)
        {
            Button btnToShipped = (Button)sender;
            Label lblOrder_ID = (Label)btnToShipped.NamingContainer.FindControl("lblOrder_ID");
            Label lblArt_ID = (Label)btnToShipped.NamingContainer.FindControl("lblArt_ID");
            Order order;
            bool orderCompleted = true;

            ArtGalleryEntities context = new ArtGalleryEntities();
            int art_ID = Convert.ToInt32(lblArt_ID.Text);
            int order_ID = Convert.ToInt32(lblOrder_ID.Text);
            order = context.Orders.Find(order_ID);
            foreach (var item in order.OrderItems)
                if (item.Art_ID == art_ID)
                    item.Status = "Shipped";
                else if (item.Status != "Shipped")
                    orderCompleted = false;

            if (orderCompleted)
                order.Order_Status = "Completed";

            context.SaveChanges();
            Response.Redirect(Request.RawUrl);
        }
    }
}