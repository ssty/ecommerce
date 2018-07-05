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
    public partial class Login : System.Web.UI.Page
    {
        account account = new account();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        [System.Web.Services.WebMethod]
        public static bool CheckUserName(string email_address)
        {

            bool status = false;
            string constr = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("checkEmailAddress", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email_address", email_address.Trim());
                    conn.Open();
                    status = Convert.ToBoolean(cmd.ExecuteScalar());
                    conn.Close();
                }
            }


            return status;
        }

        private Boolean loginValidation(account account)
        {
            account.email_address = txtEmail.Text;
            account.password = txtPassword.Text;
            string connnectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connnectionstring))
            {
                string sql = "LoginCheck";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter para1 = new SqlParameter("email_address", account.email_address);
                SqlParameter para2 = new SqlParameter("password ", account.password);
                cmd.Parameters.Add(para1);
                cmd.Parameters.Add(para2);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.HasRows)
                {
                    rdr.Read();
                    return true;
                }
                return false;             
                
            }

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

            if (loginValidation(account))
            {
                Session["UserId"] = txtEmail.Text;
                Response.Redirect("Homepage.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Incorrect password!');", true);                
            }
        }
    }
    
}