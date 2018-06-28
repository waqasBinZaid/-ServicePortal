using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServicePortal.Models;
using ServicePortal.DAL;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;


namespace ServicePortal.Controllers
{
    [IsLogin]
    public class InventoryController : Controller
    {
        ServicesPortalApiEntities db = new ServicesPortalApiEntities();
        // GET: Inventory
        //private static int InventId = 0;
        public string RoundOff(string data)
        {
            string OldString = data;
            string NewString = System.Text.RegularExpressions.Regex.Replace(OldString, " {2,}", " ");
            string GetString = NewString.Trim();
            return GetString;
        }
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult SubjectByClassJs(int id)
        {

            db.Configuration.ProxyCreationEnabled = false;
            List<SubCategory> list = db.SubCategories.Where(m => m.CatId == id).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ModalDropDown(int CatId, int SubCatId, int ManfacId)
        {

            db.Configuration.ProxyCreationEnabled = false;
            List<Model> list = db.Models.Where(m => m.M_CatId == CatId & m.M_SubCatId == SubCatId & m.M_ManFacID == ManfacId).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        public ActionResult NewInv(int id = 0)
        {
            for (int i = 1; i < 100; i++)
            {
                Session["AccessoryNullOrNot" + i] = "";
            }


            ViewBag.Cat = DropDownHandler.Category();
            // ViewBag.Model = DropDownHandler.Model();
            ViewBag.ItemAttribute = DropDownHandler.ItemAttribute();
            ViewBag.Manfacturer = DropDownHandler.Manfacturer();
            ViewBag.AccesoriesItems = DropDownHandler.Item();

            if (id > 0)
            {
                Session["edithide"] = "edt";
                var dta = db.inventryItems.Where(m => m.id == id).FirstOrDefault();
                //var subCat = db.SubCategories.Where(o => o.id == dta.CatID).FirstOrDefault();

                //SubjectByClassJs(subCat.CatId);

                Session["UpdatCatName"] = dta.SubCategory.Category.Catgory;
                Session["UpdateSubcatName"] = dta.SubCategory.SubCat;
                Session["updateModel"] = dta.Model.Models;
                //InventoryItemCustom inventoryItemCustom = new InventoryItemCustom();
                //inventoryItemCustom.inventryItem = dta;
                //inventoryItemCustom.SubCategory = subCat;

                return View(dta);
            }
            else
            {
                Session["edithide"] = "new";

                return View();
            }
        }
        public ActionResult CatSubCatSave(ItemsCatSubCat itcat)
        {
            int itemID;
            var listt = db.inventryItems.ToList();
            if (listt.Count != 0)
            {
                var lastrecord = listt.Last();
                itemID = lastrecord.id + 1;

            }
            else
            {
                itemID = 1;
            }

            var data = db.ItemsCatSubCats.Where(m => m.CatID == itcat.CatID & m.SubCatID == itcat.SubCatID & m.AttTypeID == itcat.AttTypeID).FirstOrDefault();
            if (data != null)
            {
                return Content("errorr");
            }
            else
            {
                itcat.ItemID = itemID;
                db.ItemsCatSubCats.Add(itcat);
                db.SaveChanges();
                return Content("success");
            }
        }
        public ActionResult catsubcat(int CatID = 0, int SubCatID = 0)
        {
            var dta = db.ItemsCatSubCats.Where(m => m.CatID == CatID & m.SubCatID == SubCatID).FirstOrDefault();
            //Session["ItemName"] = dta.Category.Catgory + "|" + dta.SubCategory.SubCat;
            Session["istone"] = CatID;
            Session["secondone"] = SubCatID;
            return RedirectToAction("buteList");
        }
        public ActionResult buteList()
        {
            int CaID = Convert.ToInt32(Session["istone"]);
            int SubCaID = Convert.ToInt32(Session["secondone"]);

            var data = db.ItemsCatSubCats.Where(m => m.CatID == CaID & m.SubCatID == SubCaID).ToList();

            return PartialView("~/Views/Inventory/_AttributeList.cshtml", data);
        }
        public ActionResult CatSubCatAgainstModal(int Cat = 0, int SubCat = 0, int ModelID = 0)
        {
            // var dta = db.ItemsCatSubCats.Where(m => m.CatID == CatID & m.SubCatID == SubCatID).FirstOrDefault();
            //Session["ItemName"] = dta.Category.Catgory + "|" + dta.SubCategory.SubCat;
            Session["CatID"] = Cat;
            Session["SubCat"] = SubCat;
            Session["ModelID"] = ModelID;
            var data = db.ItemAttributes.Where(m => m.CatID == Cat & m.SubCatID == SubCat & m.ModelID == ModelID).ToList();

            int c = 0;
            if (data != null)
            {
                foreach (var itm in data)
                {

                    TempData["value" + c] = itm.AttributeValue;
                    c++;
                }
            }
            return RedirectToAction("AttributListForValue");
        }
        public ActionResult AttributListForValue()
        {
            int CaID = Convert.ToInt32(Session["CatID"]);
            int SubCaID = Convert.ToInt32(Session["SubCat"]);
            // 
            var data = db.ItemsCatSubCats.Where(m => m.CatID == CaID & m.SubCatID == SubCaID).ToList();
            // 
            return PartialView("~/Views/Inventory/_AttributeValueAgainstModel.cshtml", data);
        }
        [HttpPost]
        public ActionResult SaveAttributListForValue(List<ListOfRecord> itat)
        {

            int ItemID;
            var listt = db.inventryItems.ToList();
            if (listt.Count != 0)
            {
                var lastrecord = listt.Last();
                int SerialNo = lastrecord.id + 1;
                ItemID = SerialNo;

            }
            else
            {
                ItemID = 1;
            }
            var data = db.TempItermAttributes.ToList();

            if (data != null)
            {

                foreach (var item in data)
                {

                    db.TempItermAttributes.Remove(item);
                    db.SaveChanges();
                }

            }
            foreach (var itm in itat)
            {
                TempItermAttribute sb = new TempItermAttribute
                {

                    CatID = Convert.ToInt32(Session["CatID"]),
                    SubCatID = Convert.ToInt32(Session["SubCat"]),
                    ModelID = Convert.ToInt32(Session["ModelID"]),
                    ItemID = ItemID,
                    AttTypeID = itm.AttTypeID,
                    AttributeValue = itm.AttributeValue
                };
                db.TempItermAttributes.Add(sb);
                db.SaveChanges();
            }

            return Content("res");
        }
        public ActionResult SubCatSave(SubCategory sb)
        {
            string sbcat = RoundOff(sb.SubCat);
            var dta = db.SubCategories.Where(m => m.SubCat == sbcat & m.CatId == sb.CatId).ToList();
            if (dta.Count != 0)
            {
                return Content("alrdy");
            }
            else
            {
                sb.CompanyId = Convert.ToInt32(Session["Cid"]);

                sb.CreatedBy = Convert.ToString(Session["HAname"]);
                sb.CreatedOn = DateTime.Now;
                db.SubCategories.Add(sb);
                db.SaveChanges();

                return RedirectToAction("NewInv");
            }
        }
        public ActionResult CatSave(Category ct)
        {
            string cat = RoundOff(ct.Catgory);
            var dta = db.Categories.Where(m => m.Catgory == cat).ToList();
            if (dta.Count != 0)
            {
                return Content("alrdyct");
            }
            else
            {
                ct.CompanyID = Convert.ToInt32(Session["Cid"]);

                ct.CreatedBy = Convert.ToString(Session["HAname"]);
                ct.CreatedOn = DateTime.Now;
                db.Categories.Add(ct);
                db.SaveChanges();

                return RedirectToAction("NewInv");
            }
        }
        public ActionResult ManSave(Manufactuere mf)
        {
            string cat = RoundOff(mf.Manufactuere1);
            var dta = db.Manufactueres.Where(m => m.Manufactuere1 == cat).ToList();
            if (dta.Count != 0)
            {
                return Content("alrdyct");
            }
            else
            {
                mf.CompanyId = Convert.ToInt32(Session["Cid"]);
                mf.isActive = true;
                mf.CreatedBy = Convert.ToString(Session["HAname"]);
                mf.CreatedOn = DateTime.Now;
                mf.ModifiedBy = Convert.ToString(Session["HAname"]);
                db.Manufactueres.Add(mf);
                db.SaveChanges();

                return RedirectToAction("NewInv");
            }
        }

        public ActionResult BrandSave(Brand br)
        {
            if (br.Brand1 == null)
            {
                return Content("error");
            }
            else
            {
                br.CompanyID = Convert.ToInt32(Session["Cid"]);

                br.CreatedBY = Convert.ToString(Session["HAname"]);
                br.Createdon = DateTime.Now;
                db.Brands.Add(br);
                db.SaveChanges();

                return RedirectToAction("NewInv");
            }
        }

        public ActionResult CountrySave(Country cnt)
        {
            if (cnt.Country1 == null)
            {
                return Content("error");
            }
            else
            {

                cnt.CompanyID = Convert.ToInt32(Session["Cid"]);

                cnt.CreatedBy = Convert.ToString(Session["HAname"]);
                cnt.CreatedOn = DateTime.Now;
                db.Countries.Add(cnt);
                db.SaveChanges();

                return RedirectToAction("NewInv");
            }
        }
        public ActionResult ModelSave(Model md)
        {
            string mod = RoundOff(md.Models);
            var dta = db.Models.Where(m => m.Models == mod & m.M_CatId == md.M_CatId & m.M_SubCatId == md.M_SubCatId & m.M_ManFacID == md.M_ManFacID).ToList();
            if (dta.Count != 0)
            {
                return Content("alrdyct");
            }
            else
            {


                if (md.Models == null)
                {
                    return Content("error");
                }
                else
                {
                    md.CompanyID = Convert.ToInt32(Session["Cid"]);

                    md.CreatedBy = Convert.ToString(Session["HAname"]);
                    md.CreatedOn = DateTime.Now;
                    db.Models.Add(md);
                    db.SaveChanges();

                    return RedirectToAction("NewInv");
                }
            }
        }
        //public ActionResult ModleDropDown(int CatId , int SubCatId , int ManfacId)
        //{
        //    TempData["MdDrop"] = DropDownHandler.Model(CatId, SubCatId, ManfacId);
        //    return View();
        //}

        public ActionResult AccesorySave(Accesory acc)
        {
            //var data = db.Accesories.Where(m => m.CatID == acc.CatID & m.SubCatID == acc.SubCatID & m.ModelID == acc.ModelID ).FirstOrDefault();
            //if(data != null)
            //{
            //    return Content("errorr");
            //}
            //else
            //{
            db.Accesories.Add(acc);
            db.SaveChanges();
            return Content("save");

            // }


        }
        public ActionResult AccessoryList(int CatID, int SubCatID, int ModelId)
        {
            Session["ctid"] = CatID;
            Session["sbctid"] = SubCatID;
            Session["mdid"] = ModelId;

            return RedirectToAction("AccessoryListReturn");
        }
        public ActionResult AccessoryListReturn()
        {
            int Catid = Convert.ToInt32(Session["ctid"]);
            int subcatid = Convert.ToInt32(Session["sbctid"]);
            int ModelID = Convert.ToInt32(Session["mdid"]);
            var data = db.Accesories.Where(m => m.CatID == Catid & m.SubCatID == subcatid & m.ModelID == ModelID).ToList();
            int c = 1;
            foreach (var itm in data)
            {
                Session["AccessoryNullOrNot" + c] = itm.AccessoryID;
                c++;
            }


            return PartialView("~/Views/Inventory/_AccessoriesList.cshtml", data);
        }
        public ActionResult AccessoriesDelete(int id = 0)
        {
            var data = db.Accesories.Where(m => m.Id == id).FirstOrDefault();
            db.Accesories.Remove(data);
            db.SaveChanges();
            return RedirectToAction("NewInv");
        }
        public ActionResult Save(inventryItem I)
        {
            if (I.id > 0)
            {
                InventoryHandler.UpdateItem(I.id, I);
                db.SaveChanges();
                return RedirectToAction("List");

            }
            else
            {


                int itemID;
                var listt = db.inventryItems.ToList();
                if (listt.Count != 0)
                {
                    var lastrecord = listt.Last();
                    itemID = lastrecord.id + 1;

                }
                else
                {
                    itemID = 1;
                }
                //var dt = db.inventryItems.Where(m => m.CatID == I.CatID & m.ModelID == I.ModelID & m.BrandID == I.BrandID).FirstOrDefault();
                //if(dt != null)
                //{
                Session["itmfid"] = itemID;
                string path = null;
                if (Request.Files != null && Request.Files.Count > 0)
                {

                    foreach (string f in Request.Files)
                    {
                        HttpPostedFileBase file = Request.Files[f];
                        if (file.FileName == "")
                        {
                            path = "/Files/user.jpg";
                        }
                        else
                        {
                            string webpath = "/Files/" + DateTime.Now.Ticks + file.FileName.Substring(file.FileName.LastIndexOf("."));
                            file.SaveAs(Request.MapPath(webpath)); //physical path is required to save a file
                            path = webpath;
                        }
                    }
                }

                I.Image = path;
                I.id = itemID;
                I.CompanyId = Convert.ToInt32(Session["Cid"]);
                I.CreatedBy = Session["HAname"].ToString();
                I.CreatedOn = DateTime.Now;
                db.inventryItems.Add(I);
                db.SaveChanges();

                return RedirectToAction("TemDataMove");
                //}
                //    else
                ////    {
                //        TempData["itemalready"] = "Item Is Already Exist";
                //        return RedirectToAction("NewInv");}

            }
        }

        public ActionResult TemDataMove()
        {
            int itemID = Convert.ToInt32(Session["itmfid"]);
            var data = db.TempItermAttributes.Where(m => m.ItemID == itemID).ToList();
            if (data != null)
            {
                foreach (var itm in data)
                {
                    ItemAttribute sb = new ItemAttribute
                    {

                        CatID = itm.CatID,
                        SubCatID = itm.SubCatID,
                        ModelID = itm.ModelID,
                        ItemID = itm.ItemID,
                        AttTypeID = itm.AttTypeID,
                        AttributeValue = itm.AttributeValue

                    };
                    db.ItemAttributes.Add(sb);
                    db.SaveChanges();
                }
            }
            return RedirectToAction("List");

        }

        public ActionResult List()
        {
            Session["UpdateSubcatName"] = "";
            Session["UpdatCatName"] = "";
            Session["updateModel"] = "";

            // var data = db.inventryItems.GroupBy(m => m.ModelID).ToList();
            //var result = from inventry in db.inventryItems group inventry by inventry.ModelID into invent select invent;

            var data = db.inventryItems.GroupBy(m => new { m.SubCategory.CatId, m.CatID, m.ModelID }).Select(grp => grp.FirstOrDefault()).ToList();
            
            return View(data);
        }
    public ActionResult GroupByItemList(int id=0)
        {
            var data = db.inventryItems.Where(m => m.id == id).FirstOrDefault();
            var Items = db.inventryItems.Where(m => m.SubCategory.CatId == data.SubCategory.CatId & m.CatID == data.CatID & m.ModelID == data.ModelID).ToList();

            return View(Items);
        }
        public ActionResult ItemAttribute()
        {
            //ViewBag.items = DropDownHandler.Item();
            ViewBag.ItemType = DropDownHandler.ItemAttribute();

            return PartialView("~/Views/Inventory/_IttemAttribute.cshtml");
        }
        //public ActionResult SaveItemAttributeVal(ItemAttribute ia)
        //{
        //    ia.ItemID = Convert.ToInt32(Session["itmID"]);
        //    var data = db.ItemAttributes.Where(m => m.ItemID == ia.ItemID & m.ItemAttributeID == ia.ItemAttributeID).FirstOrDefault();
        //    if(data != null)
        //    {
        //        data.ItemAttributeValue = ia.ItemAttributeValue;
        //        db.SaveChanges();

        //    }
        //    else { 
        //    db.ItemAttributes.Add(ia);
        //    db.SaveChanges();

        //    }
        //    return RedirectToAction("DetailsInventory", "InventoryDetails");
        //}
        public ActionResult SubItemAttributeData(int Cat = 0, int SubCat = 0, int ModelID = 0)
        {
            Session["sbitmcat"] = Cat;
            Session["sbitmsubcat"] = SubCat;
            Session["sbitmmodel"] = ModelID;
            return RedirectToAction("SubItemAttributeList");

        }
        public ActionResult SubItemAttributeList()
        {
           int Cat = Convert.ToInt32(Session["sbitmcat"]);
            int SubCat = Convert.ToInt32(Session["sbitmsubcat"]);
            int ModelID = Convert.ToInt32(Session["sbitmmodel"]);
            var AttributeName = db.ItemsCatSubCats.Where(m => m.CatID == Cat & m.SubCatID == SubCat).ToList();
            Session["AttributeListCount"] = AttributeName.Count();
            var data = db.ItemAttributes.Where(m => m.CatID == Cat & m.SubCatID == SubCat & m.ModelID == ModelID).ToList();
            return View("~/Views/Inventory/_SubItemAttributeList.cshtml", data);
        }
        public ActionResult SaveItemAttribute(ItemAttributeType atp)
        {
            string att = RoundOff(atp.ItemAttribute);
            var dta = db.ItemAttributeTypes.Where(m => m.ItemAttribute == att).ToList();
            if (dta.Count != 0)
            {
                return Content("itmatt");
            }
            else
            {

                atp.ActiveAttribute = false;
                atp.CreatedBy = (Session["HAname"]).ToString();
                atp.CreatedOn = DateTime.Now;
                db.ItemAttributeTypes.Add(atp);
                db.SaveChanges();

                return Content("");
            }
        }
        public ActionResult ListItemAttribute()
        {
            int Id = Convert.ToInt32(Session["itmID"]);
            var data = db.ItemAttributes.Where(m => m.ItemID == Id).ToList();
            return PartialView("~/Views/Inventory/_DetailsitemAttributes.cshtml", data);
        }
        public ActionResult CombinationList()
        {
            var data = db.inventryItems.ToList();
            return PartialView("~/Views/Inventory/_CatSubCatCombination.cshtml", data);
        }
        public ActionResult Combinations(int id = 0)
        {
            var data = db.inventryItems.Where(m => m.id == id).FirstOrDefault();
            Session["category"] = data.SubCategory.Category.Catgory;
            Session["sbcat"] = data.SubCategory.SubCat;
            Session["mdl"] = data.Model.Models;

            return RedirectToAction("NewInv");
        }
        
        public ActionResult WeigBridgeSave(WeighBridge wb)
        {

            wb.CreatedBy = Session["HAname"].ToString();
            wb.CreatedOn = DateTime.Now;
            db.WeighBridges.Add(wb);
            db.SaveChanges();
            return RedirectToAction("List");
        }
        public ActionResult WeighList()
        {
            var data = db.WeighBridges.ToList();

            return PartialView("~/Views/Inventory/_WeighBridgeList.cshtml", data);
        }
        public ActionResult testto(int id = 0)
        {
            var data = db.WeighBridges.Where(m => m.Id == id).FirstOrDefault();
            Session["packname"] = data.Name;
            Session["idoff"] = id;
            return RedirectToAction("WeighBridgeDetail");
        }
        public ActionResult WeighBridgeDetail()
        {
            int id = Convert.ToInt32(Session["idoff"]);
            return View(db.WeighBridgeItemValues.Where(m => m.WeighBridgeID == id).ToList());
        }
        public ActionResult ItemsDetail()
        {

            return View();
        }
        public ActionResult AddItemValue()
        {
            List<SelectListItem> itemsQnty = new List<SelectListItem>();
            var vlu = db.inventryItems.ToList();
            itemsQnty.Add(new SelectListItem { Text = "Select Item", Value = "" });
            foreach (var itm in vlu)
            {
                itemsQnty.Add(new SelectListItem { Text = itm.SubCategory.Category.Catgory + itm.SubCategory.SubCat, Value = itm.id.ToString() });

            }
            ViewBag.ItemsQnty = itemsQnty;
            return View("~/Views/Inventory/_AddWeigBridgeItemQuantity.cshtml");
        }
        public ActionResult ItemValueSave(WeighBridgeItemValue wbv)
        {
            wbv.BranchID = Convert.ToInt32(Session["Branchid"]);
            wbv.WeighBridgeID = Convert.ToInt32(Session["idoff"]);
            var data = db.WeighBridgeItemValues.Where(m => m.ItemID == wbv.ItemID & m.WeighBridgeID == wbv.WeighBridgeID).FirstOrDefault();
            if (data != null)
            {
                data.Quantity = data.Quantity + wbv.Quantity;
                db.SaveChanges();
            }
            else
            {
                wbv.WeighBridgeID = Convert.ToInt32(Session["idoff"]);

                db.WeighBridgeItemValues.Add(wbv);
                db.SaveChanges();

            }
            return RedirectToAction("WeighBridgeDetail");
        }
        public ActionResult PurchaseItems()
        {
            //List<SelectListItem> BranchID = new List<SelectListItem>();
            //var vlu = db.Branches.ToList();
            //BranchID.Add(new SelectListItem { Text = "Select Branch", Value = "" });
            //foreach (var itm in vlu)
            //{
            //    BranchID.Add(new SelectListItem { Text = itm.BranchName , Value = itm.id.ToString() });

            //}
            //ViewBag.Pbranch = BranchID;

            List<SelectListItem> Pitems = new List<SelectListItem>();
            var itemsp = db.inventryItems.ToList();
            Pitems.Add(new SelectListItem { Text = "Select Item", Value = "" });
            foreach (var itm in itemsp)
            {
                Pitems.Add(new SelectListItem { Text = itm.SubCategory.Category.Catgory +" | "+ itm.SubCategory.SubCat, Value = itm.id.ToString() });

            }
            ViewBag.ItemsPurchase = Pitems;


            List<SelectListItem> Suplier = new List<SelectListItem>();
            var psuplier = db.Suppliers.ToList();
            Suplier.Add(new SelectListItem { Text = "Select Suplier", Value = "" });
            foreach (var itm in psuplier)
            {
                Suplier.Add(new SelectListItem { Text = itm.SupplierName, Value = itm.Id.ToString() });

            }
            ViewBag.Pursuplier = Suplier;

            return View();
        }
        public ActionResult PurchaseSave(Receipt rec)
        {
            Session["check"] = 0;
            rec.BranchID = Convert.ToInt32(Session["Branchid"]);
            BranchStock bs = new BranchStock()
            {
                Quantity = Convert.ToInt32(rec.ReceiptQuantity),
                BranchID = rec.BranchID,
                ItemID = rec.ItemID,
                CreatedBy = Session["BranchAdminname"].ToString()

            };
            var data = db.BranchStocks.Where(m => m.BranchID == rec.BranchID & m.ItemID == rec.ItemID).FirstOrDefault();
            if (data != null)
            {
                Session["check"] = 1;
                data.Quantity = data.Quantity + Convert.ToInt32(rec.ReceiptQuantity);
                db.SaveChanges();
            }


            string path = null;
            if (Request.Files != null && Request.Files.Count > 0)
            {

                foreach (string f in Request.Files)
                {
                    HttpPostedFileBase file = Request.Files[f];
                    if (file.FileName == "")
                    {
                        path = "/Files/user.jpg";
                    }
                    else
                    {
                        string webpath = "/Files/" + DateTime.Now.Ticks + file.FileName.Substring(file.FileName.LastIndexOf("."));
                        file.SaveAs(Request.MapPath(webpath)); //physical path is required to save a file
                        path = webpath;
                    }
                }
            }

            rec.ReceiptDocument = path;
            rec.ReceivedBy = Session["BranchAdminname"].ToString();
            rec.ReceivedOn = DateTime.Now;
            rec.CreatedBy = Session["BranchAdminname"].ToString();
            rec.CreateOn = DateTime.Now;
            int check = Convert.ToInt32(Session["check"]);
            if (check == 0)
            {
                db.BranchStocks.Add(bs);
            }
            db.Receipts.Add(rec);
            db.SaveChanges();

            return RedirectToAction("PurchaseItems");
        }
        public ActionResult SuplierSave(Supplier sp)
        {
            sp.CreatedBy = Session["HAname"].ToString();
            sp.CreatedOn = DateTime.Now;
            db.Suppliers.Add(sp);
            db.SaveChanges();

            return RedirectToAction("PurchaseItems");
        }

    }
}