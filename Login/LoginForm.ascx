<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.ascx.cs" Inherits="WebApplication1.Login.LoginForm1" %>

    
<asp:Login ID="Login" runat="server" BackColor="#E3EAEB" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" OnAuthenticate="Login_Authenticate"  UserNameLabelText="ID:" ViewStateMode="Disabled" TextLayout="TextOnTop">
    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
    <LayoutTemplate>
        <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
            <tr>
                <td>
                    <table cellpadding="0">
                        <tr>
                            <td align="center" colspan="2" style="color:White;background-color:#507CD1;font-size:0.9em;font-weight:bold;">Log In</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">ID:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="ctl00$Login">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ctl00$Login">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Text="Log In" ValidationGroup="ctl00$Login" />
                                <asp:Button ID="signUpButton" runat="server" BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" CommandName="Sign up" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Text="Sign up" ValidationGroup="ctl00$Login" PostBackUrl="~/Login/Signup.aspx" CausesValidation="False" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </LayoutTemplate>
    <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
    <TextBoxStyle Font-Size="0.8em" />
    <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
</asp:Login>
