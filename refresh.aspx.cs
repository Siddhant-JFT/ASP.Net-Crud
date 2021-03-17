using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CRUD_Operations
{
    public partial class refresh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.Session["id"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            try
            {
                DataTable dt = new DataTable();
                string conn = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection cn = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Toload", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                cn.Open();
                _ = cmd.ExecuteNonQuery();
                cn.Close();
                int isd = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    isd++;
                    string name = dr["Name"].ToString();
                    string email = dr["email"].ToString();
                    string contact = dr["Contact"].ToString();
                    string salary = dr["Salary"].ToString();
                    Response.Write("<tr><td>" + isd + "</td><td>" + name + "</td><td>" + email + "</td><td>" + contact + "</td><td>" + salary + "</td><td><input type='button' value='Edit' id='" + Convert.ToInt32(dr["id"]) + "' class='btn btn-success spcbtn' onclick='updateEmp(" + Convert.ToInt32(dr["id"]) + ")' data-toggle='modal' data-target='#editModal' /><input type='button' value='Delete' id='" + Convert.ToInt32(dr["id"]) + "' onclick='del(" + Convert.ToInt32(dr["id"]) + ")' class='btn btn-danger spc-btn' data-toggle='modal' data-target='#deleteModal' runat='server' /></td></tr>");
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }
    }
}