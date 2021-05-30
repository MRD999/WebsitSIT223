using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Policy;
using System.Security.Principal;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Login
{
    public partial class LoginForm1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private bool SiteSpecificAuthenticationMethod(string UserName, string Password)
        {

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DataBase.mdf;Integrated Security=True;");
            SqlDataAdapter sda1 = new SqlDataAdapter("Select UserID,UserName,Password FROM tblUsers WHERE UserName = '" + UserName + "' AND Password = '" + Password + "'", con);

            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);



            if (dt1.Rows.Count > 0)
            {
                SqlCommand cmd = new SqlCommand("Select * FROM tblUsers WHERE UserName = '" + UserName + "'", con);
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Session["UserID"] = reader["UserID"].ToString(); ;
                    }
                }
                
                Response.Redirect("~/Default.aspx");
                return true;


            }
            else
            {
                return false;
            }
        }
        protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
        {
            bool Authenticated = false;
            Authenticated = SiteSpecificAuthenticationMethod(Login.UserName, Login.Password);

            e.Authenticated = Authenticated;
        }
    }
}