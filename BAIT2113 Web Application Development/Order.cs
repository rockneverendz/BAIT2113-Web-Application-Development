//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BAIT2113_Web_Application_Development
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            this.OrderItems = new HashSet<OrderItem>();
        }
    
        public int Order_ID { get; set; }
        public string Order_Status { get; set; }
        public Nullable<System.DateTime> Order_Date { get; set; }
        public Nullable<int> Cust_ID { get; set; }
        public Nullable<int> Pay_ID { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Payment Payment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }
}
