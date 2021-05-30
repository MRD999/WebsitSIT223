<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Frontend.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebApplication1.Login.Profile" %>

<%@ Register Src="~/Login/ChangePasswordForms.ascx" TagPrefix="uc1" TagName="ChangePasswordForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <nav class="Title" style="height: 55px">
        <asp:Label ID="lbTitle" runat="server" Text="Profile" CssClass="lbTitle"></asp:Label>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    
    <div>
    <h3>Welcome to your profile</h3>
    <asp:Label ID="Fnamelb" runat="server" Text="First Name: "></asp:Label>
    <asp:Label ID="lbFName" runat="server" Text="Name"></asp:Label><br />
    <asp:Label ID="Lnamelb" runat="server" Text="Last Name: "></asp:Label>
    <asp:Label ID="lbLName" runat="server" Text="Name"></asp:Label><br />
    <asp:Label ID="UserNamelb" runat="server" Text="UserName: "></asp:Label>
    <asp:Label ID="lblUserName" runat="server" Text="Name"></asp:Label><br />
    <br /><br />
   
    <asp:Button ID="signOutButton" runat="server" Text="SignOut" OnClick="signOutButton_Click" />
        <uc1:ChangePasswordForms runat="server" id="ChangePasswordForms" />
    </div>


</asp:Content>