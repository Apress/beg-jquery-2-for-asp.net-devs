using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace CallingPageMethodsUsingAjax
{
    public partial class PageMethodSimpleClient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static decimal ConvertSimpleType(decimal t, char scale)
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

    }
}