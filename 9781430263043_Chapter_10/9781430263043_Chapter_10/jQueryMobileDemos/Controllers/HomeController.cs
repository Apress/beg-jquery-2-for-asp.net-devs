using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using jQueryMobileDemos.Models;

namespace jQueryMobileDemos.Controllers
{
    public class HomeController : Controller
    {
        NorthwindEntities db = new NorthwindEntities();

        public ActionResult Index()
        {
            var data = from e in db.Employees
                       select e;
            return View(data.ToList());
        }

        public ActionResult Edit(int id)
        {
            var data = from e in db.Employees
                       where e.EmployeeID == id
                       select e;
            return View(data.SingleOrDefault());
        }

        [HttpPost]
        public ActionResult Update(Employee emp)
        {
            Employee existing = db.Employees.Find(emp.EmployeeID);
            existing.FirstName = emp.FirstName;
            existing.LastName = emp.LastName;
            existing.Address = emp.Address;
            existing.Country = emp.Country;
            existing.Notes = emp.Notes;
            //db.SaveChanges();
            return View();
        }
    }
}
