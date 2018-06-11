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
    public partial class ImageView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mycon = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            string myquery = "select image from image inner join product on image.product_id=product.product_id";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }
    }
}
