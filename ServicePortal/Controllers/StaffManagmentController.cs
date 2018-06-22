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
    public class StaffManagmentController : Controller
    {
        ServicesPortalApiEntities db = new ServicesPortalApiEntities();

        // GET: StaffManagment
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AddNewStaff(int id=0)
        {
            if (id > 0)
            {
                var data = db.Users.Where(m => m.id == id).FirstOrDefault();
                StaffHandler.Update(data.id, data);
                TempData["deactive"] = "User Succesfully DeActivated";
                return RedirectToAction("StaffList");
            }
            else { 
            int cid = Convert.ToInt32(Session["BranchCompanyid"]);
            ViewBag.Dept = DropDownHandler.Dept(cid);
            ViewBag.Designation = DropDownHandler.Designation(cid);

           
            return View();
            }
        }
        //public ActionResult Updatestaf(int id = 0)
        //{
        //    var data = db.Users.Where(m => m.id == id).FirstOrDefault(); 

        //    return View();
        //}

        [HttpPost]
        public ActionResult SaveStaff(User ur)
        {
             
            string urname = ur.UserName;
            string email = ur.Email;
            var check = db.Users.Where(m => m.Email == email || m.UserName == urname).FirstOrDefault();
            if (check != null)
            {
                TempData["Error"] = "User Name Already Exist ";
                return RedirectToAction("AddNewStaff");
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
            ur.PictuerPath = path;
            ur.BranchId = Convert.ToInt32(Session["Branchid"]);
            ur.CompanyId = Convert.ToInt32(Session["BranchCompanyid"]);
            ur.UserType = "Staff";
            ur.CreatDate = DateTime.Now.Date;
            ur.Status = true;
            db.Users.Add(ur);
            db.SaveChanges();

            return RedirectToAction("StaffList");
        }
        
        public ActionResult StaffList()
        {
            int id= Convert.ToInt32(Session["BranchCompanyid"]);
            return View(db.Users.Where(m =>m.CompanyId==id & m.UserType == "Staff").ToList());
        }
        public ActionResult Delete(int id)
        {
            var data = db.Users.Where(m => m.id == id).FirstOrDefault();
            if (data != null)
            {

                db.Users.Remove(data);
                db.SaveChanges();
            }
            return RedirectToAction("StaffList");
        }
    }
}