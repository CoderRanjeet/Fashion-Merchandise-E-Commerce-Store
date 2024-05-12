<%@ Page Title="" Language="C#" MasterPageFile="~/Fashion.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FashionMerchandise.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="card mx-auto mb-3 mt-3" style="background-color: lightsteelblue; border-radius: 20px; width: 1000px;">
            <div class="card-body">
                <section class="mb-4">
                    <h2 class="h1-responsive font-weight-bold text-center my-4">Contact us</h2>
                    <p class="text-center w-responsive mx-auto mb-5">
                        Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you within
                                a matter of hours to help you.
                    </p>

                    <div class="row">
                        <div class="col-md-9 mb-md-0 mb-5">
                            <div id="contact-form" name="contact-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="md-form mb-0">
                                            <label for="name" class="">Your Name</label>
                                            <input type="text" id="name" name="name" class="form-control">
                                            
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="md-form mb-0">
                                            <label for="email" class="">Your Email</label>
                                            <input type="text" id="email" name="email" class="form-control">
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="md-form mb-0">
                                            <label for="subject" class="">Subject</label>
                                            <input type="text" id="subject" name="subject" class="form-control">
                                            
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="md-form">
                                             <label for="message">Your message</label>
                                            <textarea type="text" id="message" name="message" rows="2" class="form-control md-textarea"></textarea>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="text-center text-md-left">
                                <a class="btn btn-primary btn-lg">Send</a>
                            </div>
                            <div class="status"></div>
                        </div>

                        <div class="col-md-3 text-center">
                            <ul class="list-unstyled mb-0">
                                <li><i class="fa fa-map-marker fa-2x"></i>
                                    <p>2285 Britannia Rd W Unit 21, Mississauga, ON L5M 2G6, Canada</p>
                                </li>

                                <li><i class="fa fa-phone mt-4 fa-2x"></i>
                                    <p>+1 647-749-6004</p>
                                </li>

                                <li><i class="fa fa-envelope mt-4 fa-2x"></i>
                                    <p>FashionClothes99@gmail.com</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

</asp:Content>
