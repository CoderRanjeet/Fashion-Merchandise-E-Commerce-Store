using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FashionMerchandise
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        public enum MessageType { success, danger, info, warning };
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["ProductData"] != null)
            {
                DataTable dt = (DataTable)(Session["ProductData"]);
                if (dt.Rows.Count > 0)
                {
                    Decimal TotalPrice = Convert.ToDecimal(dt.Compute("SUM(Total)", string.Empty));
                    txtSubTotal.Text = TotalPrice.ToString();
                    RptShoppingCart.DataSource = dt;
                    RptShoppingCart.DataBind();
                }
                ShowMessage("Awesome ", "Welcome to Your Shopping Cart", MessageType.success);
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void ShowMessage(string Title, string message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "AlertMessage('" + Title + "','" + message + "','" + type + "');", true);
        }
        protected void RptShoppingCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ProductMinus")
            {
                int Id = Convert.ToInt32(e.CommandArgument);
                DataTable dt = (DataTable)Session["ProductData"];
                DataRow[] rows = dt.Select("Id=" + Id);

                int Qty = Convert.ToInt32(rows[0]["Qty"]);
                decimal Price = Convert.ToDecimal(rows[0]["Price"]);
                decimal Total = Convert.ToDecimal(rows[0]["Total"]);
                
                if (Qty > 1)
                {
                    rows[0]["Qty"] = Qty -1 ;
                    rows[0]["Total"] =  Total - Price;
                    Decimal TotalPrice = Convert.ToDecimal(dt.Compute("SUM(Total)", string.Empty));
                    txtSubTotal.Text = TotalPrice.ToString();
                    RptShoppingCart.DataSource = dt;
                    RptShoppingCart.DataBind();
                }
                else if(Qty == 1)
                {
                    ShowMessage("oops ?", "Quantity can Not be 0, you can Remove Your Product", MessageType.warning);
                }
                
            }
           else if (e.CommandName == "ProductAdd")
            {
                int Id = Convert.ToInt32(e.CommandArgument);
                DataTable dt = (DataTable)Session["ProductData"];
                DataRow[] rows = dt.Select("Id=" + Id);
                
                int Qty = Convert.ToInt32(rows[0]["Qty"]);
                Decimal Price = Convert.ToDecimal(rows[0]["Price"]);
                Decimal Total = Convert.ToDecimal(rows[0]["Total"]);

                if (Qty >= 1)
                {
                    rows[0]["Qty"] = (Qty + 1).ToString();
                    rows[0]["Total"] = (Total + Price).ToString();
                    //Decimal TotalPrice = Convert.ToDecimal(dt.Compute("SUM(Total)",""));

                    txtSubTotal.Text = dt.Compute("Sum(Total)", "").ToString();                   
                    RptShoppingCart.DataSource = dt;
                    RptShoppingCart.DataBind();
                }
            }
           else if (e.CommandName == "ProductDelete")
            {
                int Id = Convert.ToInt32(e.CommandArgument);
                DataTable dt = (DataTable)Session["ProductData"];
                if (Id > 0)
                {
                    DataRow[] rows = dt.Select("Id=" + Id);
                    Decimal Total = Convert.ToDecimal(rows[0]["Total"]);
                    foreach (DataRow row in rows)
                        dt.Rows.Remove(row);

                    Decimal TotalPrice = Math.Abs(Total - Convert.ToDecimal(txtSubTotal.Text));
                    txtSubTotal.Text = TotalPrice.ToString();
                    RptShoppingCart.DataSource = dt;
                    RptShoppingCart.DataBind();
                }
            }
        }

        protected void BtnProceed_Click(object sender, EventArgs e)
        {
            var Name = txtfname.Text;
            var Email = txtemail.Text;
            var Phone = txtphone.Text;

            var Total = txtSubTotal.Text;

            Session["Name"] = Name;
            Session["Email"] = Email;
            Session["Phone"] = Phone;
            Session["Total"] = Total;

            Response.Redirect("Payment.aspx");
        }
    }
}