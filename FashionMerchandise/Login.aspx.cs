using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FashionMerchandise
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void BtnLogin_ServerClick(object sender, EventArgs e)
        {
            if(txtusername.Value=="Admin" && txtpassword.Value == "Admin@123")
            {
                Session["Admin"] = "Admin";
                Response.Redirect("AdminDashboard.aspx");
            }
            
        }
    }
}