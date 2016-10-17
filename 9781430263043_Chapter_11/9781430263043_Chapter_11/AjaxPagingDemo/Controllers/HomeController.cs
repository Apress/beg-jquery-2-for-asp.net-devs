using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AjaxPagingDemo.Models;

namespace AjaxPagingDemo.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult IndexSorted()
        {
            NorthwindEntities db = new NorthwindEntities();
            var data = from e in db.Employees
                       orderby e.EmployeeID ascending
                       select e;
            return View(data.ToList());
        }

        [HttpPost]
        public JsonResult GetPageData(int pageIndex, int pageSize)
        {
            NorthwindEntities db = new NorthwindEntities();
            var data = (from e in db.Employees
                        orderby e.EmployeeID
                        select new {e.EmployeeID,e.FirstName,e.LastName,e.Title,e.Country }).Skip(pageIndex * pageSize).Take(pageSize);
            return Json(data);
        }


        [HttpPost]
        public JsonResult GetTotalRows()
        {
            NorthwindEntities db = new NorthwindEntities();
            return Json(db.Employees.Count());
        }
    }
}
