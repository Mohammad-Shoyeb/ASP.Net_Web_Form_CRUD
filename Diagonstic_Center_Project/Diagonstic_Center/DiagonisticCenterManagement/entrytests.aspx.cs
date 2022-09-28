using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Diagonstic_Center.DiagonisticCenterManagement
{
    public partial class EntryTests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            e.Values["testid"] = (int)GridView1.SelectedValue;
        }
    }
}