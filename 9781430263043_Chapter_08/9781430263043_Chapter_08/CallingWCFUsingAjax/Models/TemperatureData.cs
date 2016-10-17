using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace CallingWCFUsingAjax
{
    public class TemperatureData
    {
        public decimal Value { get; set; }
        public char Scale { get; set; }
    }
}