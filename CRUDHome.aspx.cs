using System;
using System.Data;
using System.Data.SqlClient;

namespace CRUD_Operations
{
    public partial class CRUDHome : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.Session["id"] == null)
            {
                Response.Redirect("Default.aspx");
                
            }
            else
            {
                //Label1.Text = Session["id"].ToString();
                UpdateTable();
            }
        }
        protected void AddRecord(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=crudDB;Integrated Security=True");
            con.Open();
            string insert = "insert into dbo.Emp(Name,email,Contact,Salary) values ('" +ename.Value + "','" + email.Value + "','" + econtact.Value + "','" + esalary.Value + "')";
            SqlCommand cmd = new SqlCommand(insert, con);
            int m = cmd.ExecuteNonQuery();
            if (m != 0)
            {
                Response.Write("<script> alert('Data Inserted !!') </ script >");
                UpdateTable();
            }
            else
            {
                Response.Write("< script > alert('Data Didn't Inserted !!') </ script >");
            }
            con.Close();
            UpdateTable();
        }
        public  void UpdateTable()
        {
            try
            {
                lbltbl.InnerHtml = "";
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=crudDB;Integrated Security=True");
                SqlCommand cmd = new SqlCommand("select * from dbo.Emp", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                string htmlTable = "";
                int isd = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    isd++;
                    string name = dr["Name"].ToString();
                    string email = dr["email"].ToString();
                    string contact = dr["Contact"].ToString();
                    string salary = dr["Salary"].ToString();
                    htmlTable += "<tr><td>" + isd + "</td><td>" + name + "</td><td>" + email + "</td><td>" + contact + "</td><td>" + salary + "</td><td><input type='button' value='Edit' id='" + Convert.ToInt32(dr["id"]) + "' class='btn btn-warning spcbtn' onclick='updateEmp(" + Convert.ToInt32(dr["id"]) + ")' data-toggle='modal' data-target='#editModal'  Text='Edit' /><input type='button' value='Delete' id='" + Convert.ToInt32(dr["id"]) + "' onclick='del(" + Convert.ToInt32(dr["id"]) + ")' class='btn btn-danger spc-btn' data-toggle='modal' data-target='#deleteModal' runat='server' Text='Delete'/></td></tr>";
                }
                lbltbl.InnerHtml = htmlTable;
            }
            catch(Exception ex)
            {
                ex.Message.ToString();
            }
        }
    }
}

