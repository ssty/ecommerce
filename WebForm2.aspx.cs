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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();

            }
        }
        public void Bind()
        {
            string mycon = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            string myquery = "select *from imagesDb";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Bind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.EditIndex = e.NewPageIndex;
            Bind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;
            GridViewRow row = (GridViewRow)GridView1.Rows[index];
            TextBox text1 = (TextBox)row.FindControl("TextBox1");
            FileUpload fu = (FileUpload)row.FindControl("FileUpload1");
            Label label1 = (Label)row.FindControl("Label1");
            Random rand = new Random((int)DateTime.Now.Ticks);
            int numIterations = 0;
            numIterations = rand.Next(1, 1000);
            string constring = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(constring);
            fu.SaveAs(Server.MapPath("~/images/") + numIterations + Path.GetFileName(fu.FileName));
            String link = "images/" + numIterations + Path.GetFileName(fu.FileName);
            String updatedata = "Update imagesDb set moviename='" + text1.Text + "', picture='" + link + "' where movieid=" + label1.Text;
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = sqlcon;
            cmd.ExecuteNonQuery();
            sqlcon.Close();
            GridView1.EditIndex = -1;
            Bind();


        }
    }
}