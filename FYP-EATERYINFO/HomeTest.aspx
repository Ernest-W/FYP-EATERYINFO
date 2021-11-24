<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomeTest.aspx.cs" Inherits="FYP_EATERYINFO.HomeTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="container">
        <div class="row">
            <center>
                <asp:TextBox ID="tb_search" runat="server"></asp:TextBox>
                <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" />
            </center>
        </div>
    </div>

    <br />
    <br />

    <%--<asp:Button ID="btn_add" runat="server" Text="Add" OnClick="btn_Add" />--%>


    <asp:GridView ID="GridView1" Cssclass="table table-hover" GridLines="None" runat="server" AutoGenerateSelectButton="True" data-toggle="modal">
        <Columns>
            <%--<asp:BoundField DataField="EateryID" HeaderText="EateryID" />
            <asp:BoundField DataField="EateryName" HeaderText="EateryName" />--%>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkdetail" href="#EateryInfopopup" data-toggle="modal" runat="server" CommandArgument='<%#Eval("EateryID")%>'>Show</asp:LinkButton>
                </ItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Favourites" runat="server" Text="Favourite it" OnClick="Favourite" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


    <%--<asp:GridView ID="GridView1" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateSelectButton="True" data-toggle="modal" OnRowCommand="Favourite">
        <Columns>
            <asp:BoundField DataField="EateryID" HeaderText="EateryID" />
            <asp:BoundField DataField="EateryName" HeaderText="EateryName" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkdetail" href="#EateryInfopopup" data-toggle="modal" runat="server" CommandArgument='<%#Eval("EateryID")%>'>Show</asp:LinkButton>
                </ItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Favourites" runat="server" Text="Favourite it" CommandName="FavouriteIt" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView> --%>



    <div class="container">
        <div class="row">
            <div class="col-sm-12">

                <div class="modal" id="EateryInfopopup" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-header">Eatery Information</h4>
                            </div>
                            <div class="modal-body">


                                <div class="card" style="width: 200px;">
                                    <div class="container">

                                        <div class="border">


                                            <div class="row">
                                                <div class="col-sm-4">
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
                                                <div class="col-sm">
                                                    <asp:TextBox ID="tb_EateryName" runat="server" BorderStyle="None" Width="150px" margin="5px"></asp:TextBox>
                                                </div>
                                                <div class="col-sm">
                                                    One of three columns
                                                </div>
                                            </div>


                                        </div>

                                    </div>

                                </div>




                                <%--                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_EateryID" runat="server" Text="EateryID : "></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="tb_EateryID" runat="server"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_timestamp" runat="server" Text="Time : "></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="tb_TimeStamp" runat="server"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_Status" runat="server" Text="Operation Status : "></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="tb_Status" runat="server"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_Record" runat="server"></asp:Label></td>
                                    </tr>
                                </table>--%>
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
    </div>



</asp:Content>
