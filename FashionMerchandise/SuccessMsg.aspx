<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuccessMsg.aspx.cs" Inherits="FashionMerchandise.SuccessMsg1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
      body {
        text-align: center;
        padding: 40px 0;
        background: #EBF0F5;
      }
        h1 {
          color: #88B04B;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-weight: 900;
          font-size: 40px;
          margin-bottom: 10px;
        }
        p {
          color: #404F5E;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-size:20px;
          margin: 0;
        }
        .homepage{
                font-size: 22px;
  
    color: blueviolet;
}
        
      i {
        color: #9ABC66;
        font-size: 100px;
        line-height: 200px;
        margin-left:-15px;
      }
      .card {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
      }
          .card-header {

              border-radius:200px; height:200px; width:200px; background: #5c7a1f; margin:0 auto;
          }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
      <div class="card-header">
        <i class="checkmark">✓</i>
      </div>
        <h1>Success</h1> 
        <p>Your order has been placed successfully;<br/>Please Visit Again! <br /><br />Thanks</p>

            <div class="homepage">
          <a href="Home.aspx"> Go To Home Page</a></div>
      </div>

    </form>
</body>
</html>
