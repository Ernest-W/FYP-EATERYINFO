<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminRating.aspx.cs" Inherits="FYP_EATERYINFO.AdminRating" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lbl_id" runat="server" Text="ID :"></asp:Label></td>
                <td colspan="2">
                    <asp:TextBox ID="tb_id" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_Rating" runat="server" Text="Rating :"></asp:Label></td>
                <td colspan="2">
                    <asp:TextBox ID="tb_Rating" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lbl_Review" runat="server" Text="Review :"></asp:Label></td>
                <td colspan="2">
                    <asp:TextBox ID="tb_Review" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td colspan="1"></td>
                <td colspan="3">
                    <asp:Button Text="Delete" ID="btnDelete" runat="server" OnClick="btnDelete_Click" />
                    <asp:Button Text="Clear" ID="btnClear" runat="server" OnClick="btnClear_Click" />
                </td>
            </tr>
        </table>
    </div>

    <div>
        <span class="glyphicon glyphicon-user">
            <asp:Label ID="lbresultusers" runat="server" Text=""></asp:Label></span>
    </div>

    <br />

    <div>
        <span class="glyphicon glyphicon-star">
            <asp:Label ID="lbresultaverage" runat="server" Text=""></asp:Label></span>
    </div>

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


    <asp:GridView ID="gvRatingInfo" runat="server" AutoGenerateColumns="false" cellwidth="100" cellheight="100" AllowPaging="true" PageSize="20" OnPageIndexChanging="gvRatingInfo_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" />
            <asp:BoundField DataField="rating" HeaderText="Rating" />
            <asp:BoundField DataField="review" HeaderText="Review" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" Text="Select" OnClick="RatingSelect_Click" ID="EaterySelect" CommandArgument='<%# Eval("id") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Label ID="lbl_successmessage" runat="server" Text="" ForeColor="Green"></asp:Label>

</asp:Content>
