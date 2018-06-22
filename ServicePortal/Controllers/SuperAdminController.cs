﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServicePortal.Models;
using ServicePortal.DAL;

namespace ServicePortal.Controllers
{
    [IsLogin]
    public class SuperAdminController : Controller
    {

        ServicesPortalApiEntities db = new ServicesPortalApiEntities();
        // GET: SuperAdmin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AddNewAdmin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SASave(User ur)
        {
            string urname = ur.UserName;
            string email = ur.Email;
            var check = db.Users.Where(m => m.Email == email || m.UserName == urname).FirstOrDefault();
            if (check != null)
            {
                TempData["Error"] = "User Name Already Exist ";
                return RedirectToAction("AddNewAdmin");
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
            ur.UserType = "SuperAdmin";
            ur.CompanyId = 1;
            db.Users.Add(ur);
            db.SaveChanges();

            return RedirectToAction("AdminList");
        }
        public ActionResult AdminList()
        {
            return View(db.Users.Where(m=>m.UserType=="SuperAdmin").ToList());
        }
        public ActionResult Delete(int id)
        {
            var data = db.Users.Where(m => m.id == id).FirstOrDefault();
            if (data != null)
            {

                db.Users.Remove(data);
                db.SaveChanges();
            }
            return RedirectToAction("AdminList");
        }
    }
}