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
        TextBox tb;
        static int i = 0;
        product product = new product();
        image image = new image();
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
            using (SqlConnection con = new SqlConnection(CS))
            {
                //    product.product_name = txtName.Text;
                //    product.product_price = Convert.ToInt32(txtPrice.Text);
                //    product.product_detail = txtDetail.Text;
                //    product.brand_name = txtProductBrand.Text;
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                SqlCommand cmd2 = new SqlCommand("select brand_id from brand where brand_name='" + txtProductBrand.Text + "'", con);
                int brand_id = Convert.ToInt32(cmd2.ExecuteScalar());
                cmd.CommandText = "insert into product values('" + txtName.Text + "','" + txtDetail.Text + "','" + Convert.ToInt32(txtPrice.Text) + "','" + brand_id + "')";
                cmd.ExecuteNonQuery();


                SqlCommand cmd1 = new SqlCommand("select product_id from product where product_name='" + txtName.Text + "'", con);

                int product_id = (int)cmd1.ExecuteScalar();

                if (FileUpload1.HasFile)
                {
                    string strname = FileUpload1.FileName.ToString();
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + strname);
                    SqlCommand cmd3 = new SqlCommand("insert into image values ('~/images/" + strname + "','" + product_id + "')", con);
                    cmd3.ExecuteNonQuery();
                    Label1.Visible = true;
                    Label1.Text = " Uploaded successfully";
                    txtName.Text = "";
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "Plz upload the image!!!!";
                }
            }
        }

    }
}