<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Favorite.aspx.cs" Inherits="FYP_EATERYINFO.Favourite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class ="form-group">

        
        <div class="row">
            
                <asp:TextBox ID="tb_search" CssClass="form-control" runat="server"></asp:TextBox> &nbsp; &nbsp;
                <asp:Button ID="btn_search" CssClass="btn btn-primary" runat="server" Text="Search" />
            </div>
        
    

    <br />
    <br />

    <asp:GridView ID="GridView1" Cssclass="table table-hover" GridLines="None" runat="server" AutoGenerateSelectButton="True" data-toggle="modal" >
        <Columns>
            <asp:BoundField DataField="EateryID" HeaderText="EateryID" />
            <asp:BoundField DataField="EateryName" HeaderText="EateryName" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkdetail" href="#EateryInfopopup" data-toggle="modal" runat="server" CommandArgument='<%#Eval("EateryID")%>'>Show</asp:LinkButton>
                </ItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="Favourites" runat="server" OnClick="Unfavourite"><span class="badge badge-warning">Unfavourite it</span></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
    </div>
</asp:Content>
