using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Database
{
    public partial class Search1 : System.Web.UI.UserControl
    {
        private string input;
        private Boolean search;
        protected void Page_Load(object sender, EventArgs e)
        {
            input = string.Empty;
            search = false;
            GridView1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            if (search==false)
            {
                SqlDataSource1.SelectCommand = "SELECT [VIN], [Manufacturer], [DISCONTINUED], [Recalled] FROM [tblVehicle] WHERE Manufacturer='"+input+"'  ORDER BY [VIN], [Manufacturer]";
            }
            if(search==true)
            {
                SqlDataSource1.SelectCommand = "SELECT [VIN], [Manufacturer], [DISCONTINUED], [Recalled] FROM [tblVehicle] WHERE VIN='" + input + "'  ORDER BY [VIN], [Manufacturer]";
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            input = TextBox1.Text;
            search = false;
        }

        protected void TxtVIN_TextChanged(object sender, EventArgs e)
        {
            input = TxtVIN.Text;
            search = true;
        }

        protected void View_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            int rowindex = gvr.RowIndex;
            String VIN = GridView1.Rows[rowindex].Cells[0].Text;
            Session["VIN"] = VIN;
            Response.Redirect("~/Database/View.aspx");

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}