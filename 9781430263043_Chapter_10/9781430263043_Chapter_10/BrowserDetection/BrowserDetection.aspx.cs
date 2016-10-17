using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jQueryMobileWebForms
{
    public partial class BrowserDetection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label6.Text = Request.Browser.IsMobileDevice.ToString();
            Label7.Text = Request.Browser.MobileDeviceManufacturer;
            Label8.Text = Request.Browser.MobileDeviceModel;
            Label9.Text = Request.Browser.ScreenPixelsHeight.ToString();
            Label10.Text = Request.Browser.ScreenPixelsWidth.ToString();
        }
    }
}