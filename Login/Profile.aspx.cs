using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebApplication1.Login
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Login/Login.aspx");
            }
            //checking for User id
            String Uname = "";
            Uname = Session["UserID"].ToString();
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DataBase.mdf;Integrated Security=True;");
            SqlDataAdapter sda1 = new SqlDataAdapter("Select UserName,Password FROM tblUsers WHERE UserName = '" + Uname + "'", con);

            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            if (dt1.Rows.Count > 0)
            {
                SqlCommand cmd = new SqlCommand("Select * FROM tblUsers WHERE UserName = '" + Uname + "'", con);
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        lbFName.Text = Uname.ToString();
                        lbFName.Text = reader["FirstName"].ToString();
                        lbLName.Text = reader["LastName"].ToString();
                        lblUserName.Text = reader["UserName"].ToString();
                    }
                }
            }
        }

        protected void signOutButton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login/Login.aspx");
        }
    }
}