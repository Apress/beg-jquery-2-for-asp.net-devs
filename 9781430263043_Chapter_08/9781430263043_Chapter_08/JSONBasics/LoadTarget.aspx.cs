using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JSONBasics.Models;

namespace JSONBasics
{
    public partial class AdMarkup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string country=Request.Form["Country"];
            string title = Request.Form["Designation"];


            NorthwindEntities db = new NorthwindEntities();

            var data = from emp in db.Employees
                       where emp.Country == country || emp.Title == title
                       select emp;

            Response.Clear();
            Response.Write("<table border='1' cellpadding='6'>");
            foreach (var obj in data)
            {
                Response.Write("<tr><td>" + obj.FirstName + "</td><td>" + obj.LastName + "</td></tr>");
            }
            Response.Write("</table>");
            Response.Flush();
            Response.End();
        }
    }
}