using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelectorsWebForms
{
    public partial class AttributeSelectors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Download> items = new List<Download>();
            items.Add(new Download("SQL Server Backup Tool", "products/Product1.aspx"));
            items.Add(new Download("Visual Studio Add-In", "products/Product2.aspx"));
            items.Add(new Download("Understanding DNA Architecture", "Paper-Topic1.aspx"));
            items.Add(new Download("In-depth XML and JSON Serialization", "Paper-Topic2.aspx"));
            items.Add(new Download("Data Access Component", "Component1-comp.aspx"));
            items.Add(new Download("Mass Mailing Component", "Component2-comp.aspx"));

            GridView1.DataSource = items;
            GridView1.DataBind();
        }
    }
}