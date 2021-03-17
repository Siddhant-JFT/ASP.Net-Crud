using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_Operations
{
    public partial class add : System.Web.UI.Page
    {
        string name, email, contact, salary, image;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.Session["id"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                try
                {
                    
                    name = Request.QueryString["Name"].ToString();
                    email = Request.QueryString["email"].ToString();
                    contact = Request.QueryString["Contact"].ToString();
                    salary = Request.QueryString["Salary"].ToString();
                    image = Request.QueryString["Image"].ToString();
                    string conn = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                    SqlConnection cn = new SqlConnection(conn);
                    SqlCommand cmd = new SqlCommand("toAdd", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@name", (name));
                    cmd.Parameters.AddWithValue("@email", (email));
                    cmd.Parameters.AddWithValue("@contact", (contact));
                    cmd.Parameters.AddWithValue("@salary", (salary));
                    cmd.Parameters.AddWithValue("@image", (image));
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }
                catch (Exception ex)
                {
                    ex.Message.ToString();
                    Console.WriteLine(ex.Message.ToString());
                }

            }
        }
    }
}