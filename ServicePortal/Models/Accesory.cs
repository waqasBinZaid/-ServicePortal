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
    
    public partial class Accesory
    {
        public int Id { get; set; }
        public int CatID { get; set; }
        public int SubCatID { get; set; }
        public int ModelID { get; set; }
        public string Description { get; set; }
        public int AccessoryID { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual inventryItem inventryItem { get; set; }
        public virtual Model Model { get; set; }
        public virtual SubCategory SubCategory { get; set; }
    }
}
