using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Test1
{
    public partial class adminProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connnectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connnectionstring))
            {
                string sql = "select product_name as Product, product_detail as Description,product_price as Price from product";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}