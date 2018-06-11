using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test1
{
    public partial class ViewUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            grdViewUser.DataSource = showUsers();
            grdViewUser.DataBind();
        }


        private List<account> showUsers()
        {
            using (ecommerceEntities db = new ecommerceEntities())
            {
                return db.accounts.ToList();
            }

        }
    }
}