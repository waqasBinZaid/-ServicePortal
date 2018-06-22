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
    public class DepartmentController : Controller
    {  
        ServicesPortalApiEntities db = new ServicesPortalApiEntities();
        // GET: Department
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AddNewDepartment()
        { 
        
            return PartialView("~/Views/Department/_Addnew.cshtml");
        }
        public ActionResult DptSave(Department dpt)
        {
            dpt.CompanyID= Convert.ToInt32(Session["Cid"]);
            dpt.createdBy = Convert.ToString(Session["HAname"]);
            dpt.CreatedDate = DateTime.Now;
            db.Departments.Add(dpt);
            db.SaveChanges();
            return RedirectToAction("DptList");
        }
        public ActionResult DptList()
        {
            int cid= Convert.ToInt32(Session["Cid"]);
            return View(db.Departments.Where(m=>m.CompanyID==cid).ToList());
        }
        public ActionResult Dptdelete(int id)
        {
            var data = db.Departments.Where(m => m.id == id).FirstOrDefault();
            db.Departments.Remove(data);
            db.SaveChanges();
            return RedirectToAction("DptList");
        }
    }
}