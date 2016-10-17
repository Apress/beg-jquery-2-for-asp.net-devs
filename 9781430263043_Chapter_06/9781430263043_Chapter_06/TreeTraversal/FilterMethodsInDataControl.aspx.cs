using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TreeTraversal
{
    public partial class FilterMethodsInDataControl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[3].Text == "USA")
                {
                    e.Row.Cells[3].CssClass = "HighlightCountry";
                }
                else
                {
                    e.Row.Cells[3].CssClass = "OtherCountry";
                }
            }
        }
    }
}