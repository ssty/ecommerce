using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;


namespace Test1
{
    public partial class Registration : System.Web.UI.Page
    {
        static string activationcode;
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
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
                }
            }
            return status;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        private void loginvalidation(string email, string password)
        {

        }

        private void registerAccount(account a)
        {
            account Account = new account();
            Account.name = a.name;
            Account.password = a.password;
            Account.email_address = a.email_address;
            Account.contact_number = a.contact_number;
            Account.activation_code = a.activation_code;
            using (ecommerceEntities db = new ecommerceEntities())
            {
                db.accounts.Add(Account);
                db.SaveChanges();
                sendCode();
                //Response.Redirect("WebForm2.aspx?email_address="+txtEmail.Text);
            }
        }

        private void sendCode()
        {
            Random random = new Random();
            activationcode = random.Next(1001, 9999).ToString();
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("shristy71078@gmail.com", "Eeagle@@1");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Activation Code to verify email address";
            msg.Body = "Dear" + txtEmail.Text + ",Please enter this verification code " + activationcode + " while login. Thankyou!";
            String toaddress = txtEmail.Text;
            msg.To.Add(toaddress);
            string fromaddress = "See Product Team <shristy71078@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
            }
            catch
            {
                throw;
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {

            account A = new account();
            Random random = new Random();
            activationcode = random.Next(1001, 9999).ToString();
            A.name = txtName.Text;
            A.password = txtConfirmpassword.Text;
            A.email_address = txtEmail.Text;
            A.activation_code = "Unregistered";
            registerAccount(A);
            using (SqlConnection con = new SqlConnection(CS))
            {
                string myquery = "select *from account where email_address='" + Request.QueryString["txtEmail"] + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string activationcode;
                    activationcode = ds.Tables[0].Rows[0]["activationcode"].ToString();
                    if (activationcode == Request["code"])
                    {
                        changeStatus();
                    }
                }
                else
                {

                }
            }
        }
        private void changeStatus()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                string updateDate = "update account set activation_code='Verified' where email_address'" + Request.QueryString["txtEmail"] + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = updateDate;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
            }
        }

         
    }
}