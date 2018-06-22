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
    public class DesignationController : Controller
    {
        
        ServicesPortalApiEntities db = new ServicesPortalApiEntities();
        // GET: Designation
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AddNewDesignation()
        {
           

            return PartialView("~/Views/Designation/_AddnewDesignation.cshtml");
        }
        public ActionResult DesignationSave(Designation d)
        {
            d.CompanyId = Convert.ToInt32(Session["Cid"]);
            d.CreadtedBy = Convert.ToString(Session["HAname"]);
            d.CreadtedDate = DateTime.Now;
            db.Designations.Add(d);
            db.SaveChanges();
            return RedirectToAction("DesignationList");
        }
        public ActionResult DesignationList()
        {
            int cid = Convert.ToInt32(Session["Cid"]);
            return View(db.Designations.Where(m => m.CompanyId == cid).ToList());
        }
        public ActionResult delete(int id)
        {
            var data = db.Designations.Where(m => m.id == id).FirstOrDefault();
            db.Designations.Remove(data);
            db.SaveChanges();
            return RedirectToAction("DesignationList");
        }
    }
}
