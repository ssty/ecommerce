using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Test1
{
    public partial class Login : System.Web.UI.Page
    {
        account account = new account();
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        private Boolean loginValidation(account account)
        {
            account.name = txtEmail.Text;
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
                Response.Redirect("Homepage.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Incorrect email or password!');", true);
                Response.Redirect("Login.aspx");
            }
        }
    }
    
}