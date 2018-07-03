using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test1
{
    public partial class usermaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
       
        }

        protected void txtProductBrandFooter_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Homepage.aspx");
        }
       
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //string a = txtSearch.Text;
            //Session["SearchBox"] = txtSearch.Text;
            Response.Redirect("UserSearch.aspx?SearchBox=" + txtSearch.Text);
        }
        public TextBox textBoxOnMasterPage
        {
            get
            {
                return this.txtSearch;
            }
        }
    }
}