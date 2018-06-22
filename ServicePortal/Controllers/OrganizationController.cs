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
    public class OrganizationController : Controller
    {
        // GET: Organization
        ServicesPortalApiEntities db = new ServicesPortalApiEntities();

            public ActionResult Index()
            {
                return View();
            }
            public ActionResult NewOrgnization(int id=0)
            {
            if (id > 0) { 
            var data = db.Organizations.Where(m => m.id == id).FirstOrDefault();
                return View(data);
            }
            else { 
            return View();
            }
        }
            [HttpPost]
            public ActionResult OrgnizationSave(Organization O)
            {
            if (O.id > 0)
            {
                OrganizationHandler.Update(O.id, O);
          
                return RedirectToAction("ListOrgnanization");

            }

                string cname = O.OrganizaationName;

                var check = db.Organizations.Where(m => m.OrganizaationName == cname).FirstOrDefault();
                if (check != null)
                {
                    TempData["Error"] = "Organization Name Already Exist ";
                    return RedirectToAction("NewOrgnization");
                }
                O.CompanyId= Convert.ToInt32(Session["BranchCompanyid"]);
                O.BranchId= Convert.ToInt32(Session["Branchid"]);
                O.CreatedBy = Convert.ToString(Session["BranchName"]);
                O.CreatedDate = DateTime.Now;
                O.Status = true;
                db.Organizations.Add(O);
                db.SaveChanges();
                return RedirectToAction("ListOrgnanization");
            }
            public ActionResult ListOrgnanization()
            {
            int cID=  Convert.ToInt32(Session["BranchCompanyid"]);
            int bID=  Convert.ToInt32(Session["Branchid"]);
            return View(db.Organizations.Where(m => m.BranchId==bID & m.CompanyId==cID).ToList());
            }
            public ActionResult DocList(int id)
            {
                return View();
            }
            //[HttpPost]
            //public ActionResult CUSave(User ur)
            //{
            //    string urname = ur.UserName;
            //    string email = ur.Email;
            //    var check = db.Users.Where(m => m.Email == email || m.UserName == urname).FirstOrDefault();
            //    if (check != null)
            //    {
            //        TempData["Error"] = "User Name Already Exist ";
            //        return RedirectToAction("NewUserC");
            //    }
            //    string path = null;
            //    if (Request.Files != null && Request.Files.Count > 0)
            //    {

            //        foreach (string f in Request.Files)
            //        {
            //            HttpPostedFileBase file = Request.Files[f];
            //            if (file.FileName == "")
            //            {
            //                path = "/Files/user.jpg";
            //            }
            //            else
            //            {
            //                string webpath = "/Files/" + DateTime.Now.Ticks + file.FileName.Substring(file.FileName.LastIndexOf("."));
            //                file.SaveAs(Request.MapPath(webpath)); //physical path is required to save a file
            //                path = webpath;
            //            }
            //        }
            //    }
            //    int a = Convert.ToInt32(Session["uid"]);
            //    ur.PictuerPath = path;
            //    ur.UserType = "HeadOffice";
            //    ur.CompanyId = a;
            //    db.Users.Add(ur);
            //    db.SaveChanges();

            //    return RedirectToAction("CompanyUser");
            //}
            //public ActionResult CompanyUser1(int id)
            //{
            //    Session["uid"] = id;
            //    return RedirectToAction("CompanyUser");
            //}
            //public ActionResult CompanyUser()
            //{
            //    int id = Convert.ToInt32(Session["uid"]);
            //    return View(db.Users.Where(m => m.CompanyId == id & m.UserType == "HeadOffice").ToList());
            //}
            //public ActionResult Delete(int id)
            //{
            //    var data = db.Users.Where(m => m.id == id).FirstOrDefault();
            //    if (data != null)
            //    {

            //        db.Users.Remove(data);
            //        db.SaveChanges();
            //    }
            //    return RedirectToAction("CompanyUser");
            //}
        }
       
    }
