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
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    StringBuilder table = new StringBuilder();
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


        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static bool CheckUserName(string email_address)
        {
            String accountName = (String)HttpContext.Current.Session["UserId"];
            bool status = false ;
            string constr = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("CheckPassword", conn))
                {
                    conn.Open();
                    SqlCommand cmd2 = new SqlCommand("select account_id from account where email_address='" + accountName.Trim() + "'", conn);
                    int account_id = Convert.ToInt32(cmd2.ExecuteScalar());
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@password", email_address.Trim());
                    cmd.Parameters.AddWithValue("@account_id", account_id);
                    status = Convert.ToBoolean(cmd.ExecuteScalar());
                    conn.Close();
                }
            }
            return status;

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(CS))
            {
                try
                {
                    con.Open();
                    string name = Request["name"];
                    string password = Request["password"];
                    string confrimPassword = Request["confirm_password"];
                    if (password == confrimPassword)
                    {
                        accountName = Session["UserId"].ToString();
                        SqlCommand cmd2 = new SqlCommand("select account_id from account where email_address='" + accountName.Trim() + "'", con);
                        int account_id = Convert.ToInt32(cmd2.ExecuteScalar());
                        string sql = "ChangePassword";
                        SqlCommand cmd1 = new SqlCommand(sql, con);
                        cmd1.CommandType = CommandType.StoredProcedure;
                        SqlParameter para1 = new SqlParameter("account_id", account_id);
                        SqlParameter para2 = new SqlParameter("password", password);
                        SqlParameter para3 = new SqlParameter("name", name);
                        cmd1.Parameters.Add(para1);
                        cmd1.Parameters.Add(para2);
                        cmd1.Parameters.Add(para3);
                        cmd1.ExecuteNonQuery();
                        Label4.Text = " Uploaded successfully";
                    }
                    else
                    {
                        Label4.Text = "Please give correct information";
                    }


                }
                catch (Exception ex)
                {
                    Label3.Visible = true;
                    Label3.Text = ex.Message;

                }

            }
        }

        protected void btnDeactivate_Click1(object sender, EventArgs e)
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Are you sure you want to deactivate your account?')</script>");
        }


        protected void confirmDeactivate_Click1(object sender, EventArgs e)
        {
            string x = passwordForDeactivate.Text;
            bool passwordCheck = CheckUserName(x);
            if (passwordCheck == true)
            {
                using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
                {
                    string email = Session["UserId"].ToString();
                    string sql = "delMyAccount";
                    SqlCommand cmd1 = new SqlCommand(sql, con);
                    con.Open();
                    cmd1.CommandType = CommandType.StoredProcedure;
                    SqlParameter para1 = new SqlParameter("email", email);
                    cmd1.Parameters.Add(para1);
                    cmd1.ExecuteNonQuery();
                    Session.Clear();
                    
                }
            }
            else
            {
                Label6.Text = "Invalid password";
            }
        }
    }
}

