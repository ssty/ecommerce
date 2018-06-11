using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test1
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           account A = new account();
           A.name = txtName.Text;
           A.password = txtConfirmpassword.Text;
           A.email_address = txtEmail.Text;
           registerAccount(A);
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

            using (ecommerceEntities db = new ecommerceEntities())
            {
                db.accounts.Add(Account);
                db.SaveChanges();               
            }

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}