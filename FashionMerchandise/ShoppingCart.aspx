<%@ Page Title="" Language="C#" MasterPageFile="~/Fashion.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="FashionMerchandise.ShoppingCart" %>

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
                <div class="header">
                    <div class="col-md-12 col-lg-12 ">
                        <div class="card">
                            <div class="card-header text-center" style="background-color: #328166; color: white;">
                                <h2>Fill Below Details</h2>
                            </div>
                            <div class="card-body">

                                <h4 class="Form-Group">Contact Information</h4>

                                <div class="Form-Group">
                                    <asp:Label ID="lblfname" CssClass="lbl" runat="server" Text="Customer Name "></asp:Label>
                                    <asp:TextBox ID="txtfname" CssClass="Form-Control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtfname">Customer Name is Required </asp:RequiredFieldValidator>
                                </div>

                                <div class="Form-Group">
                                    <asp:Label ID="lblemail" CssClass="lbl" runat="server" Text="Email Address "></asp:Label>
                                    <asp:TextBox ID="txtemail" CssClass="Form-Control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtemail"> Email is Required </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtemail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                </div>

                             

                                <div class="Form-Group">
                                    <asp:Label ID="lblphone" CssClass="lbl" runat="server" Text="Phone Number "></asp:Label>
                                    <asp:TextBox ID="txtphone" CssClass="Form-Control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtphone">Phone Number is Required </asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ControlToValidate="txtphone" ForeColor="Red" ErrorMessage="Please Enter 10 Digit Phone Number Ex - 9910203040"
                                        ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>

                                <h4 class="Form-Group">Billing Address</h4>
                                <div class="Form-Group">
                                    <asp:Label ID="lbladdress" CssClass="lbl" runat="server" Text="Address "></asp:Label>
                                    <asp:TextBox ID="txtaddress" CssClass="Form-Control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtaddress">Address is Required </asp:RequiredFieldValidator>
                                </div>

                                <asp:Label runat="server">House/Plot No.</asp:Label>
                                <asp:TextBox runat="server" ID="txthouseno" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="txthouseno">House/Plot No. is Required </asp:RequiredFieldValidator>

                                <div class="Form-Group">
                                    <asp:Label ID="lblcity" CssClass="lbl" runat="server" Text="City "></asp:Label>
                                    <asp:TextBox ID="txtcity" CssClass="Form-Control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtcity">City is Required </asp:RequiredFieldValidator>
                                </div>

                                <div class="Form-Group">
                                    <asp:Label ID="lblstate" CssClass="lbl" runat="server" Text="State "></asp:Label>
                                    <asp:TextBox ID="txtstate" CssClass="Form-Control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtstate"> State is Required </asp:RequiredFieldValidator>
                                </div>

                                 <div class="Form-Group">
                                    <asp:Label ID="lblzipcode" CssClass="lbl" runat="server" Text="Zip Code"></asp:Label>
                                    <asp:TextBox ID="txtZipcode" CssClass="Form-Control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtZipcode"> Zip Code is Required </asp:RequiredFieldValidator>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


            </div>

    <section class="h-100" style="background-color: #eee;">
        <div class="container h-100 py-5">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12">

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3 class="fw-normal mb-0 text-black">Shopping Cart</h3>
                    </div>

                    <asp:Repeater runat="server" ID="RptShoppingCart" OnItemCommand="RptShoppingCart_ItemCommand">
                        <ItemTemplate>
                            <div class="card rounded-3 mb-4">
                                <div class="card-body p-4">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img src='<%# Eval("Image") %>' class="img-fluid w-50 rounded-3" alt="Cotton T-shirt" />
                                        </div>
                                        <div class="col-md-2 col-lg-2 col-xl-1">
                                            <p class="fw-normal mb-2"><%# Eval("Product") %></p>
                                        </div>


                                        <div class="col-md-2 col-lg-2 col-xl-2 d-flex">

                                            <asp:LinkButton runat="server" ID="lknMinus" CommandName="ProductMinus" CommandArgument='<%# Eval("Id") %>'><i class="fa fa-minus mr-2 mt-2"></i></asp:LinkButton>

                                            <asp:TextBox ID="txtQuantity" runat="server" ReadOnly="true" Text='<%# Eval("Qty") %>' CssClass="form-control-sm w-50 text-center text-capitalize"></asp:TextBox>

                                            <asp:LinkButton runat="server" ID="lknPlus" CommandName="ProductAdd" CommandArgument='<%# Eval("Id") %>'><i class="fa fa-plus ml-2 mt-2"></i></asp:LinkButton>
                                        </div>
                                        <div class="col-md-3 row col-lg-3 col-xl-3">
                                            <h5 class="mb-0"><%# Eval("Price") %></h5>
                                            <h5 class="mb-0 ml-5"><%# Eval("Total") %></h5>
                                        </div>

                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <asp:LinkButton runat="server" CssClass="text-danger" CommandName="ProductDelete" CommandArgument='<%# Eval("Id") %>' ID="lknDelete"><i class="fa fa-trash fa-lg"></i></asp:LinkButton>
                                        </div>
                                        <p class="bg-white text-white" runat="server"><%#Eval("Id")%></p>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="float-md-right font-weight-bold">
                        <label>Total Amount</label>
                        <asp:TextBox runat="server" CssClass="form-control font-weight-bold w-50" ReadOnly="true" ID="txtSubTotal"></asp:TextBox>
                    </div>
                </div>
            </div>


            
            <asp:Button runat="server" CssClass="btn btn-success bg-success mt-3" Text="Proceed To Next" ID="BtnProceed" OnClick="BtnProceed_Click" />

        </div>
    </section>
</asp:Content>
