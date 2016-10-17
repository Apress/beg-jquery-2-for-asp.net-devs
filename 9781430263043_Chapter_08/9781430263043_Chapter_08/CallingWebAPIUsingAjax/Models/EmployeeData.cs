using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CallingWebAPIUsingAjax.Models
{
    public class EmployeeData
    {
        public int EmployeeID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime? BirthDate { get; set; }
        public DateTime? HireDate { get; set; }
        public string Country { get; set; }
    }
}