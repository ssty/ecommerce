﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test1
{
    public partial class AdminProductMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
        protected void Button1_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Homepage.aspx");
        }
    }
}