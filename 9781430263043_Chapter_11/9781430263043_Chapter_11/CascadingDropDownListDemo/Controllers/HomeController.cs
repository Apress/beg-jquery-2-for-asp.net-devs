using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CascadingDropDownListDemo.Models;

namespace CascadingDropDownLists.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            CountryStateDbEntities db = new CountryStateDbEntities();
            var data = from c in db.Countries
                       orderby c.CountryName ascending
                       select c;
            List<Country> items = data.ToList();
            items.Insert(0, new Country() {CountryId=-1,CountryName="Please Select" });
            SelectList countries = new SelectList(items,"CountryId","CountryName");
            ViewData["countries"] = countries;
            return View();
        }


        public JsonResult GetStates(int countryid)
        {
            CountryStateDbEntities db=new CountryStateDbEntities();
            List<string> states = new List<string>();
            var data = from s in db.States
                       where s.CountryId == countryid
                       orderby s.StateName ascending
                       select new { s.StateId, s.StateName };
            return Json(data.ToList());
        }

    }
}
