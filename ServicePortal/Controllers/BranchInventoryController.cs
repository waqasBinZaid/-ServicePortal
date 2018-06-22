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
    public class BranchInventoryController : Controller
    {
        ServicesPortalApiEntities db = new ServicesPortalApiEntities();
        // GET: BranchInventory
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AddStocks(int id=0)
        {
            ViewBag.item = DropDownHandler.Item();
            var data = db.BranchStocks.Where(m => m.Id == id).FirstOrDefault();


            return PartialView("~/Views/BranchInventory/_AddStock.cshtml", data);
        }
        public ActionResult SaveStocks(BranchStock bs)
        {
            if (bs.Id > 0)
            {
                BranchStockHandler.Update(bs.Id, bs);
                db.SaveChanges();
                return RedirectToAction("ListStocks");

            }
            else 
            {
                bs.BranchID = Convert.ToInt32(Session["Branchid"]);
                var bsdata = db.BranchStocks.Where(m => m.ItemID == bs.ItemID & m.BranchID == bs.BranchID).FirstOrDefault();
                if(bsdata != null)
                {
                    bsdata.Quantity = bsdata.Quantity + bs.Quantity;
                    db.SaveChanges();

                }
            else { 
            var dta = db.inventryItems.Where(m => m.id == bs.ItemID).FirstOrDefault();
                    int count = Convert.ToInt32(dta.TotalQuantity);
                    dta.TotalQuantity = count + bs.Quantity;
                    bs.BranchID= Convert.ToInt32(Session["Branchid"]);
            bs.CreatedBy =(Session["BranchAdminname"]).ToString();
            db.BranchStocks.Add(bs);
            db.SaveChanges();
                }
                return RedirectToAction("ListStocks");
        }
        }
        public ActionResult ListStocks()
        {
            int bid =Convert.ToInt32 (Session["Branchid"]);
            return View(db.BranchStocks.Where(m=>m.BranchID==bid).ToList());
        }
        public ActionResult Delete(int id)
        {
            var data = db.BranchStocks.Where(m => m.Id == id).FirstOrDefault();
            db.BranchStocks.Remove(data);
            db.SaveChanges();

            return RedirectToAction("ListStocks");
        }
        

        public ActionResult NewPackage()
        {
            List<SelectListItem> PackageName = new List<SelectListItem>();
            var vlu = db.WeighBridges.ToList();
            PackageName.Add(new SelectListItem { Text = "Select Package", Value = "" });
            foreach (var itm in vlu)
            {
                PackageName.Add(new SelectListItem { Text = itm.Name , Value = itm.Id.ToString() });

            }
            ViewBag.packname = PackageName;

            return PartialView("~/Views/BranchInventory/_AddPackage.cshtml");
        }
        public ActionResult SavePackage(PackageBranchStock brs)
        {
            brs.BranchID = Convert.ToInt32(Session["Branchid"]);

            var data = db.PackageBranchStocks.Where(m => m.WeighBridgeID == brs.WeighBridgeID & m.BranchID == brs.BranchID).FirstOrDefault();
            if(data != null)
            {

                data.Quantity = data.Quantity + brs.Quantity;
                db.SaveChanges();

            }
            else { 
            brs.CreatedBy = (Session["BranchAdminname"]).ToString();
        
            db.PackageBranchStocks.Add(brs);
            db.SaveChanges();
            }
            return RedirectToAction("ListStocks");
        }

        public ActionResult PackageList()
        {
            int bid = Convert.ToInt32(Session["Branchid"]);
            var list = db.PackageBranchStocks.Where(m => m.BranchID == bid).ToList();
            return PartialView("~/Views/BranchInventory/_PackageList.cshtml",list);
        }
        public ActionResult PackageDetail(int id=0)
        {
           
            return View();
        }
        public ActionResult ItemID(int id = 0)
        {
            Session["IssueItemId"] = id;
            var data = db.inventryItems.Where(m => m.id == id).FirstOrDefault();
            Session["salename"] = data.SalesDescription;
            Session["saleprice"] = data.AvgSalePrice;
            return RedirectToAction("IssueItems");
        }
        public ActionResult IssueItems()
        {
            List<SelectListItem> CustomerName = new List<SelectListItem>();
            var vlu = db.Cutomers.ToList();
            CustomerName.Add(new SelectListItem { Text = "Select Customer", Value = "" });
            foreach (var itm in vlu)
            {
                CustomerName.Add(new SelectListItem { Text = itm.CustomerName, Value = itm.Id.ToString() });

            }
            ViewBag.custname = CustomerName;


            List<SelectListItem> BranchName = new List<SelectListItem>();
            var brnchnm = db.Branches.ToList();
            BranchName.Add(new SelectListItem { Text = "Select Branch", Value = "" });
            foreach (var itm in brnchnm)
            {
                BranchName.Add(new SelectListItem { Text = itm.BranchName, Value = itm.id.ToString() });

            }
            ViewBag.brnchissu = BranchName;

           

            return View();
        }

        public ActionResult IssueItemSave(Issue iss)
        {
            if (iss.IssuedQuantity < 0)
            {
                return Content("minus");
            }
            else
            {
                iss.BranchID = Convert.ToInt32(Session["Branchid"]);
                iss.ItemID = Convert.ToInt32(Session["IssueItemId"]);
                iss.CreatedBy = (Session["BranchAdminname"]).ToString();
                iss.CreatedOn = DateTime.Now;
                iss.IssuedBy = (Session["BranchAdminname"]).ToString();
                iss.IssuedOn = DateTime.Now;
                var data = db.BranchStocks.Where(m => m.ItemID == iss.ItemID & m.BranchID == iss.BranchID).FirstOrDefault();

                if (data != null)
                {
                    if (data.Quantity >= iss.IssuedQuantity)
                    {

                        data.Quantity = data.Quantity - Convert.ToInt32(iss.IssuedQuantity);
                        db.Issues.Add(iss);
                        db.SaveChanges();
                        var dta = db.BranchStocks.Where(m => m.BranchID == iss.IssuedBranchID & m.ItemID == iss.ItemID).FirstOrDefault();
                        if (dta != null)
                        {
                            dta.Quantity = dta.Quantity + Convert.ToInt32(iss.IssuedQuantity);
                            db.SaveChanges();
                        }
                        else
                        {
                            BranchStock bs = new BranchStock()
                            {
                                Quantity = Convert.ToInt32(iss.IssuedQuantity),
                                ItemID = iss.ItemID,
                                BranchID = iss.IssuedBranchID,
                                CreatedBy = iss.CreatedBy,

                            };
                            db.BranchStocks.Add(bs);
                            db.SaveChanges();

                            return Content("NoItemInstock");
                            //TempData["qunaty"] = "Branch Not have this item in stock";
                        }
                    }

                    else
                    {
                        return Content("NoQuantityToIssue");
                        //TempData["qunaty"] = "You have not enough quantity to issue";
                    }

                }

                return RedirectToAction("IssueItems");
            }
        }
        public ActionResult SaveCustomer(Cutomer cus)
        {
            db.Cutomers.Add(cus);
            db.SaveChanges();

            return View();
        }
        public ActionResult PackageID(int id = 0)
        {
            Session["issuePackageID"] = id;
            var data = db.WeighBridges.Where(m => m.Id == id).FirstOrDefault();
            Session["packname"] = data.Name;
          
            return RedirectToAction("IssuePackage");
        }

        public ActionResult IssuePackage()
        {
            List<SelectListItem> PackCustomer = new List<SelectListItem>();
            var vlu = db.Cutomers.ToList();
            PackCustomer.Add(new SelectListItem { Text = "Select Customer", Value = "" });
            foreach (var itm in vlu)
            {
                PackCustomer.Add(new SelectListItem { Text = itm.CustomerName, Value = itm.Id.ToString() });

            }
            ViewBag.packcus = PackCustomer;


            List<SelectListItem> BranchID = new List<SelectListItem>();
            var brnchnm = db.Branches.ToList();
            BranchID.Add(new SelectListItem { Text = "Select Branch", Value = "" });
            foreach (var itm in brnchnm)
            {
                BranchID.Add(new SelectListItem { Text = itm.BranchName, Value = itm.id.ToString() });

            }
            ViewBag.PackageBranch = BranchID;



            return View();
        }

        public ActionResult SavePackageIssue(PackageIssue iss)
        {

            iss.BranchID = Convert.ToInt32(Session["Branchid"]);
            iss.WeighBridgeID = Convert.ToInt32(Session["issuePackageID"]);
            iss.IssuedBy = (Session["BranchAdminname"]).ToString();
            iss.IssuedOn = DateTime.Now;
            
            var data = db.PackageBranchStocks.Where(m => m.WeighBridgeID == iss.WeighBridgeID & m.BranchID == iss.BranchID).FirstOrDefault();

            if (data != null)
            {
                if (data.Quantity >= iss.IssuedQuantity)
                {

                    data.Quantity = data.Quantity - Convert.ToInt32(iss.IssuedQuantity);
                    db.PackageIssues.Add(iss);
                    db.SaveChanges();
                    var dta = db.PackageBranchStocks.Where(m => m.BranchID == iss.IssuedBranchID & m.WeighBridgeID == iss.WeighBridgeID).FirstOrDefault();
                    if (dta != null)
                    {
                        dta.Quantity = dta.Quantity + Convert.ToInt32(iss.IssuedQuantity);
                        db.SaveChanges();
                    }
                    else
                    {
                        return Content("NoItemInstock");
                        //TempData["qunaty"] = "Branch Not have this item in stock";
                    }
                }

                else
                {
                    return Content("NoQuantityToIssue");
                    //TempData["qunaty"] = "You have not enough quantity to issue";
                }

            }

            return RedirectToAction("IssueItems");
        }
        public ActionResult ReturnItemID(int id = 0)
        {
            Session["returnItemID"] = id;
            var data = db.inventryItems.Where(m => m.id == id).FirstOrDefault();
            Session["salename"] = data.SalesDescription;
            Session["saleprice"] = data.AvgSalePrice;
            return RedirectToAction("ReturnItems");
        }
        public ActionResult ReturnItems()
        {
            List<SelectListItem> CustomerName = new List<SelectListItem>();
            var vlu = db.Cutomers.ToList();
            CustomerName.Add(new SelectListItem { Text = "Select Customer", Value = "" });
            foreach (var itm in vlu)
            {
                CustomerName.Add(new SelectListItem { Text = itm.CustomerName, Value = itm.Id.ToString() });

            }
            ViewBag.custname = CustomerName;


            List<SelectListItem> BranchName = new List<SelectListItem>();
            var brnchnm = db.Branches.ToList();
            BranchName.Add(new SelectListItem { Text = "Select Branch", Value = "" });
            foreach (var itm in brnchnm)
            {
                BranchName.Add(new SelectListItem { Text = itm.BranchName, Value = itm.id.ToString() });

            }
            ViewBag.brnchissu = BranchName;



            return View();
        }

        public ActionResult ReturnItemSave(ReturnItem rt)
        {
            if (rt.QuantityReturn < 0)
            {
                return Content("minus");
            }
            else
            {
                rt.BranchID = Convert.ToInt32(Session["Branchid"]);
                rt.ItemID = Convert.ToInt32(Session["returnItemID"]);
                rt.CreatedBy = (Session["BranchAdminname"]).ToString();
                rt.CreatedOn = DateTime.Now;
                rt.ReturnBy = (Session["BranchAdminname"]).ToString();
                rt.ReturnedOn = DateTime.Now;
                var data = db.Issues.Where(m => m.ItemID == rt.ItemID & (m.BranchID == rt.BranchID || m.CustomerID == rt.CustomerID)).FirstOrDefault();

                if (data != null)
                {
                    var dta = db.BranchStocks.Where(m => m.ItemID == rt.ItemID & m.BranchID == rt.BranchID).FirstOrDefault();

                   if(dta != null)
                    {
                        dta.Quantity = dta.Quantity + Convert.ToInt32(rt.QuantityReturn); db.SaveChanges();
                        
                        db.ReturnItems.Add(rt);
                        db.SaveChanges();
                        return Content("returnitem");

                    }
                    else
                    {
                        BranchStock bs = new BranchStock()
                        {
                            ItemID = rt.ItemID,
                            BranchID = rt.BranchID,
                            Quantity =Convert.ToInt32( rt.QuantityReturn),
                            CreatedBy = rt.CreatedBy

                        };
                        db.BranchStocks.Add(bs);
                        db.ReturnItems.Add(rt);
                        db.SaveChanges();
                        return Content("rtrn");

                    }
                   
                }

                    else
                    {
                        return Content("noitem");
                        //TempData["qunaty"] = "You have not enough quantity to issue";
                    }

                }

                //return RedirectToAction("IssueItems");
            }

     

    }
}