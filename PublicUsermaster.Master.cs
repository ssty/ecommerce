using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test1
{
    public partial class PublicUsermaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtProductBrandFooter_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string a = txtSearch.Text;
            Session["UserName"] = txtSearch.Text;
            Response.Redirect("PublicUserSearch.aspx? val = " + txtSearch.Text);

        }
    }
}