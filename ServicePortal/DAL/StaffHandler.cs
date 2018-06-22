using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ServicePortal.Models;

namespace ServicePortal.DAL
{
    
    public class StaffHandler
    {
       
        public static void Update(int id , User us)
        {
            ServicesPortalApiEntities db = new ServicesPortalApiEntities();


            var data = db.Users.Where(m => m.id == id).FirstOrDefault();
            data.Status = false;
            db.SaveChanges();
            
        }


    }
}