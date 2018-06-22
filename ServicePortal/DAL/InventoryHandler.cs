using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ServicePortal.Models;

namespace ServicePortal.DAL
{
    public class InventoryHandler
    {
        
        public static void UpdateItem(int Id , inventryItem itm )
        {
            ServicesPortalApiEntities db = new ServicesPortalApiEntities();
            var data = db.inventryItems.Where(m => m.id == Id).FirstOrDefault();
            if(data != null)
            {
                data.AvgSalePrice = itm.AvgSalePrice;
                data.AvgPurchasePrice = itm.AvgPurchasePrice;
                data.BottemPrice = itm.BottemPrice;
                data.InternalPrice = itm.InternalPrice;
                data.TradesPrice = itm.TradesPrice;
                data.QoutedPrice = itm.QoutedPrice;
                data.SalesDescription = itm.SalesDescription;
                data.PurchaseDescription = itm.PurchaseDescription;

            }
            db.SaveChanges();

        }


    }
}