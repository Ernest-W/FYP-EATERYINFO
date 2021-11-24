<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomeReal.aspx.cs" Inherits="FYP_EATERYINFO.HomeReal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
        function targetMeBlank() {
            document.forms[0].target = "_blank";
        }
    </script>

    <!-- Start slides -->
    <div id="slides" class="cover-slides">
        <ul class="slides-container">
            <li class="text-center">
                <img src="images/slider-01.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To
                                <br>
                                EateryInfo</strong></h1>
                            <%--                            <p class="m-b-40">
                                See how your users experience your website in realtime or view 
                                <br>
                                trends to see any changes in performance over time.
                            </p>--%>
                            <p><a class="btn btn-lg btn-circle btn-outline-new-white" href="#">View Eatery</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="images/slider-02.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To
                                <br>
                                EateryInfo</strong></h1>
                            <%--                            <p class="m-b-40">
                                See how your users experience your website in realtime or view 
                                <br>
                                trends to see any changes in performance over time.
                            </p>--%>
                            <p><a class="btn btn-lg btn-circle btn-outline-new-white" href="#">View Eatery</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="images/slider-03.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To
                                <br>
                                EateryInfo</strong></h1>
                            <%--                            <p class="m-b-40">
                                See how your users experience your website in realtime or view 
                                <br>
                                trends to see any changes in performance over time.
                            </p>--%>
                            <p><a class="btn btn-lg btn-circle btn-outline-new-white" href="#">View Eatery</a></p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End slides -->

    <br />
    <br />
    <br />

    <!-- Start QT -->
    <div class="qt-box qt-background">
        <div class="container">
            <div class="row">
                <div class="col-md-8 ml-auto mr-auto text-left">
                    <p class="lead ">
                        " Everything you need to know about eateries are there at your fingertips. The days of getting inaccurate information from other websites are long gone. "
                    </p>
                    <span class="lead">~ Team Digital Distruptors ~</span>
                </div>
            </div>
        </div>
    </div>
    <!-- End QT -->

    <!-- Start Menu -->
    <div class="menu-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="heading-title text-center">
                        <h2>Featured Eateries</h2>
                    </div>
                </div>
            </div>

            <div class="row special-list">
                <div class="col-lg-4 col-md-6 special-grid drinks">
                    <div class="gallery-single fix">
                        <img src="images/Others/f1.png" class="img-fluid" alt="Image" style="width:350px; height:200px;">
                        <div class="why-text">
                            <h4>
                                <center>Yummo Chow SG</center>
                            </h4>
                            <center>
                                <asp:Button ID="Button1" runat="server" OnClick="btn1_click" OnClientClick="targetMeBlank()" Text="Website" CssClass="btn btn-primary" />
                                <asp:Button ID="Button2" runat="server" OnClick="btn2_click" OnClientClick="targetMeBlank()" Text="Direction" CssClass="btn btn-primary" />
                            </center>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 special-grid drinks">
                    <div class="gallery-single fix">
                        <img src="images/Others/f2.png" class="img-fluid" alt="Image" style="width:350px; height:200px;">
                        <div class="why-text">
                            <h4>
                                <center>Charlie's Restaurant & Bar</center>
                            </h4>
                            <center>
                                <asp:Button ID="Button3" runat="server" OnClick="btn3_click" OnClientClick="targetMeBlank()" Text="Website" CssClass="btn btn-primary" />
                                <asp:Button ID="Button4" runat="server" OnClick="btn4_click" OnClientClick="targetMeBlank()" Text="Direction" CssClass="btn btn-primary" />
                            </center>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 special-grid drinks">
                    <div class="gallery-single fix">
                        <img src="images/Others/f3.png" class="img-fluid" alt="Image" style="width:350px; height:200px;">
                        <div class="why-text">
                            <h4>
                                <center>Hongdae Oppa Korean Dining @ Plaza Singapura</center>
                            </h4>
                            <center>
                                <asp:Button ID="Button5" runat="server" OnClick="btn5_click" OnClientClick="targetMeBlank()" Text="Website" CssClass="btn btn-primary" />
                                <asp:Button ID="Button6" runat="server" OnClick="btn6_click" OnClientClick="targetMeBlank()" Text="Direction" CssClass="btn btn-primary" />
                            </center>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 special-grid lunch">
                    <div class="gallery-single fix">
                        <img src="images/Others/f4.png" class="img-fluid" alt="Image" style="width:350px; height:200px;">
                        <div class="why-text">
                            <h4>
                                <center>Brewerkz @ Indoor Stadium</center>
                            </h4>
                            <center>
                                <asp:Button ID="Button7" runat="server" OnClick="btn7_click" OnClientClick="targetMeBlank()" Text="Website" CssClass="btn btn-primary" />
                                <asp:Button ID="Button8" runat="server" OnClick="btn8_click" OnClientClick="targetMeBlank()" Text="Direction" CssClass="btn btn-primary" />
                            </center>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 special-grid lunch">
                    <div class="gallery-single fix">
                        <img src="images/Others/f5.png" class="img-fluid" alt="Image" style="width:350px; height:200px;">
                        <div class="why-text">
                            <h4>
                                <center>Anjappar @ Race Course Road</center>
                            </h4>
                            <center>
                                <asp:Button ID="Button9" runat="server" OnClick="btn9_click" OnClientClick="targetMeBlank()" Text="Website" CssClass="btn btn-primary" />
                                <asp:Button ID="Button10" runat="server" OnClick="btn10_click" OnClientClick="targetMeBlank()" Text="Direction" CssClass="btn btn-primary" />
                            </center>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 special-grid lunch">
                    <div class="gallery-single fix">
                        <img src="images/Others/f6.png" class="img-fluid" alt="Image" style="width:350px; height:200px;">
                        <div class="why-text">
                            <h4>
                                <center>Manchurian Lamb Hotpot - Man Zu Quan Yang Pu (满族全羊铺)</center>
                            </h4>
                            <center>
                                <asp:Button ID="Button11" runat="server" OnClick="btn11_click" OnClientClick="targetMeBlank()" Text="Website" CssClass="btn btn-primary" />
                                <asp:Button ID="Button12" runat="server" OnClick="btn12_click" OnClientClick="targetMeBlank()" Text="Direction" CssClass="btn btn-primary" />
                            </center>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- End Menu -->

    <!-- Start Gallery -->
    <div class="gallery-box">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="heading-title text-center">
                        <h2>Gallery</h2>
                    </div>
                </div>
            </div>
            <div class="tz-gallery">
                <div class="row">
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <a class="lightbox" href="images/Others/Blur1.png">
                            <img class="img-fluid" src="images/Others/Blur1.png" alt="Gallery Images">
                        </a>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-4">
                        <a class="lightbox" href="images/Others/Blur2.png">
                            <img class="img-fluid" src="images/Others/Blur2.png" alt="Gallery Images">
                        </a>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-4">
                        <a class="lightbox" href="images/Others/Blur3.png">
                            <img class="img-fluid" src="images/Others/Blur3.png" alt="Gallery Images">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Gallery -->

    <!-- Start Customer Reviews -->
    <div class="customer-reviews-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="heading-title text-center">
                        <h2>Customer Reviews</h2>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 mr-auto ml-auto text-center">
                    <div id="reviews" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner mt-4">
                            <div class="carousel-item text-center active">
                                <div class="img-box p-1 border rounded-circle m-auto">
                                    <img class="d-block w-100 rounded-circle" src="images/profile-1.jpg" alt="">
                                </div>
                                <h5 class="mt-4 mb-0"><strong class="text-warning text-uppercase">Paul Mitchel</strong></h5>
                                <h6 class="text-dark m-0">Web Developer</h6>
                                <p class="m-0 pt-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at, luctus dui. Mauris magna metus, dapibus nec turpis vel, semper malesuada ante. Idac bibendum scelerisque non non purus. Suspendisse varius nibh non aliquet.</p>
                            </div>
                            <div class="carousel-item text-center">
                                <div class="img-box p-1 border rounded-circle m-auto">
                                    <img class="d-block w-100 rounded-circle" src="images/profile-3.jpg" alt="">
                                </div>
                                <h5 class="mt-4 mb-0"><strong class="text-warning text-uppercase">Steve Fonsi</strong></h5>
                                <h6 class="text-dark m-0">Web Designer</h6>
                                <p class="m-0 pt-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at, luctus dui. Mauris magna metus, dapibus nec turpis vel, semper malesuada ante. Idac bibendum scelerisque non non purus. Suspendisse varius nibh non aliquet.</p>
                            </div>
                            <div class="carousel-item text-center">
                                <div class="img-box p-1 border rounded-circle m-auto">
                                    <img class="d-block w-100 rounded-circle" src="images/profile-7.jpg" alt="">
                                </div>
                                <h5 class="mt-4 mb-0"><strong class="text-warning text-uppercase">Daniel vebar</strong></h5>
                                <h6 class="text-dark m-0">Seo Analyst</h6>
                                <p class="m-0 pt-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at, luctus dui. Mauris magna metus, dapibus nec turpis vel, semper malesuada ante. Idac bibendum scelerisque non non purus. Suspendisse varius nibh non aliquet.</p>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#reviews" role="button" data-slide="prev">
                            <i class="fa fa-angle-left" aria-hidden="true"></i>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#reviews" role="button" data-slide="next">
                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Customer Reviews -->

    <!-- Start Contact info -->
    <div class="contact-imfo-box">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <i class="fa fa-volume-control-phone"></i>
                    <div class="overflow-hidden">
                        <h4>Phone</h4>
                        <p class="lead">
                            +65 9876 5432
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <i class="fa fa-envelope"></i>
                    <div class="overflow-hidden">
                        <h4>Email</h4>
                        <p class="lead">
                            EateryInfo@admin.com
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <i class="fa fa-map-marker"></i>
                    <div class="overflow-hidden">
                        <h4>Location</h4>
                        <p class="lead">
                            180 Ang Mo Kio Ave 8, Singapore 569830
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Contact info -->

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>

</asp:Content>
