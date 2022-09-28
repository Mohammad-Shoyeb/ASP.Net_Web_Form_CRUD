using Diagonstic_Center.Reports;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Diagonstic_Center.DiagonisticCenterManagement
{
    public partial class TesttypesByTestPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Db"].ConnectionString))
            {
                using(SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Testtypes", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Testtypes");
                    da.SelectCommand.CommandText = "SELECT * FROM Tests";
                    da.Fill(ds, "Tests");
                    TesttypesByTestRpt rpt = new TesttypesByTestRpt();
                    rpt.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}