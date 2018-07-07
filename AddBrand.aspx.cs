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
        brand brand = new brand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserAdminId"] == null)
            {
                Response.Redirect("LoginAdmin.aspx");
            }
        }

        protected void BtnSaveBrand_Click(object sender, EventArgs e)
        {
            brand.brand_name = txtName.Text;
            brand.brand_detail = txtDetail.Text;
            addBrand();           
        }
        private void addBrand()
        {
            bool chck = checkBrand(brand.brand_name);
            if(chck==false)
            {
                try
                {
                    string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        con.Open();
                        SqlCommand cmd = con.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "insert into brand values('" + brand.brand_name + "','" + brand.brand_detail + "')";
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
            else
            {
                Label1.Text = "Brand already exist!! Cannot save the brand with duplicate name..";
            }
          
        }
      
        [System.Web.Services.WebMethod]
        public static bool checkBrand(string brand_name)
        {
            bool status = false;
            string constr = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("checkBrand", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@brand_name", brand_name.Trim());
                    conn.Open();
                    status = Convert.ToBoolean(cmd.ExecuteScalar());
                }
            }
            return status;
        }
    }
}
