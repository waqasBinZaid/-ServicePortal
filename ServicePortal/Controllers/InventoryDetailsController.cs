using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServicePortal.Models;
using ServicePortal.DAL;

namespace ServicePortal.Controllers
{
    [IsLogin]
    public class InventoryDetailsController : Controller
    {
        
        ServicesPortalApiEntities db = new ServicesPortalApiEntities();
        // GET: InventoryDetails
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DetailItemID(int id = 0)
        {
            Session["itmID"] = id;
            return RedirectToAction("DetailsInventory");
        }

        public ActionResult DetailsInventory()
        {
            int id = Convert.ToInt32(Session["itmID"]);
            var qdata = db.BranchStocks.Where(m => m.ItemID == id).ToList();
            int qnty = 0;
            
            foreach (var itm in qdata)
            {
                qnty = qnty + Convert.ToInt32(itm.Quantity);

            }
            ViewBag.Qnty = qnty;
            var invendata = db.inventryItems.Where(m => m.id == id).FirstOrDefault();
            if(invendata != null)
            {
                invendata.TotalQuantity = ViewBag.Qnty;

            }
            var packqnty = db.WeighBridgeItemValues.Where(m => m.ItemID == id).ToList();
            int pckqnty = 0;
            foreach(var pitm in packqnty)
            {
                pckqnty = pckqnty + pitm.Quantity;

            }
            ViewBag.pcQnty = pckqnty;

            return View(db.inventryItems.Where(m => m.id == id).ToList());
        }
     
        public ActionResult BranchItems()
        {
            int id = Convert.ToInt32(Session["itmID"]);
            var data = db.BranchStocks.Where(m => m.ItemID == id).ToList();

            return PartialView("~/Views/InventoryDetails/_BranchItems.cshtml", data);
        }
        public ActionResult BranchPackItems()
        {
            int id = Convert.ToInt32(Session["itmID"]);
            var data = db.WeighBridgeItemValues.Where(m => m.ItemID == id).ToList();
           
            return PartialView("~/Views/InventoryDetails/_BranchPackItemStock.cshtml", data);
        }
        public ActionResult AccesoriesDetails()
        {
           int DetailItemID = Convert.ToInt32(Session["itmID"]);
            var data = db.inventryItems.Where(m => m.id == DetailItemID).FirstOrDefault();
            var AccData = db.Accesories.Where(m => m.CatID == data.SubCategory.CatId & m.SubCatID == data.CatID & m.ModelID == data.ModelID).ToList();

            return PartialView("~/Views/InventoryDetails/_AccesoriesDetailList.cshtml",AccData);
        }

    }
}