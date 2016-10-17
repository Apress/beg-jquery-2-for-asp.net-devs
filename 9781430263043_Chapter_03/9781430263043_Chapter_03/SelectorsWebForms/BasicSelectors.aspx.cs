using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SelectorsWebForms.Models;

namespace SelectorsWebForms
{
    public partial class BasicSelectors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<Employee> SelectEmployees()
        {
            NorthwindEntities db=new NorthwindEntities();
            var data = from e in db.Employees
                       orderby e.EmployeeID ascending
                       select e;
            return data.ToList();
        }
    }
}