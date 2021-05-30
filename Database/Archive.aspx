<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Frontend.Master" AutoEventWireup="true" CodeBehind="Archive.aspx.cs" Inherits="WebApplication1.Database.Archive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <nav class="Title" style="height: 55px">
        <asp:Label ID="lbTitle" runat="server" Text="Home" CssClass="lbTitle"></asp:Label>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="homeBody">
        <h3>Archive</h3>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="VIN" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="VIN" HeaderText="VIN" ReadOnly="True" SortExpression="VIN" />
                    <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
                    <asp:CheckBoxField DataField="DISCONTINUED" HeaderText="DISCONTINUED" SortExpression="DISCONTINUED" />
                    <asp:BoundField DataField="Known Issues" HeaderText="Known Issues" SortExpression="Known Issues" />
                    <asp:CheckBoxField DataField="Recalled" HeaderText="Recalled" SortExpression="Recalled" />
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="viewButton" runat="server" OnClick="View_OnClick" Text="View" />
                    </ItemTemplate>
        </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DataBase.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblVehicle] ORDER BY [Manufacturer], [VIN]"></asp:SqlDataSource>
        </p>

    </div>
    </asp:Content>