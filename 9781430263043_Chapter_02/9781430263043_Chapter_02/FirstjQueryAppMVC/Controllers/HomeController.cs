using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FirstjQueryAppMVC.Models;
using System.Text;

namespace FirstjQueryAppMVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public string GetEmployeeTable()
        {
            NorthwindEntities db = new NorthwindEntities();
            var data = from e in db.Employees
                       orderby e.EmployeeID
                       select e;

            StringBuilder sb = new StringBuilder();
            sb.Append("<table border='1'>");
            foreach (Employee e in data)
            {
                sb.Append("<tr><td>");
                sb.Append(e.EmployeeID);
                sb.Append("</td><td>");
                sb.Append(e.FirstName);
                sb.Append("</td><td>");
                sb.Append(e.LastName);
                sb.Append("</td></tr>");
            }
            sb.Append("</table>");
            return sb.ToString();
        }

	}
}