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
    
    public partial class Designation
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Designation()
        {
            this.Users = new HashSet<User>();
        }
    
        public int id { get; set; }
        public Nullable<int> CompanyId { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> CreadtedDate { get; set; }
        public string CreadtedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public byte[] ModifiedBy { get; set; }
        public Nullable<bool> Status { get; set; }
    
        public virtual Company Company { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<User> Users { get; set; }
    }
}
