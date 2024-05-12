<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="FashionMerchandise.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <main class="mt-5">
        <div class="container pt-4">

            <div class="text-center mt-5 mb-5" style="color:cadetblue;">
                <h1>Welcome To the Admin Dashboard</h1>
                <img src="images/Fashionlogo.png" width="300" />
                </div>


            <section class="mb-4">
                <div class="card">
                    <div class="card-header text-center" style="background-color: cadetblue;">
                        <h5 class="text-center text-white fs-5" >
                            <strong>Products</strong>
                        </h5>
                    </div>

                    <div class="card-bod">                       
                            <asp:Repeater runat="server" ID="RptProducts">
                                <HeaderTemplate>
                                    <table class="table table-hover table-info table-bordered table-responsive table-striped">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Product Name</th>
                                                <th>Price</th>
                                                <th>Description</th>
                                            </tr>
                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:Image runat="server" Width="70" ImageUrl='<%#Eval("Image")%>' />
                                            </td>
                                            <td><%#Eval("ProductName")%></td>
                                            <td><%#Eval("Price")%></td>
                                            <td><%#Eval("Description")%> </td>
                                        </tr>
                                    </tbody>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>                   
                </div>
            </section>
        </div>
    </main>

    <script type="text/javascript" src="js/bootstrap.min.js"></script>

</asp:Content>
