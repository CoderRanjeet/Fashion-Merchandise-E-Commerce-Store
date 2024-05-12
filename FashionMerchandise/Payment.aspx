<%@ Page Title="" Language="C#" MasterPageFile="~/Fashion.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="FashionMerchandise.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="card w-50 mx-auto text-center">
            <div class="card-header" style="background-color: cadetblue;color: white;">
                <h2>Order Information</h2>
            </div>
            <div class="card-body">
            <div class="row">
                <div class="col-md-5">
                    <asp:Label runat="server" CssClass="font-weight-bold">Customer Name - </asp:Label>
                </div>
                <div class="col-md-5">
                    <asp:Label runat="server" ID="lblname"></asp:Label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5">
                    <asp:Label runat="server" CssClass="font-weight-bold">Customer Email - </asp:Label>
                </div>
                <div class="col-md-5">

                    <asp:Label runat="server" ID="lblemail"></asp:Label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5">
                    <asp:Label runat="server" CssClass="font-weight-bold">Customer Phone - </asp:Label>
                </div>
                <div class="col-md-5">
                    <asp:Label runat="server" ID="lblPhone"></asp:Label>
                </div>
            </div>

            <div class="mt-3">
                <asp:Label runat="server" CssClass="font-weight-bold"> Your Total Bill - </asp:Label>
                <asp:Label runat="server" ID="lblbill"></asp:Label>
            </div>

            <div class="mt-3 mb-3">
                <asp:Label runat="server" CssClass="font-weight-bold"> Payment Mode - </asp:Label>
                <asp:Label runat="server" ID="Label1">Cash On Delivery</asp:Label>
            </div>

            <div class="row mb-3">
                <asp:Button runat="server" ID="BtnOrder" OnClick="BtnOrder_Click" CssClass="btn btn-success bg-success" Text="Continue to Order" />

                <asp:Button runat="server" ID="BtnCancel" OnClick="BtnCancel_Click" CssClass="btn btn-danger bg-danger" Text="Cancel Order" />
            </div>
        </div></div>
    </div>


</asp:Content>
