<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FYP_EATERYINFO.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Home.css">

    <br />
    <br />

    <div class="container">
        <div class="row">
            <center>
                <asp:TextBox ID="tb_search" runat="server" Height="21px"></asp:TextBox>
                <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" />
            </center>
        </div>
    </div>

    <br />
    <br />

    <asp:GridView ID="GridView1" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" data-target="#EateryInfopopup" data-toggle="modal">
        <%--        <Columns>
            <asp:BoundField DataField="EateryID" HeaderText="EateryID" />
            <asp:BoundField DataField="EateryName" HeaderText="EateryName" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkdetail" href="#EateryInfopopup" data-toggle="modal" runat="server" CommandArgument='<%#Eval("EateryID")%>'>Show</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>--%>
    </asp:GridView>


    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12">

                <div class="modal" id="EateryInfopopup" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content" style="height: 200px; width: 700px;">
                            <div class="modal-header">
                                <button class="close" data-dismiss="modal">&times;</button>
                                <%--<h4 class="modal-header"><center>Eatery Information</center></h4>--%>
                            </div>
                            <br />
                            <div class="modal-body">

                                <div class="card">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-4 col-sm-4">
                                                <div class="slider">
                                                    <div class="slides">
                                                        <!--Radio button start -->
                                                        <input type="radio" name="radio-btn" id="radio1">
                                                        <input type="radio" name="radio-btn" id="radio2">
                                                        <input type="radio" name="radio-btn" id="radio3">
                                                        <input type="radio" name="radio-btn" id="radio4">
                                                        <input type="radio" name="radio-btn" id="radio5">
                                                        <!--Radio button end -->

                                                        <!--Slides iamges start -->
                                                        <div class="slide first">
                                                            <img src="/EateryImages/E002/E002_01.png" alt="E002_01">
                                                        </div>
                                                        <div class="slide">
                                                            <img src="/EateryImages/E002/E002_02.png" alt="E002_02">
                                                        </div>
                                                        <div class="slide">
                                                            <img src="/EateryImages/E002/E002_03.png" alt="E002_03">
                                                        </div>
                                                        <div class="slide">
                                                            <img src="/EateryImages/E002/E002_04.png" alt="E002_04">
                                                        </div>
                                                        <div class="slide">
                                                            <img src="/EateryImages/E002/E002_05.png" alt="E002_05">
                                                        </div>
                                                        <!--Slides iamges end -->

                                                        <!--Automatic navigation start -->
                                                        <div class="navigation-auto">
                                                            <div class="auto-btn1"></div>
                                                            <div class="auto-btn2"></div>
                                                            <div class="auto-btn3"></div>
                                                            <div class="auto-btn4"></div>
                                                            <div class="auto-btn5"></div>
                                                        </div>
                                                        <!--Automatic navigation end -->

                                                        <!--Maunal navigation start -->
                                                        <div class="navigation-manual">
                                                            <label for="radio1" class="manual-btn"></label>
                                                            <label for="radio2" class="manual-btn"></label>
                                                            <label for="radio3" class="manual-btn"></label>
                                                            <label for="radio4" class="manual-btn"></label>
                                                            <label for="radio5" class="manual-btn"></label>
                                                        </div>
                                                        <!--Automatic navigation end -->

                                                    </div>
                                                    <!--Image Slider end -->

                                                    <script type="text/javascript">
                                                        var counter = 1;
                                                        setInterval(function () {
                                                            document.getElementById('radio' + counter).checked = true;
                                                            counter++
                                                            if (counter > 5) {
                                                                counter = 1;
                                                            }
                                                        }, 5000);
                                                    </script>


                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-lg-6">

                                                <div class="row">
                                                    <asp:Label ID="lbl_EateryName" runat="server" Width="250px" Text="Eatery"></asp:Label>
                                                </div>

                                                <div class="row">
                                                    <asp:Label ID="lbl_Address" runat="server" Width="250px" Text="Address"></asp:Label>
                                                </div>

                                                <div class="row">
                                                    <asp:Label ID="lbl_Description" runat="server" Width="250px" Text="Description"></asp:Label>
                                                </div>

                                                <div class="row">
                                                    <asp:Label ID="lbl_Status" runat="server" Width="250px" Text="Status"></asp:Label>
                                                </div>

                                                <div class="row">
                                                    <asp:Label ID="lbl_TimeStamp" runat="server" Width="250px" Text="TimeStamp"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-lg-2">

                                                <%--                                                <div class="d-flex justify-content-center">
                                                    <div class="content text-center">
                                                        <div class="ratings">
                                                            <span class="product-rating">4.6</span><span>/5</span>
                                                            <div class="stars"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></div>
                                                            <div class="rating-text"><span>
                                                                <asp:Label ID="lbl_rating" runat="server" Text=""></asp:Label></span> </div>
                                                        </div>
                                                    </div>
                                                </div>--%>


                                                <br />

                                                <asp:Button class="btn btn-outline-success" runat="server" Text="Click Here to Rate" ID="btnrate" OnClick="btnrate_Click" />

                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
