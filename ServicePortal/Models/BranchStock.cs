//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ServicePortal.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class BranchStock
    {
        public int Id { get; set; }
        public Nullable<int> ItemID { get; set; }
        public Nullable<int> BranchID { get; set; }
        public Nullable<int> Quantity { get; set; }
        public string CreatedBy { get; set; }
    
        public virtual Branch Branch { get; set; }
        public virtual inventryItem inventryItem { get; set; }
    }
}
