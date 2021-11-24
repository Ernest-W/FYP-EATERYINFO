<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEatery.aspx.cs" Inherits="FYP_EATERYINFO.AddEatery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <asp:HiddenField ID="hfID" runat="server" />
        <table>
            <tr>
                <td><asp:Label ID="EateryID" runat="server" Text="EateryID :"></asp:Label></td>
                <td colspan="2"><asp:TextBox ID="tb_EateryID" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_EateryName" runat="server" Text="EateryName :"></asp:Label></td>
                <td colspan="2"><asp:TextBox ID="tb_EateryName" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td><asp:Label ID="lbl_Address" runat="server" Text="Address :"></asp:Label></td>
                <td colspan="2"><asp:TextBox ID="tb_Address" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td><asp:Label ID="lbl_Latitude" runat="server" Text="Latitude :"></asp:Label></td>
                <td colspan="2"><asp:TextBox ID="tb_Latitude" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td><asp:Label ID="lbl_Longtitude" runat="server" Text="Longtitude :"></asp:Label></td>
                <td colspan="2"><asp:TextBox ID="tb_Longtitude" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td><asp:Label ID="lbl_Descriptions" runat="server" Text="Description :"></asp:Label></td>
                <td colspan="2"><asp:TextBox ID="tb_Descriptions" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="1"></td>
                <td colspan="3">
                    <asp:Button Text="Update" ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" />
                    <asp:Button Text="Save" ID="btnSave" runat="server" OnClick="btnSave_Click" />
                    <asp:Button Text="Delete" ID="btnDelete" runat="server" OnClick="btnDelete_Click" />
                    <asp:Button Text="Clear" ID="btnClear" runat="server" OnClick="btnClear_Click" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2"><asp:Label ID="lbl_successmessage" runat="server" Text="" ForeColor="Green"></asp:Label></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2"><asp:Label ID="lbl_errormessage" runat="server" Text="" ForeColor="Red"></asp:Label></td>
            </tr>
        </table>
        <br/. />
        <asp:GridView ID="gvEateryInfo" runat="server" AutoGenerateColumns="false" cellwidth="100" cellheight="100">
            <Columns>
                <asp:BoundField DataField="EateryID" HeaderText="EateryID"/>
                <asp:BoundField DataField="EateryName" HeaderText="EateryName"/>
                <asp:BoundField DataField="Address" HeaderText="Address"/>
                <asp:BoundField DataField="Latitude" HeaderText="Latitude"/>
                <asp:BoundField DataField="Longtitude" HeaderText="Longtitude"/>
                <asp:BoundField DataField="Descriptions" HeaderText="Description"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" Text="Select" OnClick="EaterySelect_Click" ID="EaterySelect" CommandArgument='<%# Eval("EateryID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>