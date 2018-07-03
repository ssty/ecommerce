using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;

namespace Test1
{
    public partial class UserMyAccount : System.Web.UI.Page
    {
        string accountName;
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StringBuilder table = new StringBuilder();
                if (Session["UserId"] != null)
                {
                    accountName = Session["UserId"].ToString();
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        con.Open();
                        string str = "select name,email_address from account where email_address='" + accountName.Trim() + "'";
                        SqlCommand com = new SqlCommand(str, con);
                        SqlDataReader rdr = com.ExecuteReader();
                        if (rdr.Read())
                        {
                            Label1.Text = rdr["name"].ToString();
                            Label2.Text = rdr["email_address"].ToString();
                            //Label3.Text = rdr[""].ToString();
                            // Label4.Text = rdr["email_address"].ToString();

                            rdr.Close();
                        }
                    }
                }


            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                try
                {
                    con.Open();
                    string password = TextBox2.Text;
                    accountName = Session["UserId"].ToString();
                    SqlCommand cmd2 = new SqlCommand("select account_id from account where email_address='" + accountName.Trim() + "'", con);
                    int account_id = Convert.ToInt32(cmd2.ExecuteScalar());
                    string sql = "ChangePassword";
                    SqlCommand cmd1 = new SqlCommand(sql, con);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    SqlParameter para1 = new SqlParameter("account_id", account_id);
                    SqlParameter para2 = new SqlParameter("password", password);
                    cmd1.Parameters.Add(para1);
                    cmd1.Parameters.Add(para2);
                    cmd1.ExecuteNonQuery();                   
                    Label1.Text = " Uploaded successfully";

                }
                catch(Exception ex)
                {
                    Label1.Visible = true;
                    Label1.Text = ex.Message;

                }

            }
        }
    }
}

