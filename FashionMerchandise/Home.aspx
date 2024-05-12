<%@ Page Title="" Language="C#" MasterPageFile="~/Fashion.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FashionMerchandise.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="sweetalert2.min.css" />
    <script type="text/javascript">
        function AlertMessage(Title, message, MessageType) {
            Swal.fire
                (
                    Title, message, MessageType
                )
        }
    </script>

    <section class="slider_section ">
        <div class="slider_bg_box">
            <img src="images/slider12.jpg" alt="">
        </div>
        <div id="customCarousel1" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="container ">
                        <div class="row">
                            <div class="col-md-7 col-lg-6 ">
                                <div class="detail-box">
                                    <h1>
                                        <span>Flat 70% off
                                        </span>
                                        <br>
                                        On Everything
                                    </h1>
                                    <p>
                                        Online shopping for Clearance Sale - Clothing: Flat 70% off from a great selection at Clothing & Dresses Store
                                    </p>
                                    <div class="btn-box">
                                        <a href="#" class="btn1">Shop Now
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item ">
                    <div class="container ">
                        <div class="row">
                            <div class="col-md-7 col-lg-6">
                                <div class="detail-box">
                                    <h1>
                                        <span>Buy 1 Get 1 Free Between 15 to 20 August
                                        </span>
                                        <br>
                                        On Everything
                                    </h1>
                                    <p>
                                      Online Shopping Site for Designer Clothes, ... Shop at Best Prices & Attractive Offers from Canada's best Fashion Website.                                    </p>
                                    <div class="btn-box">
                                        <a href="#" class="btn1">Shop Now
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container ">
                        <div class="row">
                            <div class="col-md-7 col-lg-6 ">
                                <div class="detail-box">
                                    <h1>
                                        <span> Discounts at Various Products
                                        </span>
                                        <br>
                                        On Everything
                                    </h1>
                                    <p>
                              ONLY's online shopping sale is back! Get Flat 50% off on Denim Jeans, Tops, Dresses, Jumpsuits, Jackets, T-shirts & More. Hurry, Limited Stocks ONLY!                                    </p>
                                    <div class="btn-box">
                                        <a href="Products.aspx" class="btn1">Shop Now
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <ol class="carousel-indicators">
                    <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
                    <li data-target="#customCarousel1" data-slide-to="1"></li>
                    <li data-target="#customCarousel1" data-slide-to="2"></li>
                </ol>
            </div>
        </div>
    </section>

    <section class="why_section layout_padding">
        <div class="container">
            <div class="heading_container heading_center">
                <h2>Why Shop With Us
                </h2>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="box ">
                        <div class="img-box">
                            
                            <i class="fa fa-truck fa-3x"></i>
                        </div>
                        <div class="detail-box">
                            <h5>Fast Delivery
                            </h5>
                            <p>
                               Giving you a lightning fast courier service.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box ">
                        <div class="img-box">
                            
                            <i class="fa fa-shopping-bag fa-3x"></i>
                        </div>
                        <div class="detail-box">
                            <h5>Free Shiping
                            </h5>
                            <p>
                               Free Shipping On All Orders Any Time.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box ">
                        <div class="img-box">
                            <i class="fa fa-cart-plus fa-3x"></i>
                        </div>
                        <div class="detail-box">
                            <h5>Best Quality
                            </h5>
                            <p>
                                Best Quality Products Available With Guarantee.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="arrival_section">
        <div class="container">
            <div class="box">
                <div class="arrival_bg_box">
                    <img src="images/arrival-bg.jpg" alt="">
                </div>
                <div class="row">
                    <div class="col-md-6 ml-auto">
                        <div class="heading_container remove_line_bt">                            
                            <h2>#NewArrivals </h2>
                        </div>
                        <p style="margin-top: 20px; margin-bottom: 30px;">
                            Shop from a wide range of fashion & lifestyle products from top brands at the best prices only on Fashion Clothes. here you can buy branded dresses, kurties , jeans ,T-shirts etc.
                        </p>
                        <a href="Products.aspx">Shop Now
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

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


    <section>
  <div class="row d-flex justify-content-center">
    <div class="col-md-10 col-xl-8 text-center">
      <h3 class="mb-4">Our Team</h3>
      <p class="mb-4 pb-2 mb-md-5 pb-md-0">
       "A diverse group of passionate individuals united by a common goal. We bring together a blend of talents, experiences, and perspectives, fostering innovation and creativity. Collaboratively, we strive to turn ideas into reality and create meaningful impact."
      </p>
    </div>
  </div>

  <div class="row text-center">
    <div class="col-md-4 mb-5 mb-md-0">
      <div class="d-flex justify-content-center mb-4">
        <img src="images/team2.jpg"
          class="rounded-circle shadow-1-strong" width="150" height="150" />
      </div>
      <h5 class="mb-3">Maria Smantha</h5>
      <h6 class="text-primary mb-3">Web Developer</h6>
      <p class="px-xl-3">
        <i class="fa fa-quote-left pe-2"></i>A coding virtuoso who turns design concepts into interactive online experiences. With a keen eye for aesthetics and a mastery of programming languages, our web developer crafts websites that marry form and function seamlessly, delivering exceptional user journeys and digital solutions."
      </p>
      <ul class="list-unstyled d-flex justify-content-center mb-0">
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
        <li>
          <i class="fa fa-star-half-alt fa-sm text-warning"></i>
        </li>
      </ul>
    </div>
    <div class="col-md-4 mb-5 mb-md-0">
      <div class="d-flex justify-content-center mb-4">
        <img src="images/team3.jpg" class="rounded-circle shadow-1-strong" width="150" height="150" />
      </div>
      <h5 class="mb-3">Lisa Cudrow</h5>
      <h6 class="text-primary mb-3">Graphic Designer</h6>
      <p class="px-xl-3">
        <i class="fa fa-quote-left pe-2"></i>A visual storyteller with a brush of creativity. Our graphics designer transforms concepts into captivating visuals, weaving color, typography, and imagery to craft designs that leave a lasting impression. From logos to layouts, they turn ideas into stunning works of art that resonate with audiences."
      </p>
      <ul class="list-unstyled d-flex justify-content-center mb-0">
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
      </ul>
    </div>
    <div class="col-md-4 mb-0">
      <div class="d-flex justify-content-center mb-4">
        <img src="images/team1.jpg" class="rounded-circle shadow-1-strong" width="150" height="150" />
      </div>
      <h5 class="mb-3">John Smith</h5>
      <h6 class="text-primary mb-3">Marketing Specialist</h6>
      <p class="px-xl-3">
        <i class="fa fa-quote-left pe-2"></i>A strategic mind behind successful campaigns. Our marketing specialist navigates the digital landscape with finesse, utilizing data-driven insights to create and execute strategies that captivate audiences. From social media to SEO, they drive brand awareness, engagement, and growth, transforming potential into loyal customers."
      </p>
      <ul class="list-unstyled d-flex justify-content-center mb-0">
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
        <li>
          <i class="fa fa-star fa-sm text-warning"></i>
        </li>
      </ul>
    </div>
  </div>
</section>

</asp:Content>
