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
    
    public partial class ItemAttributeType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ItemAttributeType()
        {
            this.ItemAttributes = new HashSet<ItemAttribute>();
            this.ItemsCatSubCats = new HashSet<ItemsCatSubCat>();
        }
    
        public int Id { get; set; }
        public string ItemAttribute { get; set; }
        public Nullable<bool> ActiveAttribute { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string ModifyBy { get; set; }
        public Nullable<System.DateTime> ModifyOn { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ItemAttribute> ItemAttributes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ItemsCatSubCat> ItemsCatSubCats { get; set; }
    }
}
