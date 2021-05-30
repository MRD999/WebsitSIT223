using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Database
{
    public partial class View : System.Web.UI.Page
    {
        private bool add;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["VIN"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            String VIN = Session["VIN"].ToString();

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DataBase.mdf;Integrated Security=True;");
            SqlDataAdapter sda1 = new SqlDataAdapter("Select * FROM tblVehicle WHERE VIN = '" + VIN + "'", con);

            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            if (dt1.Rows.Count > 0)
            {
                SqlCommand cmd = new SqlCommand("Select * FROM tblVehicle WHERE VIN = '" + VIN + "'", con);
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        lblVIN.Text = VIN;
                        lblIssue.Text = reader["Known Issues"].ToString();
                        lblMan.Text = reader["Manufacturer"].ToString();
                        string dis = reader["Discontinued"].ToString();
                        string rec = reader["Recalled"].ToString();
                        lblrecalled.Text = rec;
                        if (dis == "True")
                        {
                            lblDiscon.Visible = true;
                            lblDiscon.Text = "Discontinued";
                        }
                        else
                        {
                            lblDiscon.Visible = false;
                        }
                       if(rec == "True")
                        {
                            lblrecalled.Visible = true;
                            lblrecalled.Text = "Recalled";
                        }
                        else
                        {
                            lblrecalled.Visible = false;
                        }
                    }
                }

            }
            //Lables
            if (Session["UserID"] == null)
            {
                Button1.Visible = false;
                Label1.Text = "Login to add to watch list";
            }
            else
            {
                SqlDataAdapter sda2 = new SqlDataAdapter("Select * FROM tblWatchList WHERE VIN = '" + VIN + "' AND UserID = '"+ Session["UserID"] + "' ", con);
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);
                if (dt2.Rows.Count > 0)
                {
                    Label1.Text = "Remove from watchlist";
                    add = false;
                    Button1.Text = "Remove";
                }
                else
                {
                    Label1.Text = "Add to watchlist";
                    add = true;
                    Button1.Text = "Add";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DataBase.mdf;Integrated Security=True;");
            if(add==true)
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO tblWatchList(UserID, VIN) VALUES('"+ Session["UserID"] + "', '"+ Session["VIN"] + "')",con);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM tblWatchList WHERE UserID = '" + Session["UserID"] + "' AND VIN = '" + Session["VIN"] + "'",con);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }
            

           

        }
    }
}