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
    public class BranchController : Controller
    {
        ServicesPortalApiEntities db = new ServicesPortalApiEntities();
        // GET: Branch
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AddNewBranch()
        {
           

            return View();
        }
        public ActionResult Bsave(Branch b)
        {

            string name = b.BranchName;

            var check = db.Branches.Where(m => m.BranchName == name).FirstOrDefault();
            if (check != null)
            {
                TempData["Error"] = "BranchName Already Exist ";
                return RedirectToAction("AddNewBranch");
            }
            else
            {
                b.CompanyID = Convert.ToInt32(Session["Cid"]);
                b.CreatedDate = DateTime.Now;
                db.Branches.Add(b);
                db.SaveChanges();
                return RedirectToAction("BranchiesList");
            }
            

    }
        public ActionResult BranchiesList()
        {
          int cid= Convert.ToInt32(Session["Cid"]);

            return View(db.Branches.Where(m=>m.CompanyID==cid).ToList());
        }
        public ActionResult NewUserB()
        {
            return View();
        }
        [HttpPost]
        public ActionResult BUSave(User ur)
        {
            string urname = ur.UserName;
            string email = ur.Email;
            var check = db.Users.Where(m => m.Email == email || m.UserName == urname).FirstOrDefault();
            if (check != null)
            {
                TempData["Error"] = "User Name Already Exist ";
                return RedirectToAction("NewUserB");
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
            int companyId = Convert.ToInt32(Session["Buid"]);
            int BranchId = Convert.ToInt32(Session["Bid"]);
            ur.PictuerPath = path;
            ur.UserType = "Branch";
            ur.CompanyId = companyId;
            ur.BranchId = BranchId;
            db.Users.Add(ur);
            db.SaveChanges();

            return RedirectToAction("BranchUser");
        }
        public ActionResult BranchUser1(int id, int bid)
        {
            Session["Buid"] = id;
            Session["Bid"] = bid;
            return RedirectToAction("BranchUser");
        }
        public ActionResult BranchUser()
        {
            int id = Convert.ToInt32(Session["Buid"]);
            int bid = Convert.ToInt32(Session["Bid"]);
            return View(db.Users.Where(m => m.CompanyId == id &(m.BranchId==bid & m.UserType == "Branch")).ToList());
        }
        public ActionResult Delete(int id)
        {
            var data = db.Users.Where(m => m.id == id).FirstOrDefault();
            if (data != null)
            {

                db.Users.Remove(data);
                db.SaveChanges();
            }
            return RedirectToAction("BranchUser");
        }
    }
}
