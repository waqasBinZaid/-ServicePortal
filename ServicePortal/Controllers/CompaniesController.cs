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
    public class CompaniesController : Controller
    {
        // GET: Companies
        ServicesPortalApiEntities db = new ServicesPortalApiEntities();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult NewCompany()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CompanySave(Company c)
        {
            string cname = c.CompanyName; 
        
            var check = db.Companies.Where(m => m.CompanyName == cname).FirstOrDefault();
            if (check != null)
            {
                TempData["Error"] = "Company Name Already Exist ";
                return RedirectToAction("NewCompany");
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
            c.Logo = path;
            c.CreatedBy = Convert.ToString(Session["SAname"]);
            c.CreatedDate = DateTime.Now;
            c.Status = true;
            db.Companies.Add(c);
            db.SaveChanges();
            return RedirectToAction ("ListCompany");
        }
        public ActionResult ListCompany()
        {
            return View(db.Companies.Where(m=>m.id!=1).ToList());
        }
        public ActionResult NewUserC()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CUSave(User ur)
        {
            string urname = ur.UserName;
            string email = ur.Email;
            var check = db.Users.Where(m => m.Email == email || m.UserName == urname).FirstOrDefault();
            if (check != null)
            {
                TempData["Error"] = "User Name Already Exist ";
                return RedirectToAction("NewUserC");
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
            int a = Convert.ToInt32(Session["uid"]);
            ur.PictuerPath = path;
            ur.UserType = "HeadOffice";
            ur.CompanyId = a;
            db.Users.Add(ur);
            db.SaveChanges();

            return RedirectToAction("CompanyUser");
        }
        public ActionResult CompanyUser1(int id)
        {
            Session["uid"] = id;
            return RedirectToAction("CompanyUser");
        }
        public ActionResult CompanyUser()
        {
            int id = Convert.ToInt32(Session["uid"]);
            return View(db.Users.Where(m => m.CompanyId==id & m.UserType== "HeadOffice").ToList());
        }
        public ActionResult Delete(int id)
        {
            var data = db.Users.Where(m => m.id == id).FirstOrDefault();
            if (data != null)
            {

                db.Users.Remove(data);
                db.SaveChanges();
            }
            return RedirectToAction("CompanyUser");
        }
    }
}