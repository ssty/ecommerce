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
    public partial class AdminHomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserAdminId"] != null)
            {
                Label4.Text = "Welcome! " + Session["UserAdminId"].ToString();
            }
            else
            {
                Label4.Text = "";
            }

            string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
            {
                con.Open();
                string query = "SELECT COUNT(product_id) FROM product";
                SqlCommand cmd = new SqlCommand(query, con);
                int productCount=(int)cmd.ExecuteScalar();
                Label1.Text ="Total products:"+ productCount.ToString();

                string query1 = "select count(account_id) from account";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                int accountCount = (int)cmd1.ExecuteScalar();
                Label2.Text = "Total customers:" + accountCount.ToString();

                string query2 = "select count(favourite_id) from favourite";
                SqlCommand cmd2 = new SqlCommand(query2, con);
                int favouriteCount = (int)cmd2.ExecuteScalar();
                Label3.Text = "Total products liked:" + favouriteCount.ToString();

            }
        }
        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("adminProductView.aspx");
        }


        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("adminFavCheck.aspx");
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ViewUsers.aspx");
        }

       
    }
}