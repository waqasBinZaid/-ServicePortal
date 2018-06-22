using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ServicePortal.Models;

namespace ServicePortal.DAL
{
    public class OrganizationHandler
    {
        public static void Update(int id, Organization or){

            ServicesPortalApiEntities db = new ServicesPortalApiEntities();
            var data = db.Organizations.Where(m => m.id == id).FirstOrDefault();
            data.OrganizaationName = or.OrganizaationName;
            data.Address = or.Address;
            data.City = or.City;
            data.Province = or.Province;
            data.ZipCode = or.ZipCode;
            data.Country = or.Country;
            data.Call = or.Call;
            data.Lendline = or.Lendline;
            data.Fax = or.Fax;
            data.Email = or.Email;
            data.Url = or.Url;
            db.SaveChanges();


}
    }
}