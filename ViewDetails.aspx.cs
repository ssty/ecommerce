﻿using System;
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
    public partial class ViewDetails : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                if (Session["UserId"] == null)
                {
                    Response.Write("<script>alert('You must login first');</script>");
                    //Response.Redirect("Homepage.aspx");
                }
                else
                {
                    //Determine the RowIndex of the Row whose Button was clicked.
                    int rowIndex = Convert.ToInt32(e.CommandArgument);

                    //Reference the GridView Row.
                    GridViewRow row = GridView1.Rows[rowIndex];

                    //Fetch value of Name.
                    string product_name = (row.FindControl("Label2") as Label).Text;
                    try
                    {
                        using (SqlConnection con = new SqlConnection(CS)) //we use using to close the connection explicitly
                        {
                            string emailCheck = Session["UserId"].ToString();

                            string sql = "addToFav";
                            SqlCommand cmd1 = new SqlCommand(sql, con);
                            SqlCommand cmd = new SqlCommand("select account_id from account where email_address='" + emailCheck + "'  ", con);
                            con.Open();
                            int account_id = (int)cmd.ExecuteScalar();

                            cmd1.CommandType = CommandType.StoredProcedure;
                            SqlParameter para1 = new SqlParameter("product_name", product_name);
                            SqlParameter para2 = new SqlParameter("account_id ", account_id);
                            cmd1.Parameters.Add(para1);
                            cmd1.Parameters.Add(para2);
                            cmd1.ExecuteNonQuery();
                            LblSuccessMsg.Text = "Product has been added to favourite list";
                            LblErrorMsg.Text = "";

                        }

                    }
                    catch (Exception ex)
                    {
                        LblSuccessMsg.Text = "";
                        LblErrorMsg.Text = ex.Message;
                    }
                }


            }
        }
    }
}