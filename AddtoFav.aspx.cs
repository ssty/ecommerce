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
    public partial class AddtoFav : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("product_id");
                dt.Columns.Add("product_name");
                dt.Columns.Add("product_price");
                dt.Columns.Add("brand_name");
                dt.Columns.Add("product_detail");
                dt.Columns.Add("image");                
                dt.Columns.Add("totalcost");

                if (Request.QueryString["id"] != null)
                {
                    if (Session["Buyitems"] == null)
                    {

                        dr = dt.NewRow();
                        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
                        SqlConnection scon = new SqlConnection(CS);
                        String myquery = "  select * from product where product_id=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["product_id"] = ds.Tables[0].Rows[0]["product_id"].ToString();
                        dr["product_name"] = ds.Tables[0].Rows[0]["product_name"].ToString();
                        dr["product_price"] = ds.Tables[0].Rows[0]["product_price"].ToString();
                        dr["brand_name"] = ds.Tables[0].Rows[0]["brand_name"].ToString();
                        dr["product_detail"] = ds.Tables[0].Rows[0]["product_detail"].ToString();
                        //dr["image"] = ds.Tables[0].Rows[0]["productimage"].ToString();
                         dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                    }
                    else
                    {

                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        string CS = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
                        SqlConnection scon = new SqlConnection(CS);
                        String myquery = "select * from product where productid=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["product_id"] = ds.Tables[0].Rows[0]["product_id"].ToString();
                        dr["product_name"] = ds.Tables[0].Rows[0]["product_name"].ToString();
                        dr["product_price"] = ds.Tables[0].Rows[0]["product_price"].ToString();
                        dr["brand_name"] = ds.Tables[0].Rows[0]["brand_name"].ToString();
                        dr["product_detail"] = ds.Tables[0].Rows[0]["product_detail"].ToString();
                        //dr["image"] = ds.Tables[0].Rows[0]["productimage"].ToString();
                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;

                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                }

            }

        }
    }
}