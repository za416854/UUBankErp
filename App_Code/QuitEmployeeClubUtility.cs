using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for QuitEmployeeClubUtility
/// </summary>
public class QuitEmployeeClubUtility
{
    public static void AddQuitEmployeeApply(QuitEmployeeClub c)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Insert into QuitEmployeeClub(QuitClubID,QuitClubName,EmployeeId,EmployeeName,EmployeeDepartment,QuitClubReason,Approve)  " +
            "values(@quitClubID,@quitClubName,@employeeId,@employeeName,@employeeDepartment,@quitClubReason,@approve)", cn);
        cmd.Parameters.AddWithValue("@quitClubID", c.QuitClubID);
        cmd.Parameters.AddWithValue("@quitClubName", c.QuitClubName);
        cmd.Parameters.AddWithValue("@employeeId", c.EmployeeId);
        cmd.Parameters.AddWithValue("@employeeName", c.EmployeeName);
        cmd.Parameters.AddWithValue("@employeeDepartment", c.EmployeeDepartment);
        cmd.Parameters.AddWithValue("@quitClubReason", c.QuitClubReason);
        cmd.Parameters.AddWithValue("@approve", c.Approve);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    public static List<QuitEmployeeClub> GetQuitEmployeeApplyList()
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from QuitEmployeeClub", cn);
        DataTable db = new DataTable();
        da.Fill(db);
        List<QuitEmployeeClub> QuitEMclublist = new List<QuitEmployeeClub>();
        foreach (DataRow r in db.Rows)
        {
            QuitEMclublist.Add(new QuitEmployeeClub(Convert.ToInt32(r["QuitEMClubCount"]), Convert.ToInt32(r["QuitClubID"]),
                r["QuitClubName"].ToString(), Convert.ToInt32(r["EmployeeId"]), r["EmployeeName"].ToString(), r["EmployeeDepartment"].ToString(),
               r["QuitClubReason"].ToString(), Convert.ToBoolean(r["Approve"])));
        }
        return QuitEMclublist;
    }

    public static void EditQuitEmployeeApply(QuitEmployeeClub c)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("update QuitEmployeeClub set QuitClubID = @quitClubID,QuitClubName = @quitClubName,EmployeeId = @employeeId,EmployeeName = @employeeName,QuitClubReason = @quitClubReason,Approve = @approve where QuitEMClubCount = @id", cn);
        cmd.Parameters.AddWithValue("@id", c.QuitEMClubCount);
        cmd.Parameters.AddWithValue("@quitClubID", c.QuitClubID);
        cmd.Parameters.AddWithValue("@quitClubName", c.QuitClubName);
        cmd.Parameters.AddWithValue("@employeeId", c.EmployeeId);
        cmd.Parameters.AddWithValue("@employeeName", c.EmployeeName);
        cmd.Parameters.AddWithValue("@employeeDepartment", c.EmployeeDepartment);
        cmd.Parameters.AddWithValue("@quitClubReason", c.QuitClubReason);
        cmd.Parameters.AddWithValue("@approve", c.Approve);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    public static void DeleteQuitEmployeeApply(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Delete QuitEmployeeClub where QuitEMClubCount = @id", cn);

        cmd.Parameters.AddWithValue("@id", id);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }


    public static QuitEmployeeClub GetQuitEmployeeApplyByTwoId(int id, int clubid)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from QuitEmployeeClub where EmployeeId = @id and QuitClubID = @clubid ", cn);
        da.SelectCommand.Parameters.AddWithValue("@id", id);
        da.SelectCommand.Parameters.AddWithValue("@clubid", clubid);
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow r = db.Rows[0];
            QuitEmployeeClub EMF = new QuitEmployeeClub(Convert.ToInt32(r["QuitEMClubCount"]), Convert.ToInt32(r["QuitClubID"]),
                r["QuitClubName"].ToString(), Convert.ToInt32(r["EmployeeId"]), r["EmployeeName"].ToString(), r["EmployeeDepartment"].ToString(),
               r["QuitClubReason"].ToString(), Convert.ToBoolean(r["Approve"]));


            return EMF;
        }


    }
}