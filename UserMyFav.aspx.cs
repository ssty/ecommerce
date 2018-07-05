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
        string emailCheck;
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
                emailCheck = Session["UserId"].ToString();
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string Search = txtSearch.Text;
            searchFxn(Search, null);
        }
        protected void searchFxn(string Search, string i)
        {
            if (Search != null)
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    emailCheck = Session["UserId"].ToString();
                    SqlCommand cmd2 = new SqlCommand("select account_id from account where email_address='" + emailCheck + "'  ", con);
                    int account_id = (int)cmd2.ExecuteScalar();

                    SqlCommand cmd1 = new SqlCommand("SELECT image.image,product.product_id,product.product_name,brand.brand_name,product.product_detail,product.product_price,brand.brand_detail FROM image INNER JOIN product ON image.product_id=product.product_id  INNER JOIN brand ON brand.brand_id=product.brand_id", con);
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                    DataTable ds = new DataTable();
                    if (i == null)
                    {
                        SqlCommand cmd = new SqlCommand("spProductSearchINfAV", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlParameter searchParameter = new SqlParameter("@SearchTerm", Search);
                        SqlParameter accounT = new SqlParameter("@account_id", account_id);
                        cmd.Parameters.Add(searchParameter);
                        cmd.Parameters.Add(accounT);                        
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(ds);
                    }
                    else if (Search == "0")
                    {
                        SqlCommand cmd = new SqlCommand("[spBrandSearchINfAV]", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlParameter searchParameter = new SqlParameter("@SearchTerm", i);
                        SqlParameter accounT = new SqlParameter("@account_id", account_id);
                        cmd.Parameters.Add(searchParameter);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        cmd.Parameters.Add(accounT);
                        da.Fill(ds);
                    }
                    if (ds.Rows.Count > 0)
                    {
                        GridView1.DataSource = ds;
                        GridView1.DataBind();
                    }
                    else
                    {
                        ds.Rows.Add(ds.NewRow());
                        GridView1.DataSource = ds;
                        GridView1.DataBind();
                        GridView1.Rows[0].Cells.Clear();
                        GridView1.Rows[0].Cells.Add(new TableCell());
                        GridView1.Rows[0].Cells[0].ColumnSpan = ds.Columns.Count;
                        GridView1.Rows[0].Cells[0].Text = "NO DATA FOUND...";
                        GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    }
                }
            }
        }

        protected void btnBrandSearch_Click(object sender, EventArgs e)
        {
            string Search = txtBrandSearch.Text;
            searchFxn("0", Search);
        }
    }
}