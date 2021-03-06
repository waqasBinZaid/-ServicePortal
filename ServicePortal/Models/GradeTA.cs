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
    
    public partial class GradeTA
    {
        public int id { get; set; }
        public Nullable<int> CompanyID { get; set; }
        public Nullable<int> GradeID { get; set; }
        public string TAType { get; set; }
        public string Description { get; set; }
        public Nullable<double> TARate { get; set; }
        public Nullable<System.DateTime> CreatedDtae { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public byte[] ModifiedBy { get; set; }
        public Nullable<bool> Status { get; set; }
    
        public virtual Company Company { get; set; }
        public virtual Grade Grade { get; set; }
    }
}
