using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FashionMerchandise
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               if( Session["Name"] !=null && Session["Total"] != null)
                {
                    lblname.Text = Session["Name"].ToString();
                    lblPhone.Text = Session["Phone"].ToString();
                    lblemail.Text = Session["Email"].ToString();
                    lblbill.Text = Session["Total"].ToString();
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }

        protected void BtnOrder_Click(object sender, EventArgs e)
        {
            Session["ProductData"] = null;
            Response.Redirect("SuccessMsg.aspx");

        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Session["ProductData"] = null;
            Response.Redirect("Home.aspx");
        }
    }
}