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

namespace Test1
{
    public partial class AdminAddProduct : System.Web.UI.Page
    {
        product product = new product();
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    using (SqlConnection con = new SqlConnection(CS))
        //    {
        //        product.product_name = txtName.Text;
        //        con.Open();
        //        SqlCommand cmd = con.CreateCommand();
        //        cmd.CommandType = CommandType.Text;
        //        cmd.CommandText="insert into product values('"+ txtName.Text+"','"+ txtPrice.Text);
        //    }
        //}
    }
}