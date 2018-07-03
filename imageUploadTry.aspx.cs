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
    public partial class imageUploadTry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
            {
                string path = "~\\images\\" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(path));
                con.Open();
                String sql = string.Format("insert into product values({0},'{1}','{2}','{3}',)", Txtcode.Text, Txtname.Text, Txtcost.Text, Txtdescr.Text);
                String insertImage = "insert into image values('" + path + "') where product_id=" + Txtcode;
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlCommand cmd1 = new SqlCommand(insertImage, con);
                
               cmd.ExecuteNonQuery();
               // cmd1.ExecuteNonQuery();
            }
            }
        }
    }