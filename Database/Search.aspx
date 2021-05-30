<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Frontend.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebApplication1.Database.Search" %>
<%@ Register src="Search.ascx" tagname="Search" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <nav class="Title" style="height: 55px">
        <asp:Label ID="lbTitle" runat="server" Text="Search" CssClass="lbTitle"></asp:Label>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="homeBody">
        
        <uc1:Search ID="Search1" runat="server" />
        
    </div>
    </asp:Content>