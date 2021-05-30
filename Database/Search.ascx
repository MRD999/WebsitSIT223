<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="WebApplication1.Database.Search1" %>
<style type="text/css">
    .auto-style1 {
        margin-bottom: 4px;
    }
</style>

Search by Vehicle Identification Number:
<asp:TextBox ID="TxtVIN" runat="server" CssClass="auto-style1" OnTextChanged="TxtVIN_TextChanged"></asp:TextBox>
<br />
Search by&nbsp; Manufactuer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
<p>
    &nbsp;</p>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="VIN" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="368px" Visible="False">
    <Columns>
        <asp:BoundField DataField="VIN" HeaderText="VIN" ReadOnly="True" SortExpression="VIN" />
        <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
        <asp:CheckBoxField DataField="DISCONTINUED" HeaderText="DISCONTINUED" SortExpression="DISCONTINUED" />
        <asp:CheckBoxField DataField="Recalled" HeaderText="Recalled" SortExpression="Recalled" />
        <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="viewButton" runat="server" OnClick="View_OnClick" Text="View" />
                    </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DataBase.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [VIN], [Manufacturer], [DISCONTINUED], [Recalled] FROM [tblVehicle] ORDER BY [VIN], [Manufacturer]"></asp:SqlDataSource>

