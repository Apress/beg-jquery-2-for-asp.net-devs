using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace CallingWCFUsingAjax
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class TemperatureService
    {
        [OperationContract]
        public void DoWork()
        {
            return;
        }


        [OperationContract]
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


        [OperationContract]
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
