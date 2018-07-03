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
    public partial class ViewUsers : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["UserAdminId"] != null)
                {
                    PopulateGridView();
                }
                else
                {
                    Response.Redirect("LoginAdmin.aspx");
                }

            }
        }
        void PopulateGridView()
        {

            DataTable dtbl = new DataTable();
            using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
            {
                con.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT account_id, name, email_address FROM account", con);
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
                    int account_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
                    string sql = "AdminDelAccount";
                    SqlCommand cmd1 = new SqlCommand(sql, con);
                    con.Open();
                    cmd1.CommandType = CommandType.StoredProcedure;
                    SqlParameter para1 = new SqlParameter("account_id", account_id);
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