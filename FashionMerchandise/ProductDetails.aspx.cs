using FashionMerchandise.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FashionMerchandise
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        public enum MessageType { success, danger, info, warning };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        protected void ShowMessage(string Title, string message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "AlertMessage('" + Title + "','" + message + "','" + type + "');", true);
        }
        protected void BtnAddProduct_ServerClick(object sender, EventArgs e)
        {
            if (txtproductname.Value != "" && txtprice.Text != "" && txtProductDesc.Value != "" && txtProductImg.PostedFile.FileName != "")
            {

                ProductMaster pr = new ProductMaster();
                pr.ProductName = txtproductname.Value;
                pr.Price = Convert.ToDecimal(txtprice.Text);
                pr.Description = txtProductDesc.Value;

                var filename = (txtProductImg.PostedFile.FileName);
                var path = Path.Combine(Server.MapPath("~/images/"), filename);
                txtProductImg.PostedFile.SaveAs(path);
                var image = "images/" + filename;
                pr.Image = image;

                pr.Add();
                if (pr.Id > 0)
                {
                    BindData();
                    Clear();
                }
            }
            else
            {
                ShowMessage("oops ? ", "Fields Cannot be Empty, Fill All Details ", MessageType.warning);
            }
            
        }
        public void BindData()
        {
            DataTable dt = new DataTable();
            dt = ProductMaster.GetProducts();
            RptProducts.DataSource = dt;
            RptProducts.DataBind();
        }
         public void Clear()
        {
            txtproductname.Value = "";
            txtprice.Text = "";
            txtProductDesc.Value = "";
            //txtProductImg.PostedFile.FileName = "";
        }

        protected void RptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                BtnAddProduct.Visible = false;
                BtnUpdateProduct.Visible = true;
                int Id = Convert.ToInt32(e.CommandArgument);
                Session["EditId"] = Id;
                ProductMaster Prd = new ProductMaster();
                Prd = ProductMaster.Get(Id);
                if (Prd != null)
                {
                    txtprice.Text = Prd.Price.ToString();
                    txtProductDesc.Value = Prd.Description;
                    txtproductname.Value = Prd.ProductName;
                    txtProductImg.Attributes.Add("readonly", "true");
                }
            }
            else if (e.CommandName == "Delete")
            {
                int Id = Convert.ToInt32(e.CommandArgument);
                if (Id > 0)
                {
                    ProductMaster pr = new ProductMaster();
                    bool msg = pr.Delete(Id);
                    if (msg == true)
                    {
                        BindData();
                        Clear();
                        ShowMessage("Nice ", "Your Product details Removed Successfully ", MessageType.success);
                    }
                }
            }
        }

        protected void BtnUpdateProduct_ServerClick(object sender, EventArgs e)
        {
            ProductMaster pr = new ProductMaster();
            pr.Id = Convert.ToInt64(Session["EditId"]);
            pr.ProductName = txtproductname.Value;
            pr.Price = Convert.ToDecimal(txtprice.Text);
            pr.Description = txtProductDesc.Value;
            pr.Update();

            if(pr.Id == 1)
            {
                BindData();
                Clear();

                BtnAddProduct.Visible = true;
                BtnUpdateProduct.Visible = false;
                txtProductImg.Attributes.Remove("readonly");
                ShowMessage("Nice ", "Your Product details Updated Successfully ", MessageType.success);
            }
           
        }
    }
}