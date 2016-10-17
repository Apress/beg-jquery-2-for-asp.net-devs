using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CallingWebAPIUsingAjax.Models;

namespace CallingWebAPIUsingAjax.Controllers
{
    public class EmployeesController : ApiController
    {
        NorthwindEntities db = new NorthwindEntities();

        public List<EmployeeData> GetEmployees()
        {
            var data = from e in db.Employees
                       orderby e.EmployeeID
                       select new EmployeeData { EmployeeID=e.EmployeeID,FirstName=e.FirstName,LastName=e.LastName,BirthDate=e.BirthDate,HireDate=e.HireDate,Country=e.Country };
            List<EmployeeData> list = data.ToList();
            return list;
        }

        public EmployeeData GetEmployeeByID(int id)
        {
            Employee emp = db.Employees.Find(id);
            EmployeeData empData = new EmployeeData();
            empData.EmployeeID = emp.EmployeeID;
            empData.FirstName = emp.FirstName;
            empData.LastName = emp.LastName;
            empData.BirthDate = emp.BirthDate;
            empData.HireDate = emp.HireDate;
            empData.Country = emp.Country;
            return empData;
        }

        public string PostEmployee(EmployeeData empData)
        {
            Employee emp = new Employee();
            emp.EmployeeID = empData.EmployeeID;
            emp.FirstName = empData.FirstName;
            emp.LastName = empData.LastName;
            emp.BirthDate = empData.BirthDate;
            emp.HireDate = empData.HireDate;
            emp.Country = empData.Country;
            db.Employees.Add(emp);
            db.SaveChanges();
            return "Employee added successfully!";
        }

        public string PutEmployee(int id, EmployeeData empData)
        {
            Employee emp = db.Employees.Find(id);
            emp.FirstName = empData.FirstName;
            emp.LastName = empData.LastName;
            emp.BirthDate = empData.BirthDate;
            emp.HireDate = empData.HireDate;
            emp.Country = empData.Country;
            db.SaveChanges();
            return "Employee updated successfully!";
        }

        public string DeleteEmployee(int id)
        {
            Employee emp = db.Employees.Find(id);
            db.Employees.Remove(emp);
            db.SaveChanges();
            return "Employee deleted successfully!";
        }
    }
}