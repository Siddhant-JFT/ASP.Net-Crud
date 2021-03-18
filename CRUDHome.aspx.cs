using System;
using System.Configuration;
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
        /*protected void AddRecord(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=crudDB;Integrated Security=True");
            con.Open();
            string insert = "insert into dbo.Emp(Name,email,Contact,Salary) values ('" +ename.Value + "','" + email.Value + "','" + econtact.Value + "','" + esalary.Value + "')";
            SqlCommand cmd = new SqlCommand(insert, con);
            int m = cmd.ExecuteNonQuery();
            if (m != 0)
            {
                Response.Write("<script> alert('Data Inserted!!') </ script >");
                UpdateTable();
            }
            else
            {
                Response.Write("< script > alert('Data Insertion Succesful!!') </ script >");
            }
            con.Close();
            UpdateTable();
        } */
        public  void UpdateTable()
        {
            try
            {
                lbltbl.InnerHtml = "";
                string conn = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection cn = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Toload", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cn.Open();
                int i = cmd.ExecuteNonQuery();
                cn.Close();
                string htmlTable = "";
                int isd = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    isd++;
                    string name = dr["Name"].ToString();
                    string email = dr["email"].ToString();
                    string contact = dr["Contact"].ToString();
                    string salary = dr["Salary"].ToString();
                    htmlTable += "<tr><td class='col-sm-1'>" + isd 
                        + "</td><td class='col-sm-2'>" + name + 
                        "</td><td class='col-sm-3'>" + email + 
                        "</td><td class='col-sm-2'>" + contact + 
                        "</td><td class='col-sm-1'>" + salary + 
                       //button1
                        "</td><td class='col-sm-1'><input type='button' id='" + Convert.ToInt32(dr["id"]) + "' class='btn btn-success spcbtn btn-sm' onclick='showImage(" + Convert.ToInt32(dr["id"]) + ")' data-toggle='modal' data-target='#imageModal'  value='View Image'/></td>" 
                        //button2
                        +
                        "<td class='col-sm-1'><input type='button' value='Edit' id='" + Convert.ToInt32(dr["id"]) + "' class='btn btn-success spcbtn btn-sm' onclick='updateEmp(" + Convert.ToInt32(dr["id"]) + ")' data-toggle='modal' data-target='#editModal'  Text='Edit' /></td>" 
                        +
                        //button3
                        "<td class='col-sm-1'><input type='button' value='Delete' id='" + Convert.ToInt32(dr["id"]) + "' onclick='del(" + Convert.ToInt32(dr["id"]) + ")' class='btn btn-danger spcbtn btn-sm' data-toggle='modal' data-target='#deleteModal' runat='server' Text='Delete'/></td></tr>";
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

