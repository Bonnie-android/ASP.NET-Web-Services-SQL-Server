using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// StudentListWebService uses a ADO connection to a SQLServer database to retrieve a student record by ID
/// </summary>
[WebService(Namespace = "http://StudentListings.org/WebService")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class StudentListWebService : System.Web.Services.WebService
{

    public StudentListWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public StudentRecord GetStudentById(int ID)
    {

        string CS = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("spGetStudentByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //----create a parameter object for @ID
            SqlParameter parameter = new SqlParameter("@ID", ID);
            //--- associate parameter with command object
            cmd.Parameters.Add(parameter);
            StudentRecord studentRecord = new StudentRecord();
            con.Open();
            //--- cmd.ExecuteReader() returns a SqlDataReader object
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                studentRecord.StudentID = Convert.ToInt32(rdr["StudentID"]);
                studentRecord.StudentName = Convert.ToString(rdr["StudentName"]);
                studentRecord.StudentYear = Convert.ToString(rdr["StudentGrade"]);
                studentRecord.StudentTotalMarks = Convert.ToInt32(rdr["StudentTotalMarks"]);
            }
            return studentRecord;
        }

            
    }

}
