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
    public partial class insertSelect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
             //-----------------------for dropdown---------------
            //string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
            //{
            //   SqlCommand cmd = new SqlCommand("Select brand_id,brand_name,brand_detail from brand", con);
            //   con.Open();
            //    txtBrandName.DataSource = cmd.ExecuteReader();
            //    txtBrandName.DataTextField = "brand_name";
            //    txtBrandName.DataValueField = "brand_id";
            //    txtBrandName.DataBind();
            //}

            product A = new product();
            A.product_name = txtProduct.Text;
            A.product_detail = txtProductDetails.Text;
            A.product_price = int.Parse(txtProductPrice.Text);
            A.brand_id = int.Parse(txtBrandName.Text);
            A.type_id = int.Parse(txtProductType.Text);
            insertProduct(A);
        }
        private void insertProduct(product a)
        {
            product Product = new product();
            Product.product_name = a.product_name;
            Product.product_detail = a.product_detail;
            Product.product_price = a.product_price;
            Product.brand_id = a.brand_id;
            Product.type_id = a.type_id;            
            using (ecommerceEntities db = new ecommerceEntities())
            {
                db.products.Add(Product);
                db.SaveChanges();
            }

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
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
    }
}