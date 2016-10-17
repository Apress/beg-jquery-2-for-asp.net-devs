using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EffectsAnimations
{
    public partial class Accordion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Menu> list = new List<Menu>();
            list.Add(new Menu("ASP.NET"));
            list.Add(new Menu("Windows Forms"));
            list.Add(new Menu("C# Language"));

            Repeater1.DataSource = list;
            Repeater1.DataBind();
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType==ListItemType.AlternatingItem)
            {
                Label l = (Label)e.Item.FindControl("lblText");
                Panel p = (Panel)e.Item.FindControl("menuItemGroup");

                HyperLink l1 = new HyperLink();
                HyperLink l2 = new HyperLink();
                HyperLink l3 = new HyperLink();

                switch (l.Text)
                {
                    case "ASP.NET":
                        l1.Text="Web Forms";
                        l1.NavigateUrl = "~/webform.aspx";
                        l2.Text="MVC";
                        l2.NavigateUrl = "~/mvc.aspx";
                        l3.Text="Security";
                        l3.NavigateUrl = "~/security.aspx";
                        break;
                    case "Windows Forms":
                        l1.Text="Controls";
                        l1.NavigateUrl = "~/controls.aspx";
                        l2.Text="Forms & Windows";
                        l2.NavigateUrl = "~/forms.aspx";
                        l3.Text="Deployment";
                        l3.NavigateUrl = "~/deployment.aspx";
                        break;
                    case "C# Language":
                        l1.Text="Generics";
                        l1.NavigateUrl = "~/generics.aspx";
                        l2.Text="Async. Programming";
                        l2.NavigateUrl = "~/async.aspx";
                        l3.Text="Data Access";
                        l3.NavigateUrl = "~/data.aspx";
                        break;
                }

                p.Controls.Add(l1);
                p.Controls.Add(new LiteralControl("<br/>"));
                p.Controls.Add(l2);
                p.Controls.Add(new LiteralControl("<br/>"));
                p.Controls.Add(l3);

            }
        }
    }


    public class Menu
    {
        public Menu(string text)
        {
            this.Text = text;
        }
        public string Text { get; set; }
    }
}