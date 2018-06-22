using ServicePortal.DAL;
using ServicePortal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Filters;
using System.Web.Mvc;
using System.Web.Routing;

namespace ServicePortal.DAL
{
    public class IsLogin : System.Web.Mvc.ActionFilterAttribute
    {
        public string controller { get; set; }
        public string Action { get; set; }
        public string Code { get; set; }
        public string Return { get; set; }
        public bool CheckPermission = true;
        private bool IsAjax(ActionExecutingContext filterContext)
        {
            return filterContext.HttpContext.Request.Headers["X-Requested-With"] == "XMLHttpRequest";
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            var Us = HttpContext.Current.Session[Shared.Current_Admin] as User;


            var Request = filterContext.HttpContext.Request;
            string RequestUrl = filterContext.HttpContext.Request.RawUrl;



            if (Return == "NoCheck")
            {
                goto Execute;
            }
            if (Us == null)
            {
                if (Return == "")
                {
                    filterContext.Result = new EmptyResult();
                }
                else if (IsAjax(filterContext))
                {
                    filterContext.Result = new JsonResult()
                    {
                        Data = "session expired",
                        JsonRequestBehavior = JsonRequestBehavior.AllowGet
                    };
                    filterContext.HttpContext.Response.Clear();
                }

                else if (Return == "login")
                {
                    filterContext.Result = new RedirectToRouteResult(
                             new RouteValueDictionary(
                            new { controller = "Login", action = "Login", area = "" }));
                }
                else
                {
                    #region check If id Exist

                    filterContext.Result = new RedirectToRouteResult(
                       new RouteValueDictionary(
                      new { controller = "Login", action = "Login", area = "" }));
                    HttpContext.Current.Session["PrevUrl"] = RequestUrl;

                    #endregion


                }


            }
            else
            {

                filterContext.Controller.ViewBag.UserType = Us.UserType;
                filterContext.Controller.ViewBag.UserId = Us.id;
                filterContext.Controller.ViewBag.CompanyId = Us.CompanyId;
                filterContext.Controller.ViewBag.UserName = Us.UserName;


            }
        Execute:
            base.OnActionExecuting(filterContext);

        }



    }
}