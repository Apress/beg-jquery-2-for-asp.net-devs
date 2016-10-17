using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCSelectors.Models;
using System.Net.Mail;


namespace MVCSelectors.Controllers
{
    public class HomeController : Controller
    {
      
        public ActionResult Index()
        {
            List<string> reasons = new List<string>();
            reasons.Add("Please select");
            reasons.Add("General Feedback");
            reasons.Add("Billing related");
            reasons.Add("Technical query");
            SelectList list = new SelectList(reasons);
            ViewData["Reason"] = list;
            return View();
        }


        public ActionResult ProcessForm(ContactForm data)
        {
            string msg = "";
            msg += data.Message + "\n\n";
            msg += "--" + data.FirstName + " " + data.LastName + "\n\n";

            SmtpClient client = new SmtpClient();
            client.Send(data.Email, "admin@somewebsite.com", data.Subject, msg);

            return View();
        }

  
    }
}
