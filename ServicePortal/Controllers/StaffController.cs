using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ServicePortal.DAL;

namespace ServicePortal.Controllers
{
    public class StaffController : Controller
    {
        [IsLogin]
        // GET: Staff
        public ActionResult Index()
        {
            return View();
        }
    }
}