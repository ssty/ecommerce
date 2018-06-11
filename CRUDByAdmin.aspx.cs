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
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        public product prd { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT product.product_id as productID,product.product_name,product.product_detail, product.product_price,product.brand_name,image.image FROM product INNER JOIN image ON product.product_id = image.product_id", con);
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
                    string query = "UPDATE product SET  product_name = @productName, product_detail = @productDetail,product_price = @productPrice,brand_name = @brandName where product_id = @id";
                    String updatedata = "Update image set image='" + link + "' where product_id=" +a;
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlCommand cmd1 = new SqlCommand(updatedata, con);
                    cmd.Parameters.AddWithValue("@productName", (ProductGridView.Rows[e.RowIndex].FindControl("txtProductName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@productDetail", (ProductGridView.Rows[e.RowIndex].FindControl("txtProductDetail") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@productPrice", (ProductGridView.Rows[e.RowIndex].FindControl("txtProductPrice") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@brandName", (ProductGridView.Rows[e.RowIndex].FindControl("txtProductBrand") as DropDownList).Text.Trim());
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
                    con.Open();
                    string query = "DELETE FROM product WHERE product_id=@id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(ProductGridView.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    ProductGridView.EditIndex = -1;
                    PopulateGridView();
                    LblSuccessMsg.Text = " Selected row has been deleted";
                    LblErrorMsg.Text = "";

                }

            }
            catch (Exception ex)
            {
                LblSuccessMsg.Text = "";
                LblErrorMsg.Text = "ex.msg";
            }
        }

        protected void Image1_Click(object sender, EventArgs e)
        {

            Response.Redirect("ImageView.aspx");

            
        }
    }

}