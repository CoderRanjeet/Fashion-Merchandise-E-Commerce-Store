<%@ Page Title="" Language="C#" MasterPageFile="~/Fashion.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="FashionMerchandise.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="product_section layout_padding">
        <div class="container">
            <div class="heading_container heading_center">
                <h2>Our <span>products</span>  </h2>
            </div>
            <div class="float-right row" runat="server" id="lblproductcart" visible="false">
                <label class="font-weight-bold"><span class="fa fa-shopping-cart"></span>Product Cart - </label>
                <label runat="server" class="font-weight-bold ml-2" id="ProductCount"></label>
                <button runat="server" id="BtnCart" class="btn btn-primary ml-2 btn-sm" onserverclick="BtnCart_ServerClick">Go To Cart</button>
            </div>
            <div class="row">
                <asp:Repeater runat="server" ID="RptProducts" OnItemCommand="RptProducts_ItemCommand">
                    <ItemTemplate>
                        <div class="col-sm-6 col-md-4 col-lg-4">
                            <div class="box">
                                <div class="option_container">
                                    <div class="options">
                                        <asp:LinkButton runat="server" CssClass="option1" ID="lknAddTocart" CommandName="AddToCart" CommandArgument='<%#Eval("Id") + ";" + Eval("ProductName") + ";" + Eval("Price") + ";" + Eval("Image") %>'>Add To Cart</asp:LinkButton>
                                        <asp:LinkButton runat="server" CssClass="option2" ID="lknBuyNow" CommandName="BuyNow" CommandArgument='<%#Eval("Id") + ";" + Eval("ProductName") + ";" + Eval("Price") + ";" + Eval("Image") %>'>Buy Now</asp:LinkButton>
                                    </div>
                                </div>
                                <div class="img-box">
                                    <img src='<%# Eval("Image") %>' style="max-height: 227px;" alt="">
                                </div>
                                <div class="detail-box">
                                    <h5><%# Eval("ProductName") %></h5>
                                    <h6><%# Eval("Price") %> </h6>
                                </div>
                                <label style="color: whitesmoke;"><%# Eval("Id") %></label>
                                 <label><%# Eval("Description") %></label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
