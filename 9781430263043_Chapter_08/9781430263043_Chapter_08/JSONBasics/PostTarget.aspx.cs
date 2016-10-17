using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using JSONBasics.Models;

namespace JSONBasics
{
    public partial class PostTarget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string country = Request.Form["Country"];
            string title = Request.Form["Designation"];

            NorthwindEntities db = new NorthwindEntities();

            var data = from emp in db.Employees
                       where emp.Country == country || emp.Title == title
                       select new EmployeeSearchResult{ EmployeeID=emp.EmployeeID, FirstName=emp.FirstName, LastName=emp.LastName};

            List<EmployeeSearchResult> list = data.ToList();

            Response.Clear();
            Response.Write(JsonConvert.SerializeObject(list));
            Response.Flush();
            Response.End();
        }
    }

}