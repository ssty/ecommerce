using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Web.UI.DataVisualization.Charting;

namespace Test1
{
    public partial class AdminChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetChartData();
                GetChartTypes();
            }
        }

        private void GetChartData()
        {
            string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT product_name,(SELECT COUNT(DISTINCT account_id) AS Expr1 FROM favourite WHERE (product_id = temp.product_id)) AS Total_likes FROM product AS temp", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                Series series = Chart1.Series["Series1"];
                while (rdr.Read())
                {
                    // Add X and Y values using AddXY() method
                    series.Points.AddXY(rdr["product_name"].ToString(), rdr["Total_likes"]);
                }
            }
        }

        private void GetChartTypes()
        {
            foreach (int chartType in Enum.GetValues(typeof(SeriesChartType)))
            {
                ListItem li = new ListItem(Enum.GetName(typeof(SeriesChartType),chartType), chartType.ToString());
                DropDownList1.Items.Add(li);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetChartData();
            this.Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownList1.SelectedValue);
        }

        protected void Chart1_Load(object sender, EventArgs e)
        {

        }
    }
}

