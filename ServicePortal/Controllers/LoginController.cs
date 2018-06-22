using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Mvc;
using ServicePortal.Models;
using ServicePortal.DAL;

namespace ServicePortal.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Login1(string user, string Password)
        {
            using (ServicesPortalApiEntities db = new ServicesPortalApiEntities())
            {

                var data = db.Users.Where(m => m.Password == Password && ( m.Email == user || m.UserName == user)).FirstOrDefault();
                if (data != null)
                {
                    if (data.UserType == "SuperAdmin")
                    {
                        Session[Shared.Current_Admin] = data;
                        Session["SAname"] = data.FullName;
                        Session["Type"] = data.UserType;
                        Session["img"] = data.PictuerPath;
                      return  RedirectToAction("Index", "SuperAdmin");
                    }
                    else if (data.UserType == "HeadOffice")
                    {
                        Session[Shared.Current_Admin] = data;
                        Session["Cid"] = data.CompanyId;
                        Session["HAname"] = data.FullName;
                        Session["HType"] = data.UserType;
                        Session["Himg"] = data.PictuerPath;
                        Session["Hlogo"] = data.Company.Logo;
                        return RedirectToAction("Index", "HeadOffice");
                    }
                    else if (data.UserType == "Branch")
                    {
                        Session[Shared.Current_Admin] = data;
                        Session["Branchid"] = data.BranchId;
                        Session["BranchCompanyid"] = data.CompanyId;
                        Session["BranchAdminname"] = data.FullName;
                        Session["BranchName"] = data.Branch.BranchName;
                        Session["Branchimg"] = data.PictuerPath;
                        Session["Branchlogo"] = data.Company.Logo;
                        return RedirectToAction("Index", "Branch");
                    }
                    else if (data.UserType == "Staff")
                    {
                        if(data.Status == false)
                        {
                            TempData["disable"] = "Your account has been disable";
                            return RedirectToAction("Login");
                        }
                        else { 
                        Session[Shared.Current_Admin] = data;
                        Session["StaffBranchid"] = data.BranchId;
                        Session["StaffCompanyid"] = data.CompanyId;
                        Session["Staffname"] = data.FullName;
                        Session["StaffBranchName"] = data.Branch.BranchName;
                        Session["Staffimg"] = data.PictuerPath;
                        Session["StaffCompanylogo"] = data.Company.Logo;
                        return RedirectToAction("Index", "Staff");
                        }
                    }
                    else {
                        TempData["Error"] = "Invalid User";
                        return RedirectToAction("Login");
                    }
                }
                else
                {

                    var d = db.Users.Where(m => m.Password == Password).FirstOrDefault();
                    if (d == null)
                    {
                        TempData["Error"] = "Enter Wrong Psssword";
                        return RedirectToAction("Login");
                    }
                    else
                    {
                        TempData["Error"] = "Enter Wrong UserName";
                        return RedirectToAction("Login");
                    }
                }
               
            }
        }

        public ActionResult ForgetPass()
        {
            return View();
        }


        public ActionResult ForgetPass1(string Email)
        {
            return RedirectToAction("ForgetPass");
            
        }

    }
}