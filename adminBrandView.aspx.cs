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
    public partial class adminBrandView : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT brand_id as brandID,brand_name,brand_detail FROM brand", con);
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
                    int brand_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
                    string sql = "delFromBrandTable";
                    SqlCommand cmd1 = new SqlCommand(sql, con);
                    con.Open();
                    cmd1.CommandType = CommandType.StoredProcedure;
                    SqlParameter para1 = new SqlParameter("brand_id", brand_id);
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

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
                {
                    con.Open();
                    string query = "UPDATE brand SET  brand_name = @brandName, brand_detail = @brandDetail where brand_id = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@brandName", (GridView1.Rows[e.RowIndex].FindControl("txtBrandName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@brandDetail", (GridView1.Rows[e.RowIndex].FindControl("txtBrandDetail") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    GridView1.EditIndex = -1;
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

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            PopulateGridView();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName.Equals("AddNew"))
                {

                    using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
                    {
                        con.Open();
                        string query = "INSERT INTO [brand] VALUES(@brandName,@brandDetail)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@brandName", (GridView1.FooterRow.FindControl("txtBrandNameFooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@brandDetail", (GridView1.FooterRow.FindControl("txtBrandDetailFooter") as TextBox).Text.Trim());
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

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}