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
            GridView1.Visible = false;
            //checking for User id
            String Uname = "";
            String ID = "";
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
                        ID = reader["UserID"].ToString();
                    }
                }
            }
            SqlDataAdapter sda2 = new SqlDataAdapter("Select UserID,VIN FROM tblWatchList WHERE UserID = '" + ID + "'", con);
            DataTable dt2 = new DataTable();
            sda2.Fill(dt2);
            if (dt2.Rows.Count > 0)
            {
                GridView1.Visible = true;
                SqlDataSource1.SelectCommand = "SELECT [VIN] FROM [tblWatchList] WHERE UserID = '" + ID + "'  ORDER BY [VIN]";
            }
            else
            {
                GridView1.Visible = false;
                lblEmpty.Visible = true;
            }
        }

        protected void signOutButton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login/Login.aspx");
        }

        protected void View_OnClick(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}