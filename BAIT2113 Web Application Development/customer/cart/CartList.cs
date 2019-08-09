using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BAIT2113_Web_Application_Development.customer.cart
{
    public class CartList
    {
        public int Index { get; set; }
        public int Art_ID { get; set; }
        public string Title { get; set; }
        public string Base64image { get; set; }
        public int? Quantity { get; set; }
        public decimal? PriceEach { get; set; }
        public decimal? Subtotal { get; set; }
    }
}