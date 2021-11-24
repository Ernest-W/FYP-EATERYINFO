<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoggedIn.aspx.cs" Inherits="FYP_EATERYINFO.LoggedIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
   
    <asp:TextBox ID="tb_new_name" runat="server" Visible="False">Enter your name here</asp:TextBox>
    <asp:Button ID="btnAddName" runat="server" OnClick="btnAddName_Click" Text="Submit" Visible="False" />
    <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" />


</asp:Content>
