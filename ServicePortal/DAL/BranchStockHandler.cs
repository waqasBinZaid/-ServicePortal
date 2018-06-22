using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ServicePortal.Models;

namespace ServicePortal.DAL
{
    public class BranchStockHandler
    {
        public static void Update(int id, BranchStock bs)
        {
            ServicesPortalApiEntities db = new ServicesPortalApiEntities();
            var data = db.BranchStocks.Where(m => m.Id == id).FirstOrDefault();
            data.Quantity = bs.Quantity;
            data.ItemID = bs.ItemID;
            db.SaveChanges();

        }


    }
}