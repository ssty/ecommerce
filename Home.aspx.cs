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
    public partial class Home : System.Web.UI.Page
    {
        product product = new product();
        favourite favourite = new favourite();
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                Response.Redirect("Homepage.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('You must sign in first.');", true);
            Response.Redirect("Login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }
        protected void BtnAddToFav_Click_Click1(object sender, EventArgs e)
        {

        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void insertProduct_Click(object sender, EventArgs e)
        {


        }

        protected void Search1_Click(object sender, EventArgs e)
        {
            Response.Redirect("insertSelect.aspx");
        }

        protected void Search2_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
              //  GridViewRow row = GridView1.Rows[rowIndex];


              //  ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert(' You must login first!!');</script>");


            }
        }


    }
}


