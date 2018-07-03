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
    public partial class LoginAdmin : System.Web.UI.Page
    {
        admin admin = new admin();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private Boolean loginValidation(admin admin)
        {
            admin.username = txtUsername.Text;
            admin.password = txtPassword.Text;
            string connnectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connnectionstring))
            {
                string sql = "AdminiLoginCheck";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter para1 = new SqlParameter("username", admin.username);
                SqlParameter para2 = new SqlParameter("password ", admin.password);
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
            if (loginValidation(admin))
            {
                Session["UserAdminId"] = txtUsername.Text;               
                Response.Redirect("AdminHomepage.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Incorrect email or password!');", true);
                Response.Redirect("LoginAdmin.aspx");
            }
        }
    }
}
