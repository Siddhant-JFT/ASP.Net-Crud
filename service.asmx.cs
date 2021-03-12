using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;

namespace CRUD_Operations
{
    /// <summary>
    /// Summary description for service
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class service : System.Web.Services.WebService
    {

        [WebMethod]
        public string UpdateEmployee(string emp,string salalry)
        {
            //string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(CS))
            //{ 
            //    //SqlCommand cmd = new SqlCommand("spUpdateEmployee", con);
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add(new SqlParameter()
                //{
                //    ParameterName = "@id",
                //    Value = emp.ID
                //});
                //cmd.Parameters.Add(new SqlParameter()
                //{
                //    ParameterName = "@Name",
                //    Value = emp.Name
                //});
                //cmd.Parameters.Add(new SqlParameter()
                //{
                //    ParameterName = "@email",
                //    Value = emp.email
                //});
                //cmd.Parameters.Add(new SqlParameter()
                //{
                //    ParameterName = "@Contact",
                //    Value = emp.Contact
                //});
                //cmd.Parameters.Add(new SqlParameter()
                //{
                //    ParameterName = "@Salary",
                //    Value = emp.Salary
                //});
                //con.Open();
                //cmd.ExecuteNonQuery();
            //}
            return emp + " " + salalry;
        }

        public void GetEmployees()
        {
            List<Employees> listEmployee = new List<Employees>();
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Employees employee = new Employees();
                    employee.ID = Convert.ToInt32(rdr["ID"]);
                    employee.Name = rdr["Name"].ToString();
                    employee.Contact = rdr["email"].ToString();
                    employee.Contact = rdr["Contact"].ToString();
                    employee.Salary = rdr["Salary"].ToString();

                    listEmployee.Add(employee);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(listEmployee));
        }
    }
}
