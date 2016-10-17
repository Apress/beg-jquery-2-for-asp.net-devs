using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace JSONBasics
{
    public partial class JsonDotNet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string strJson = "{\"Name\":\"Andrew\",\"Age\":45}";
            //Employee emp= JsonConvert.DeserializeObject<Employee>(strJson);

            //string strJsonArray = "[{\"Name\":\"Nancy\",\"Age\":35},{\"Name\":\"Andrew\",\"Age\":45}]";
            //List<Employee> empList = JsonConvert.DeserializeObject<List<Employee>>(strJsonArray);

            //Employee emp2 = new Employee();
            //emp2.Name = "Nancy";
            //emp2.Age = 35;
            //string strJson2 = JsonConvert.SerializeObject(emp2);

            //Response.Write(strJson2);
        }
    }

}