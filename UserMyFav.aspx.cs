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
    public partial class UserMyFav : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["UserId"] != null)
                {
                    PopulateGridView();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
                
            }
        }
        void PopulateGridView()
        {

            DataTable dtbl = new DataTable();
            using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
            {
                con.Open();
                string emailCheck = Session["UserId"].ToString();
                SqlCommand cmd = new SqlCommand("select account_id from account where email_address='" + emailCheck + "'  ", con);

                int account_id = (int)cmd.ExecuteScalar();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select product.product_id as productID,image.image, product.product_name,product.product_price,brand.brand_name from product inner join image on image.product_id=product.product_id inner join brand on brand.brand_id=product.brand_id inner join favourite on product.product_id=favourite.product_id inner join account on account.account_id=favourite.account_id where favourite.account_id='" + account_id + "'  ", con);
                sqlDa.Fill(dtbl);

            }
            if (dtbl.Rows.Count > 0)
            {
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = "NO DATA FOUND...";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
                {
                    int product_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
                    string sql = "delFromFavTable";
                    SqlCommand cmd1 = new SqlCommand(sql, con);
                    con.Open();
                    cmd1.CommandType = CommandType.StoredProcedure;
                    SqlParameter para1 = new SqlParameter("product_id", product_id);
                    cmd1.Parameters.Add(para1);
                    cmd1.ExecuteNonQuery();
                    GridView1.EditIndex = -1;
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}