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
        <br />
        Your Watch List:<br />
        <asp:Label ID="lblEmpty" runat="server" Text="Your watch list is empty" Visible="False"></asp:Label>
    <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" />
                        <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="viewButton" runat="server" OnClick="View_OnClick" Text="View" />
                    </ItemTemplate>
        </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DataBase.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblWatchList]"></asp:SqlDataSource>
        <br />
   
    <asp:Button ID="signOutButton" runat="server" Text="SignOut" OnClick="signOutButton_Click" />
        <uc1:ChangePasswordForms runat="server" id="ChangePasswordForms" />
    </div>


</asp:Content>