using FashionMerchandise.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FashionMerchandise
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Admin"] != null)
                {
                    DataTable dt = new DataTable();
                    dt = ProductMaster.GetProducts();
                    RptProducts.DataSource = dt;
                    RptProducts.DataBind();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
               
            }
        }
    }
}