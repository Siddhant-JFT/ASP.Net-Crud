using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_Operations
{
    public partial class add : System.Web.UI.Page
    {
         SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=crudDB;Integrated Security=True");
        string name, email, contact, salary;
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
                    // SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=crudDB;Integrated Security=True");
                    con.Open();
                    name = Request.QueryString["Name"].ToString();
                    email = Request.QueryString["email"].ToString();
                    contact = Request.QueryString["Contact"].ToString();
                    salary = Request.QueryString["Salary"].ToString();
                    
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.CommandText = "INSERT INTO Emp(Name,email,Contact,Salary) VALUES ('" + name + "','" + email + "','" + contact+ "','" + salary+ "')";
                    cmd.ExecuteNonQuery();
                    con.Close();
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