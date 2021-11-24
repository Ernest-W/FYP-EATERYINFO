<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FYP_EATERYINFO.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <link rel="stylesheet" href="/register.css" type="text/css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://www.google.com/recaptcha/api.js?render=6LdntPscAAAAAOjYeoBAzdPJMjJq_rOKUv2vjtUQ"></script>

    </head>
    <style>
        body{
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <body>
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Create an account</h2>
                <p class="text-uppercase text-center mb-5">&nbsp;</p>

              <form>

                <div class="form-outline mb-4">
                  &nbsp;<label class="form-label" for="form3Example1cg">Name</label>
                    <asp:TextBox ID="tbName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="lbl_name_err" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                </div>

                <div class="form-outline mb-4">
                  &nbsp;<label class="form-label" for="form3Example3cg">Email</label>
                    <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="lbl_emailrg_err" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                </div>

                <div class="form-outline mb-4">
                  &nbsp;<label class="form-label" for="form3Example4cg">Password</label>
                    <asp:TextBox ID="tbPwd" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="lbl_pwd1_err" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                </div>

                <div class="form-outline mb-4">
                  &nbsp;<label class="form-label" for="form3Example4cdg">Repeat your password</label>
                    <asp:TextBox ID="tbRepeatPwd" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="lbl_pwd2_err" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                    
                &nbsp;</div>

                <!--<div class="form-check d-flex justify-content-center mb-5">
                  <input
                    class="form-check-input me-2"
                    type="checkbox"
                    value=""
                    id="form2Example3cg"
                  />-->
                <!--<div>
                   &nbsp;</div>
                  <label class="form-check-label" for="form2Example3g">
                    I agree all statements in <a href="#!" class="text-body"><u>Terms of service</u></a>
                  </label>
                </div>-->

                <div class="d-flex justify-content-center">
                    <script type="text/javascript">
                        document.getElementById("registerBtn").onclick = function () {
                            location.href = "/Home.aspx";
                        };
                    </script>
                    <asp:Button ID="btnSignup" runat="server" Text="Sign Up" CssClass="btn btn-small btn-primary" OnClick="btnSignup_Click" />
                    <br />
                    <asp:Label ID="lbl_sql_err" runat="server" Text="lbl_sql_err"></asp:Label>
                    <br />
                    <!--<asp:Label ID="lbl_gScore" runat="server" Text="Label" Visible="False"></asp:Label>-->
                </div>

                <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response"/>
                <script>
                    grecaptcha.ready(function () {
                        grecaptcha.execute('6LdntPscAAAAAOjYeoBAzdPJMjJq_rOKUv2vjtUQ', { action: 'Login' }).then(function (token) {
                            document.getElementById("g-recaptcha-response").value = token;
                        });
                    });
                </script>


                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="#!" class="fw-bold text-body"><u id="loginBtn">Login here</u></a></p>
                <script type="text/javascript">
                    document.getElementById("loginBtn").onclick = function() {
                        //alert('test');
                        location.href = "/Login.aspx";
                    };
                </script>
              

            </div>
          </div>
        </div>
      </div>
    </div>
</body>
    </div>
</asp:Content>
