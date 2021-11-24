<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rating.aspx.cs" Inherits="FYP_EATERYINFO.Rating" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--<link rel="stylesheet" href="Rating.css">--%>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Barlow+Semi+Condensed" rel="stylesheet">

    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <%--    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">--%>

    <style>
        .Star {
            background-image: url(images/Others/Star.gif);
            height: 17px;
            width: 17px;
        }

        .WaitingStar {
            background-image: url(images/Others/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }

        .FilledStar {
            background-image: url(images/Others/FilledStar.gif);
            height: 17px;
            width: 17px;
        }

        .center {
            margin: auto;
            width: 100%;
            padding: 10px;
            text-align: center;
        }

        .glyphicon {
            margin-right: 5px;
        }

        .rating .glyphicon {
            font-size: 22px;
        }

        .rating-num {
            margin-top: 0px;
            font-size: 54px;
        }

        .rating-desc .col-md-3 {
            padding-right: 0px;
        }

        .sr-only {
            margin-left: 5px;
            overflow: visible;
            clip: auto;
        }

        button {
            background-color: #6A1B9A;
            color: #ffffff;
            border: none;
            border-radius: 50%;
            padding: 10px 20px;
            font-size: 17px;
            font-family: Raleway;
            cursor: pointer
        }

            button:hover {
                opacity: 0.8
            }

            button:focus {
                outline: none !important
            }

        .ajaxtoolkit {
            position: absolute;
            left: 50%;
            margin-left: -40px;
        }
    </style>

    <div class="center">

        <div class="container mt-5">
            <div class="row d-flex justify-content-center align-items-center">
                <div class="col-md-8">

                    <h2 id="register">Review Form</h2>

                    <br />

                    <div class="ajaxtoolkit">
                        <ajaxToolkit:Rating ID="Rating1" runat="server" AutoPostBack="true"
                            StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                            FilledStarCssClass="FilledStar" CurrentRating="3">
                        </ajaxToolkit:Rating>
                    </div>

                    <br />
                    <br />

                    <p>
                        <asp:TextBox runat="server" ID="txtreview" TextMode="MultiLine" placeholder="Leave us your review here....." Width="1000px" Height="100px"></asp:TextBox>
                    </p>

                    <br />

                    <asp:Button runat="server" Text="Submit Review" ID="btnsubmit" OnClick="btnsubmit_Click" />

                    <asp:Label ID="lbl_review" runat="server" Text=""></asp:Label>

                    <br />
                    <br />

                    <div>
                        <span class="glyphicon glyphicon-user">
                            <asp:Label ID="lbresultusers" runat="server" Text=""></asp:Label></span>
                    </div>

                    <br />

                    <div>
                        <span class="glyphicon glyphicon-star">
                            <asp:Label ID="lbresultaverage" runat="server" Text=""></asp:Label></span>
                    </div>

                    <br />

                    <table border="1" style="margin-left: 65px">

                        <tr>
                            <th style="padding-right: 40px; padding-left: 40px; padding-top: 10px; padding-bottom: 10px"><span class="glyphicon glyphicon-star"></span>1</th>
                            <th style="padding-right: 40px; padding-left: 40px; padding-top: 10px; padding-bottom: 10px"><span class="glyphicon glyphicon-star"></span>2</th>
                            <th style="padding-right: 40px; padding-left: 40px; padding-top: 10px; padding-bottom: 10px"><span class="glyphicon glyphicon-star"></span>3</th>
                            <th style="padding-right: 40px; padding-left: 40px; padding-top: 10px; padding-bottom: 10px"><span class="glyphicon glyphicon-star"></span>4</th>
                            <th style="padding-right: 40px; padding-left: 40px; padding-top: 10px; padding-bottom: 10px"><span class="glyphicon glyphicon-star"></span>5</th>
                        </tr>

                        <tr>
                            <td style="padding-right: 50px; padding-left: 50px; padding-top: 10px; padding-bottom: 10px">
                                <asp:Label ID="lblrating1" runat="server" Text=""></asp:Label></td>
                            <td style="padding-right: 50px; padding-left: 50px; padding-top: 10px; padding-bottom: 10px">
                                <asp:Label ID="lblrating2" runat="server" Text=""></asp:Label></td>
                            <td style="padding-right: 50px; padding-left: 50px; padding-top: 10px; padding-bottom: 10px">
                                <asp:Label ID="lblrating3" runat="server" Text=""></asp:Label></td>
                            <td style="padding-right: 50px; padding-left: 50px; padding-top: 10px; padding-bottom: 10px">
                                <asp:Label ID="lblrating4" runat="server" Text=""></asp:Label></td>
                            <td style="padding-right: 50px; padding-left: 50px; padding-top: 10px; padding-bottom: 10px">
                                <asp:Label ID="lblrating5" runat="server" Text=""></asp:Label></td>
                        </tr>

                    </table>

                    <br />

                </div>
            </div>
        </div>
    </div>
</asp:Content>
