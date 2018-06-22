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
    
    public partial class PackageIssue
    {
        public int Id { get; set; }
        public int BranchID { get; set; }
        public int WeighBridgeID { get; set; }
        public double IssuedQuantity { get; set; }
        public double IssuePrice { get; set; }
        public int CustomerID { get; set; }
        public Nullable<int> ProjectID { get; set; }
        public int IssuedBranchID { get; set; }
        public string IssuedBy { get; set; }
        public System.DateTime IssuedOn { get; set; }
        public string IssuedDocument { get; set; }
        public string IssuedRemarks { get; set; }
        public string ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    
        public virtual Branch Branch { get; set; }
        public virtual Branch Branch1 { get; set; }
        public virtual Cutomer Cutomer { get; set; }
        public virtual WeighBridge WeighBridge { get; set; }
    }
}
