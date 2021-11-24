<%@ Page Async="true" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FYP_EATERYINFO.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%--<meta name="google-signin-client_id" content="17835569399-d1i25p8gva3c83k7fffcskfcidousl8g.apps.googleusercontent.com">--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="/login.css" type="text/css">
    <script src="https://www.google.com/recaptcha/api.js?render=6LedoPscAAAAAOc-NTQeYHkvZZ_v8IZoX0qbLV2T"></script>


    <script>
        function getParameter(parameterName)
        {
            let parameters = new URLSearchParams(window.location.search);
            return parameters.get(parameterName)
        }
    </script>

    <script type="text/javascript">

        $(document).ready(function () {
            history.pushState({ page: 1 }, "title 1", "#nbb");
            window.onhashchange = function (event) {
                window.location.hash = "nbb";
            };
        });
    </script>
</head>


<body>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%--<script type="text/javascript" src="login.js"></script>--%>
    <div id="logreg-forms">
        <form class="form-signin">
            <!--<h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign in</h1>-->
        <div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
              <div class="card-body p-4 p-sm-5">
                <h5 class="card-title text-center mb-5 fw-light fs-5">Sign In</h5>
                <!-- New Codes -->
                  <div class="form-floating mb-3">
                    &nbsp;<label for="floatingInput">Email address</label>
                      <br />
                      <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                      <asp:Label ID="lbl_email_err" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                  </div>
                  <div class="form-floating mb-3">
                    &nbsp;<label for="floatingPassword">Password</label>
                      <br />
                      <asp:TextBox ID="tbPwd" runat="server" TextMode="Password"></asp:TextBox>
                      <asp:Label ID="lbl_pwd_err" runat="server" Text="Label" ForeColor="#FF3300"></asp:Label>
                  </div>
                  <div>
                   &nbsp;<br> 
                  </div>
                      <asp:Button ID="btnSignin" runat="server" Text="Sign In" OnClick="btnSignin_Click" />
                  <br />
                  <asp:Label ID="lbl_sql_err" runat="server" Text="lbl_sql_err"></asp:Label>
                  <br />
                  <!--<asp:Label ID="lbl_gScore" runat="server"></asp:Label>-->
                  </div>

                <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response"/>
                <script>
                    grecaptcha.ready(function () {
                        grecaptcha.execute('6LedoPscAAAAAOc-NTQeYHkvZZ_v8IZoX0qbLV2T', { action: 'Login' }).then(function (token) {
                            document.getElementById("g-recaptcha-response").value = token;
                        });
                    });
                </script>  
               
                    <div class="social-login">
                        <%--<div class="g-signin2" data-onsuccess="RedirectToLogin_Click">--%>
                        <%--<asp:LinkButton ID="lnkGoogle" runat="server" data-provider="google" 
                        Text="Login with Google" onclick="RedirectToLogin_Click" />--%>
                    </div>
                <asp:button id="button1" runat="server" text="button" onclick="RedirectToLogin_Click" />
                

                  <hr class="my-4">
                  <div class="d-grid mb-2">
                
                    <div class="data">
                        <p>Name</p>
                        <p id="name" class="alert-alert-success"></p>
                        <p>Profile Pic</p>
                        <img id="image" class="rounded-circle" width="100" height="100" />d
                        <p>Email</p>
                        <p id="email"></p>
                        <%--<a href="#" onclick="signOut();">Sign out</a>--%>
                        <button id="btnSignout" type="button" class="btn-btn-danger" onclick="signOut();">Sign Out</button>
                    </div>
                </div>
            </div>
            </div>
        </div>
        </div>
        </div>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="/script.js"></script>
</body>
</html>
</asp:Content>
