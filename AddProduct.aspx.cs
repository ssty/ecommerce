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
    public partial class AddProduct : System.Web.UI.Page
    {
        product product = new product();
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserAdminId"] == null)
            {
                Response.Redirect("LoginAdmin.aspx");
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            product.product_name = txtName.Text;
            product.product_price = Convert.ToInt32(txtPrice.Text);
            product.product_detail = txtDetail.Text;
            product.brand_name = txtProductBrand.Text;
            addProduct(product);

        }
        private void addProduct(product product)
        {
            bool chck = checkProduct(product.product_name);
            if (chck == false)
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        con.Open();
                        SqlCommand cmd = con.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        SqlCommand cmd2 = new SqlCommand("select brand_id from brand where brand_name='" + product.brand_name + "'", con);
                        int brand_id = Convert.ToInt32(cmd2.ExecuteScalar());
                        cmd.CommandText = "insert into product values('" + product.product_name + "','" + product.product_detail + "','" + product.product_price + "','" + brand_id + "')";
                        cmd.ExecuteNonQuery();
                        SqlCommand cmd1 = new SqlCommand("select product_id from product where product_name='" + product.product_name + "'", con);
                        int product_id = (int)cmd1.ExecuteScalar();
                        if (FileUpload1.HasFile)
                        {
                            string strname = FileUpload1.FileName.ToString();
                            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + strname);
                            SqlCommand cmd3 = new SqlCommand("insert into image values ('~/images/" + strname + "','" + product_id + "')", con);
                            cmd3.ExecuteNonQuery();
                            Label2.Visible = true;
                            Label2.Text = " Uploaded successfully";
                            txtName.Text = "";
                        }
                        else
                        {
                            Label1.Visible = true;
                            Label1.Text = "Plz upload the image!!!!";
                        }
                    }
                }
                catch (Exception ex)
                {
                    Label1.Text = "";
                    Label1.Text = ex.Message;
                }
            }
            else
            {
                Label1.Text = "Product already exist!! Cannot save the product with duplicate name..";
            }
        }
        [System.Web.Services.WebMethod]
        public static bool checkProduct(string product_name)
        {
            bool status = false;
            string constr = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("checkProduct", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@product_name", product_name.Trim());
                    conn.Open();
                    status = Convert.ToBoolean(cmd.ExecuteScalar());
                }
            }
            return status;
        }

    }
}