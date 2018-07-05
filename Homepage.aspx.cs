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
    public partial class Homepage : System.Web.UI.Page
    {
        product product = new product();
        account account = new account();
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
                {
                        Label1.Text = "Your account has been successfully deactivated!!";
                
                }
                BindGridview();
            }
        }
        protected void BindGridview()
        {
            DataSet ds = new DataSet();
            string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT image.image,product.product_id,product.product_name,brand.brand_name,product.product_detail,product.product_price,brand.brand_detail FROM image INNER JOIN product ON image.product_id=product.product_id  INNER JOIN brand ON brand.brand_id=product.brand_id", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
            }

            gvDetails.DataSource = ds;
            gvDetails.DataBind();

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            {
                string Search = txtSearch.Text;
                searchFxn(Search, null);

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }


        protected void gvDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Select")
            {
                if (Session["UserId"] == null)
                {
                    Response.Write("<script>alert('You must login first');</script>");
                }
                else
                {
                    //Determine the RowIndex of the Row whose Button was clicked.
                    int rowIndex = Convert.ToInt32(e.CommandArgument);


                    //Fetch value of Name.
                    string product_id = gvDetails.Rows[rowIndex].Cells[1].Text;
                    string product_name = gvDetails.Rows[rowIndex].Cells[2].Text;
                    try
                    {
                        using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
                        {
                            string emailCheck = Session["UserId"].ToString();
                            string sql = "addToFav";
                            SqlCommand cmd1 = new SqlCommand(sql, con);
                            SqlCommand cmd = new SqlCommand("select account_id from account where email_address='" + emailCheck + "'  ", con);
                            con.Open();
                            int account_id = (int)cmd.ExecuteScalar();

                            string sql1 = "FavCheck";
                            SqlCommand cmd2 = new SqlCommand(sql1, con);
                            cmd2.CommandType = CommandType.StoredProcedure;
                            SqlParameter param1 = new SqlParameter("product_id", product_id);
                            SqlParameter param2 = new SqlParameter("account_id ", account_id);
                            cmd2.Parameters.Add(param1);
                            cmd2.Parameters.Add(param2);
                            SqlDataReader rdr = cmd2.ExecuteReader();
                            //int rdr = (int)cmd2.ExecuteScalar();
                            //if (rdr == 1)
                            //{
                            //    LblErrorMsg.Text = "This product has already been added to favourite list!!";
                            //    LblSuccessMsg.Text = "";
                            //}
                            //else
                            //{
                            if (rdr.HasRows)
                            {
                                rdr.Read();
                                LblErrorMsg.Text = "This product has already been added to favourite list!!";
                                LblSuccessMsg.Text = "";
                            }
                            else
                            {
                                cmd1.CommandType = CommandType.StoredProcedure;
                                SqlParameter para1 = new SqlParameter("product_name", product_name);
                                SqlParameter para2 = new SqlParameter("account_id ", account_id);
                                cmd1.Parameters.Add(para1);
                                cmd1.Parameters.Add(para2);
                                cmd1.ExecuteNonQuery();
                                LblSuccessMsg.Text = "Product has been added to favourite list";
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


        protected void btnBrandSearch_Click1(object sender, EventArgs e)
        {
            string Search = txtBrandSearch.Text;
            searchFxn("0", Search);
        }
        protected void searchFxn(string Search, string i)
        {
            if (Search != null)
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd1 = new SqlCommand("SELECT image.image,product.product_id,product.product_name,brand.brand_name,product.product_detail,product.product_price,brand.brand_detail FROM image INNER JOIN product ON image.product_id=product.product_id  INNER JOIN brand ON brand.brand_id=product.brand_id", con);
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                    DataTable ds = new DataTable();
                    if (i == null)
                    {
                        SqlCommand cmd = new SqlCommand("spSearch", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlParameter searchParameter = new SqlParameter("@SearchTerm", Search);
                        cmd.Parameters.Add(searchParameter);
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(ds);
                    }
                    else if (Search == "0")
                    {
                        SqlCommand cmd = new SqlCommand("[spBrandSearch]", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlParameter searchParameter = new SqlParameter("@SearchTerm", i);
                        cmd.Parameters.Add(searchParameter);
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(ds);
                    }
                    if (ds.Rows.Count > 0)
                    {
                        gvDetails.DataSource = ds;
                        gvDetails.DataBind();
                    }
                    else
                    {
                        ds.Rows.Add(ds.NewRow());
                        gvDetails.DataSource = ds;
                        gvDetails.DataBind();
                        gvDetails.Rows[0].Cells.Clear();
                        gvDetails.Rows[0].Cells.Add(new TableCell());
                        gvDetails.Rows[0].Cells[0].ColumnSpan = ds.Columns.Count;
                        gvDetails.Rows[0].Cells[0].Text = "NO DATA FOUND...";
                        gvDetails.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    }
                }
            }
        }

        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDetails.PageIndex = e.NewPageIndex;
            BindGridview();
        }
    }
}
