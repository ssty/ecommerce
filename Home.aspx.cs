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
        protected void Page_Load(object sender, EventArgs e)
        {
           
            string connnectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connnectionstring))
            {
                string sql = "select product_name as Product, product_detail as Description,product_price as Price from product";
                SqlCommand cmd = new SqlCommand(sql, con);             
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();

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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string connnectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(connnectionstring))
            //{
            //    SqlCommand cmd = new SqlCommand("Select type_id,type_name from type", con);
            //    con.Open();
            //    DropDownList1.DataSource = cmd.ExecuteReader();
            //    DropDownList1.DataTextField = "type_name";
            //    DropDownList1.DataValueField = "type_id";
            //    DropDownList1.DataBind();
            //}


            //using (SqlConnection con = new SqlConnection(connnectionstring))
            //{
            //    SqlCommand cmd = new SqlCommand("SelectType", con);
            //    con.Open();
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.AddWithValue("@type_name", DropDownList1.SelectedItem.Value); //for checking if it is in db or not
            //    GridView1.DataSource = cmd.ExecuteReader();
            //  GridView1.DataBind();


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
    }
    }
