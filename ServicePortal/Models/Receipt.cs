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
    
    public partial class Receipt
    {
        public int Id { get; set; }
        public int BranchID { get; set; }
        public int ItemID { get; set; }
        public double ReceiptQuantity { get; set; }
        public double ReceiptPrice { get; set; }
        public int SuplierID { get; set; }
        public string ReceivedBy { get; set; }
        public System.DateTime ReceivedOn { get; set; }
        public string ReceiptDocument { get; set; }
        public string ReceiptRemarks { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreateOn { get; set; }
        public string ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    
        public virtual Branch Branch { get; set; }
        public virtual inventryItem inventryItem { get; set; }
        public virtual Supplier Supplier { get; set; }
    }
}
