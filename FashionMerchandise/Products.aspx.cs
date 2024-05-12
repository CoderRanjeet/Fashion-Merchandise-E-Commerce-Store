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
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt = ProductMaster.GetProducts();
                RptProducts.DataSource = dt;
                RptProducts.DataBind();
            }
        }

        protected void RptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                string[] arguments = e.CommandArgument.ToString().Split(';');
                int Id = Convert.ToInt32(arguments[0]);
                string Product = arguments[1];
                Decimal Price = Convert.ToDecimal(arguments[2]);
                string Image = arguments[3];
                lblproductcart.Visible = true;
                DataTable dt = new DataTable();
                if (Session["ProductData"] != null)
                {
                    dt = (DataTable)Session["ProductData"];
                    DataRow dr = null;
                    if (dt.Rows.Count > 0)
                    {
                        dr = dt.NewRow();
                        dr["Id"] = Id;
                        dr["Product"] = Product;
                        dr["Qty"] = 1;
                        dr["Price"] = Price;
                        dr["Total"] = Price;
                        dr["Image"] = Image;
                        dt.Rows.Add(dr);
                        Session["ProductData"] = dt;
                       ProductCount.InnerText = "0" + dt.Rows.Count.ToString();
                    }
                }
                else
                {
                    dt.Columns.Add("Id", typeof(int));
                    dt.Columns.Add("Product", typeof(string));
                    dt.Columns.Add("Qty", typeof(string));
                    dt.Columns.Add("Price", typeof(Decimal));
                    dt.Columns.Add("Total", typeof(Decimal));
                    dt.Columns.Add("Image", typeof(string));
                    DataRow dr1 = dt.NewRow();
                    
                    dr1["Id"] = Id;
                    dr1["Product"] = Product;
                    dr1["Qty"] = 1;
                    dr1["Price"] = Price;
                    dr1["Total"] = Price;
                    dr1["Image"] = Image;
                    dt.Rows.Add(dr1);
                    Session["ProductData"] = dt;
                    ProductCount.InnerText = "0" + dt.Rows.Count.ToString();
                }
            }
            else if (e.CommandName == "BuyNow")
            {
                string[] arguments = e.CommandArgument.ToString().Split(';');
                string Id = arguments[0];
                string Product = arguments[1];
                string Price = arguments[2];
                string Image = arguments[3];

                DataTable dt = new DataTable();
                dt.Columns.Add("Id", typeof(int));
                dt.Columns.Add("Product", typeof(string));
                dt.Columns.Add("Qty", typeof(string));
                dt.Columns.Add("Price", typeof(Decimal));
                dt.Columns.Add("Total", typeof(Decimal));
                dt.Columns.Add("Image", typeof(string));
                DataRow dr1 = dt.NewRow();
                dr1 = dt.NewRow();
                dr1["Id"] = Id;
                dr1["Product"] = Product;
                dr1["Qty"] = 1;
                dr1["Price"] = Price;
                dr1["Total"] = Price;
                dr1["Image"] = Image;
                dt.Rows.Add(dr1);
                Session["ProductData"] = dt;

                Response.Redirect("ShoppingCart.aspx");
            }
        }

        protected void BtnCart_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("ShoppingCart.aspx");
        }
    }
}