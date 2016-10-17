using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace CallingPageMethodsUsingAjax
{
    public partial class PageMethodComplexClient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }







        [WebMethod]
        public static TemperatureData ConvertComplexType(TemperatureData data)
        {
            TemperatureData resultData = new TemperatureData();
            switch (data.Scale)
            {
                case 'C':
                    resultData.Value = (data.Value * 1.8m) + 32;
                    resultData.Scale = 'F';
                    break;
                case 'F':
                    resultData.Value = (data.Value - 32) / 1.8m;
                    resultData.Scale = 'C';
                    break;
            }
            return resultData;
        }


    }
}