<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FashionMerchandise.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row d-flex mt-5 justify-content-center align-items-center h-100">
                <div class="col-md-6">
                    <img src="images/SideImg.jpg" class="img-fluid" alt="Sample image" />
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header text-center">
                            <h2>Welcome to Login</h2>
                        </div>
                        <div class="card-body">
                            <div class="form-outline mb-4">
                                <label class="form-label" for="form3Example3">User Name</label>
                                <input type="text" id="txtusername" class="form-control" runat="server" placeholder="Default Username - Admin" />
                            </div>
                            <div class="form-outline mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" id="txtpassword" class="form-control" runat="server" placeholder="Default password - Admin@123" />
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <div class="form-check mb-0">
                                    <input class="form-check-input me-2" type="checkbox" />
                                    <label class="form-check-label">Remember me </label>
                                </div>
                                <a href="#!" class="text-body">Forgot password?</a>
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button type="button" class="btn btn-primary btn-lg" runat="server" id="BtnLogin" onserverclick="BtnLogin_ServerClick" style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                                <p class="small fw-bold mt-2 pt-1 mb-0">
                                    Don't have an account? <a href="#!" class="link-danger">Register</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
