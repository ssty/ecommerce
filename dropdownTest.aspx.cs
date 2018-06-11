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
    public partial class dropdownTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
                {
                    SqlCommand cmd = new SqlCommand("Select brand_id,brand_name,brand_detail from brand", con);
                    con.Open();
                    DropDownList1.DataSource = cmd.ExecuteReader();
                    DropDownList1.DataTextField = "brand_name";
                    DropDownList1.DataValueField = "brand_id";
                    DropDownList1.DataBind();

                }
            }
                if (!IsPostBack)
                {
                string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
                {
                    SqlCommand cmd1 = new SqlCommand("Select type_id,type_name from type", con);
                    con.Open();
                    DropDownList2.DataSource = cmd1.ExecuteReader();
                    DropDownList2.DataTextField = "type_name";
                    DropDownList2.DataValueField = "type_id";
                    DropDownList2.DataBind();
                }
            }      

        }

       

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            String connnectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connnectionstring);
            SqlCommand cmd = new SqlCommand("insert into dropdown1 values(@product)", con);
            cmd.Parameters.AddWithValue("@product", DropDownList1.SelectedItem.Value);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if(i!=0)
            {
                 Lit1.Text = "selected recorde success";
            }
            else
            {
                Lit1.Text = "failed";
            }
            con.Close();


            SqlCommand cmd1 = new SqlCommand("insert into dropdown2 values(@product2)", con);
            cmd1.Parameters.AddWithValue("@product2", DropDownList2.SelectedItem.Value);
            con.Open();
            int j = cmd1.ExecuteNonQuery();
            if (j != 0)
            {
                Lit2.Text = "selected recorde success";
            }
            else
            {
                Lit2.Text = "failed";
            }
            con.Close();


        }
       
    }
}