<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RatingsNew.aspx.cs" Inherits="FYP_EATERYINFO.RatingsNew" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="RatingsNew.css">

    <div class="center">

        <div class="container mt-5">
            <div class="row d-flex justify-content-center align-items-center">
                <div class="col-md-8">


                    <h2 id="register">Feedback Form</h2>

                    <br />

                    <asp:Rating ID="Rating1" runat="server" AutoPostBack="true"
                        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                        FilledStarCssClass="FilledStar">
                    </asp:Rating>

                    <br />
                    <br />

                    <p>
                        <asp:TextBox runat="server" ID="txtreview" TextMode="MultiLine" placeholder="Leave us your review here....." Width="1000px" Height="100px"></asp:TextBox>
                    </p>

                    <br />

                    <asp:Button runat="server" Text="Submit Review" ID="btnsubmit" OnClick="btnsubmit_Click" />

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

                    <table border="1" style="margin-left: 5px">

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
