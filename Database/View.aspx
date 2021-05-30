<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Frontend.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="WebApplication1.Database.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <nav class="Title" style="height: 55px">
        <asp:Label ID="lbTitle" runat="server" Text="Vehicle" CssClass="lbTitle"></asp:Label>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table>
            <tr>
                <td rowspan="4">
                    <asp:Image ID="imgProduct" runat="server" CssClass="detailsImage"/></td>
                <td style="height: 109px"><h2>
                    <asp:Label ID="lblVIN" runat="server"></asp:Label>
                    <hr style="height: 5px" />
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblIssue" runat="server" ></asp:Label></td>
                <td rowspan="2">
                    <asp:Label ID="lblDiscon" runat="server" ></asp:Label><br/>
                <asp:Label ID="lblrecalled" runat="server" Text=""></asp:Label>
                    </td>
            </tr>

            <tr>
                <td>Manufacturer: <asp:Label ID="lblMan" runat="server"></asp:Label></td>
                
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Add to Watch List"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
                </td>
               
            </tr>

        </table>
</asp:Content>
