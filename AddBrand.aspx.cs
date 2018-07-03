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
    public partial class AddBrand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserAdminId"] == null)
            {
                Response.Redirect("LoginAdmin.aspx");
            }
        }

        protected void BtnSaveBrand_Click(object sender, EventArgs e)
        {
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "insert into brand values('" + txtName.Text + "','" + txtDetail.Text + "')";
                    cmd.ExecuteNonQuery();
                    LblSuccessMsg.Text = "Brand has been added to database";
                    LblErrorMsg.Text = "";
                }
            }
            catch (Exception ex)
            {
                LblSuccessMsg.Text = "";
                LblErrorMsg.Text = ex.Message;
            }
        }
    }
}
