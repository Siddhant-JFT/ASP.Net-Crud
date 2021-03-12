using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_Operations
{
    public partial class refresh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=crudDB;Integrated Security=True");
                SqlCommand cmd = new SqlCommand("select * from dbo.Emp", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                int isd = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    isd++;
                    string name = dr["Name"].ToString();
                    string email = dr["email"].ToString();
                    string contact = dr["Contact"].ToString();
                    string salary = dr["Salary"].ToString();
                    Response.Write("<tr><td>" + isd + "</td><td>" + name + "</td><td>" + email + "</td><td>" + contact + "</td><td>" + salary + "</td><td><input type='button' value='Edit' id='" + Convert.ToInt32(dr["id"]) + "' class='btn btn-warning spcbtn' onclick='updateEmp(" + Convert.ToInt32(dr["id"]) + ")' data-toggle='modal' data-target='#editModal'  Text='Edit' /><input type='button' value='delete' id='" + Convert.ToInt32(dr["id"]) + "' onclick='del(" + Convert.ToInt32(dr["id"]) + ")' class='btn btn-danger spc-btn' data-toggle='modal' data-target='#deleteModal' runat='server' Text='Delete'/></td></tr>");
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }
    }
}