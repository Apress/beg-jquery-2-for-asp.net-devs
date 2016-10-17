using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using jQueryUIDemo.Models;


namespace jQueryUIDemo
{
    public partial class AccordionDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetNotes(int employeeid)
        {
            NorthwindEntities db = new NorthwindEntities();
            var data = from e in db.Employees
                       where e.EmployeeID == employeeid
                       select e.Notes;
            return data.SingleOrDefault();
        }

        public IQueryable Repeater1_GetData()
        {
            NorthwindEntities db = new NorthwindEntities();
            var data = from e in db.Employees
                       select new { e.EmployeeID,e.FirstName,e.LastName };
            return data;
        }
    }
}