<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="FashionMerchandise.ProductDetails" %>

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

    <div class="container">
        <div class="card" style="margin-top: 100px; margin-left: 190px;">
            <div class="card-header text-center text-capitalize text-white" style="background-color: cadetblue;">
                <h3>Add Product Details</h3>
            </div>
            <div class="card-body">
                <div class="col-md-8 mb-3 offset-2">
                    <div class="form-group">
                        <label>Product Name <span class="text-danger">*</span></label>
                        <input class="form-control" type="text" runat="server" id="txtproductname" required="required">
                    </div>
                </div>
                <div class="col-md-8 mb-3 offset-2">
                    <div class="form-group">
                        <label>Price <span class="text-danger">*</span></label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtprice"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ErrorMessage=" Enter Decimal amount Only" ID="txtPriceValidate"
                            ControlToValidate="txtprice"
                            ValidationExpression="^\d+\.\d{0,2}$"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="col-md-8 mb-3 offset-2">
                    <div class="form-group">
                        <label>Product Description<span class="text-danger">*</span></label>
                        <input class="form-control" type="text" runat="server" id="txtProductDesc" required="required">
                    </div>
                </div>
                <div class="col-md-8 mb-3 offset-2">
                    <div class="form-group">
                        <label>Photo<span class="text-danger">*</span></label>
                        <input type="file" class="form-control" runat="server" id="txtProductImg" required="required">
                    </div>
                </div>

                <div class=" mt-4 text-center">
                    <button class="btn btn-primary submit-btn" id="BtnAddProduct" runat="server" onserverclick="BtnAddProduct_ServerClick">Add Product</button>

                    <button class="btn btn-success submit-btn" id="BtnUpdateProduct" visible="false" runat="server" onserverclick="BtnUpdateProduct_ServerClick">Update Product</button>

                </div>
            </div>
        </div>


        <div class="card" style="margin-top: 80px; margin-left: 190px;">
            <div class="card-header text-center text-white" style="background-color: cadetblue;">
                <h3>Products </h3>
            </div>
            <div class="card-bod">

                <asp:Repeater runat="server" ID="RptProducts" OnItemCommand="RptProducts_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-hover table-bordered table-responsive table-info table-striped">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Product</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Description</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%#Eval("Id")%></td>
                                <td>
                                    <asp:Image runat="server" Width="70" ImageUrl='<%#Eval("Image")%>' />
                                </td>
                                <td><%#Eval("ProductName")%></td>
                                <td><%#Eval("Price")%></td>
                                <td><%#Eval("Description")%> </td>
                               
                                <td>
                                    <asp:LinkButton runat="server" CssClass="btn btn-success btn-sm my-2" CommandName="Edit" CommandArgument='<%#Eval("Id")%>'>Edit</asp:LinkButton>

                                    <asp:LinkButton runat="server" CssClass="btn btn-danger btn-sm" CommandName="Delete" CommandArgument='<%#Eval("Id")%>'>Delete</asp:LinkButton>
                                </td>
                            </tr>
                        </tbody>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>

        </div>
    </div>
</asp:Content>
