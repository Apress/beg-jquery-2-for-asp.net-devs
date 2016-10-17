using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace CallingASMXUsingAjax
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class TemperatureService : System.Web.Services.WebService
    {
       
        [WebMethod]
        public decimal ConvertSimpleType(decimal t, char scale)
        {
            switch (scale)
            {
                case 'C':
                    t = (t * 1.8m) + 32;
                    break;
                case 'F':
                    t = (t - 32) / 1.8m;
                    break;
            }
            return t;
        }


        [WebMethod]
        public TemperatureData ConvertComplexType(TemperatureData data)
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
