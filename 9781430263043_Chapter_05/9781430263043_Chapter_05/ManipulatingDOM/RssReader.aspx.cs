using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.ServiceModel.Syndication;

namespace ManipulatingDOM
{
    public partial class RssReader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.QueryString["feedUrl"];
            XmlReader reader = XmlReader.Create(url);
            Rss20FeedFormatter formatter = new Rss20FeedFormatter();
            formatter.ReadFrom(reader);
            reader.Close();
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "text/xml";
            XmlWriter rssWriter = XmlWriter.Create(Response.Output);
            formatter.WriteTo(rssWriter);
            rssWriter.Close();
            Response.End();

        }
    }
}