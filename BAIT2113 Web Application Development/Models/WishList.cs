//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BAIT2113_Web_Application_Development.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class WishList
    {
        public int Art_ID { get; set; }
        public int Cust_ID { get; set; }
        public Nullable<System.DateTime> W_Date { get; set; }
    
        public virtual Artwork Artwork { get; set; }
        public virtual Customer Customer { get; set; }
    }
}
