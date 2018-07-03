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
    public partial class CRUDByAdmin : System.Web.UI.Page
    {
        product product = new product();

        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserAdminId"] == null)
            {
                Response.Redirect("LoginAdmin.aspx");
            }
            if (!IsPostBack)
            {
                PopulateGridView();


            }
        }
        void PopulateGridView()
        {

            DataTable dtbl = new DataTable();
            using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
            {
                con.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT product.product_id as productID,product.product_name,product.product_detail, product.product_price,brand.brand_name,image.image FROM product INNER JOIN image ON product.product_id = image.product_id INNER JOIN brand ON product.brand_id=brand.brand_id", con);
                sqlDa.Fill(dtbl);


            }
            if (dtbl.Rows.Count > 0)
            {
                ProductGridView.DataSource = dtbl;
                ProductGridView.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                ProductGridView.DataSource = dtbl;
                ProductGridView.DataBind();
                ProductGridView.Rows[0].Cells.Clear();
                ProductGridView.Rows[0].Cells.Add(new TableCell());
                ProductGridView.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                ProductGridView.Rows[0].Cells[0].Text = "NO DATA FOUND...";
                ProductGridView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }


        protected void ProductGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ProductGridView_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void ProductGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ProductGridView.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void ProductGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ProductGridView.EditIndex = -1;
            PopulateGridView();
        }

        protected void ProductGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
                {

                    int index = e.RowIndex;
                    GridViewRow row = (GridViewRow)ProductGridView.Rows[index];
                    con.Open();
                    FileUpload fu = (FileUpload)row.FindControl("FileUpload1");
                    Random rand = new Random((int)DateTime.Now.Ticks);
                    int numIterations = 0;
                    numIterations = rand.Next(1, 1000);
                    fu.SaveAs(Server.MapPath("~/images/") + numIterations + Path.GetFileName(fu.FileName));
                    String link = "images/" + numIterations + Path.GetFileName(fu.FileName);
                    int a = Convert.ToInt32(ProductGridView.DataKeys[e.RowIndex].Value.ToString());
                    
                    string brandName = (ProductGridView.Rows[e.RowIndex].FindControl("txtProductBrand") as DropDownList).Text;
                    SqlCommand cmd2 = new SqlCommand("select brand_id from brand where brand_name='" + brandName + "'", con);
                    int brand_id = Convert.ToInt32(cmd2.ExecuteScalar());

                    string query = "UPDATE product SET  product_name = @productName, product_detail = @productDetail,product_price = @productPrice,brand_id = @brand_id where product_id = @id";
                    String updatedata = "Update image set image='" + link + "' where product_id=" + a;
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlCommand cmd1 = new SqlCommand(updatedata, con);
                    cmd.Parameters.AddWithValue("@productName", (ProductGridView.Rows[e.RowIndex].FindControl("txtProductName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@productDetail", (ProductGridView.Rows[e.RowIndex].FindControl("txtProductDetail") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@productPrice", (ProductGridView.Rows[e.RowIndex].FindControl("txtProductPrice") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@brand_id", brand_id);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(ProductGridView.DataKeys[e.RowIndex].Value.ToString()));
                    cmd1.CommandText = updatedata;
                    cmd1.Connection = con;
                    cmd.ExecuteNonQuery();
                    cmd1.ExecuteNonQuery();
                    ProductGridView.EditIndex = -1;
                    PopulateGridView();
                    LblSuccessMsg.Text = " Selected row has been updated";
                    LblErrorMsg.Text = "";
                }

            }
            catch (Exception ex)
            {
                LblSuccessMsg.Text = "";
                LblErrorMsg.Text = ex.Message;
            }
        }

        protected void ProductGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
                {
                    int product_id = Convert.ToInt32(ProductGridView.DataKeys[e.RowIndex].Value.ToString());
                    string sql = "delFromProductTable";
                    SqlCommand cmd1 = new SqlCommand(sql, con);
                    con.Open();
                    cmd1.CommandType = CommandType.StoredProcedure;
                    SqlParameter para1 = new SqlParameter("product_id", product_id);
                    cmd1.Parameters.Add(para1);
                    cmd1.ExecuteNonQuery();
                    ProductGridView.EditIndex = -1;
                    PopulateGridView();
                    LblSuccessMsg.Text = " Selected row has been deleted";
                    LblErrorMsg.Text = "";

                }

            }
            catch (Exception ex)
            {
                LblSuccessMsg.Text = "";
                LblErrorMsg.Text = ex.Message;
            }
        }

        protected void ProductGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName.Equals("AddNew"))
                {

                    using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
                    {
                        con.Open();
                        string query = "INSERT INTO [product] VALUES(@productName,@productDetail,@productPrice,@brandName)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@productName", (ProductGridView.FooterRow.FindControl("txtProductNameFooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@productDetail", (ProductGridView.FooterRow.FindControl("txtProductDetailFooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@productPrice", (ProductGridView.FooterRow.FindControl("txtProductPriceFooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@brandName", (ProductGridView.FooterRow.FindControl("txtProductBrandFooter") as DropDownList).Text.Trim());
                        cmd.ExecuteNonQuery();

                        string product_name = (ProductGridView.FooterRow.FindControl("txtProductNameFooter") as TextBox).Text;
                        SqlCommand cmd1 = new SqlCommand("select product_id from product where product_name='" + product_name + "'  ", con);
                        int product_id = (int)cmd1.ExecuteScalar();




                        //for image upload
                        int rowIndex = Convert.ToInt32(e.CommandArgument);
                        GridViewRow row = ProductGridView.Rows[rowIndex];
                        FileUpload fu = (FileUpload)row.FindControl("FileUpload2");
                        string str = fu.FileName;
                        fu.PostedFile.SaveAs(Server.MapPath(".") + "//images//" + str);
                        string path = "~/images/" + str.ToString();
                        SqlCommand cmd2 = new SqlCommand("insert into image values('" + path + "','" + product_id + "')", con);
                        cmd2.ExecuteNonQuery();
                        PopulateGridView();
                        LblSuccessMsg.Text = "New record has been added";
                        LblErrorMsg.Text = "";
                    }
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