using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CRUD_Operations;
using System.Configuration;

namespace CRUD_Operations
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("toLogin", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", TextBox1.Text);
            cmd.Parameters.AddWithValue("password", TextBox2.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            cn.Open();
            int i = cmd.ExecuteNonQuery();
            cn.Close();
            if (dt.Rows.Count > 0)
            {
                Session["id"] = TextBox1.Text;

                Response.Redirect("CRUDHome.aspx");
            }
            else
            {
                Label1.Text = "Invalid User Credentials";
                Label1.ForeColor = System.Drawing.Color.Red;

            }
        }
    }
}