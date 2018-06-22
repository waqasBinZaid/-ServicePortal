using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServicePortal.Models;

namespace ServicePortal.DAL
{
    public class DropDownHandler
    {
       
        public static List<SelectListItem> Dept(int Id)
        {
            ServicesPortalApiEntities db = new ServicesPortalApiEntities();
            List<SelectListItem> items = new List<SelectListItem>();
            var vlu = db.Departments.Where(m => m.CompanyID == Id).ToList();
            items.Add(new SelectListItem { Text = "Select Department", Value = "" });
            foreach (var itm in vlu)
            {

                items.Add(new SelectListItem { Text = itm.Description, Value = itm.id.ToString() });


            }
            return items;
        }

        public static List<SelectListItem> Designation(int Id)
        {
            ServicesPortalApiEntities db = new ServicesPortalApiEntities();
            List<SelectListItem> items = new List<SelectListItem>();
            var vlu = db.Designations.Where(m => m.CompanyId == Id).ToList();
            items.Add(new SelectListItem { Text = "Select Designation", Value = "" });
            foreach (var itm in vlu)
            {

                items.Add(new SelectListItem { Text = itm.Description, Value = itm.id.ToString() });


            }
            return items;
        }
        public static List<SelectListItem> Category()
        {
            ServicesPortalApiEntities db = new ServicesPortalApiEntities();
            List<SelectListItem> items = new List<SelectListItem>();
            var vlu = db.Categories.ToList();
            items.Add(new SelectListItem { Text = "Select Category  ", Value = "" });
            foreach (var itm in vlu)
            {

                items.Add(new SelectListItem { Text = itm.Catgory, Value =itm.Id.ToString() });


            }
            return items;
        }
        public static List<SelectListItem> brand()
        {
            ServicesPortalApiEntities db = new ServicesPortalApiEntities();
            List<SelectListItem> items = new List<SelectListItem>();
            var vlu = db.Brands.ToList();
            items.Add(new SelectListItem { Text = "Select Brand", Value = "" });
            foreach (var itm in vlu)
            {

                items.Add(new SelectListItem { Text = itm.Brand1, Value = itm.id.ToString() });


            }
            return items;
        }
        public static List<SelectListItem> Model()
        {
            ServicesPortalApiEntities db = new ServicesPortalApiEntities();
            List<SelectListItem> items = new List<SelectListItem>();
            var vlu = db.Models.ToList();
            items.Add(new SelectListItem { Text = "Select Model", Value = "" });
            foreach (var itm in vlu)
            {

                items.Add(new SelectListItem { Text = itm.Models, Value = itm.id.ToString() });


            }
            return items;
        }
        public static List<SelectListItem> Country()
        {
            ServicesPortalApiEntities db = new ServicesPortalApiEntities();
            List<SelectListItem> items = new List<SelectListItem>();
            var vlu = db.Countries.ToList();
            items.Add(new SelectListItem { Text = "Select Country", Value = "" });
            foreach (var itm in vlu)
            {

                items.Add(new SelectListItem { Text = itm.Country1, Value = itm.id.ToString() });


            }
            return items;
        }
        public static List<SelectListItem> Manfacturer()
        {
            ServicesPortalApiEntities db = new ServicesPortalApiEntities();
            List<SelectListItem> items = new List<SelectListItem>();
            var vlu = db.Manufactueres.ToList();
            items.Add(new SelectListItem { Text = "Select Manufactuerer", Value = "" });
            foreach (var itm in vlu)
            {

                items.Add(new SelectListItem { Text = itm.Manufactuere1, Value = itm.id.ToString() });


            }
            return items;
        }
        public static List<SelectListItem> Item()
        {
            ServicesPortalApiEntities db = new ServicesPortalApiEntities();
            List<SelectListItem> items = new List<SelectListItem>();
            var vlu = db.inventryItems.ToList();
            items.Add(new SelectListItem { Text = "Select items", Value = "" });
            foreach (var itm in vlu)
            {

                items.Add(new SelectListItem { Text = itm.SubCategory.Category.Catgory+" | "+itm.SubCategory.SubCat+" | "+itm.Model.Models, Value = itm.id.ToString() });


            }
            return items;
        }

        public static List<SelectListItem> ItemAttribute()
        {
            ServicesPortalApiEntities db = new ServicesPortalApiEntities();
            List<SelectListItem> itemstype = new List<SelectListItem>();
            var vlu = db.ItemAttributeTypes.ToList();
            itemstype.Add(new SelectListItem { Text = "Select Attribute", Value = "" });
            foreach (var itm in vlu)
            {
                itemstype.Add(new SelectListItem { Text = itm.ItemAttribute, Value = itm.Id.ToString() });
            }
            return itemstype;
        }

    }
}