using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EmployeeClubUtility
/// </summary>
public class EmployeeClubUtility
{
    public static void AddEmployeeApply(EmployeeClub c)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Insert into EmployeeClub(JoinClubID,JoinClubName,EmployeeId,EmployeeName,EmployeeDepartment,JoinClubReason,Approve)  " +
            "values(@joinClubID,@joinClubName,@employeeId,@employeeName,@employeeDepartment,@joinClubReason,@approve)", cn);
        cmd.Parameters.AddWithValue("@joinClubID", c.JoinClubID);
        cmd.Parameters.AddWithValue("@joinClubName", c.JoinClubName);
        cmd.Parameters.AddWithValue("@employeeId", c.EmployeeId);
        cmd.Parameters.AddWithValue("@employeeName", c.EmployeeName);
        cmd.Parameters.AddWithValue("@employeeDepartment", c.EmployeeDepartment);
        cmd.Parameters.AddWithValue("@joinClubReason", c.JoinClubReason);
        cmd.Parameters.AddWithValue("@approve", c.Approve);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    public static List<EmployeeClub> GetEmployeeApplyList()
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from EmployeeClub", cn);
        DataTable db = new DataTable();
        da.Fill(db);
        List<EmployeeClub> EMclublist = new List<EmployeeClub>();
        foreach (DataRow r in db.Rows)
        {
            EMclublist.Add(new EmployeeClub(Convert.ToInt32(r["EMClubCount"]), Convert.ToInt32(r["JoinClubID"]),
                r["JoinClubName"].ToString(),Convert.ToInt32( r["EmployeeId"]), r["EmployeeName"].ToString(), r["EmployeeDepartment"].ToString(),
               r["JoinClubReason"].ToString(),Convert.ToBoolean(r["Approve"])));
        }
        return EMclublist;
    }

    public static void EditEmployeeApply(EmployeeClub c)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("update EmployeeClub set JoinClubID = @joinClubID,JoinClubName = @joinClubName,EmployeeId = @employeeId,EmployeeName = @employeeName,JoinClubReason = @joinClubReason,Approve = @approve where EMClubCount = @id", cn);
        cmd.Parameters.AddWithValue("@id",c.EMClubCount);
        cmd.Parameters.AddWithValue("@joinClubID", c.JoinClubID);
        cmd.Parameters.AddWithValue("@joinClubName", c.JoinClubName);
        cmd.Parameters.AddWithValue("@employeeId", c.EmployeeId);
        cmd.Parameters.AddWithValue("@employeeName", c.EmployeeName);
        cmd.Parameters.AddWithValue("@employeeDepartment", c.EmployeeDepartment);
        cmd.Parameters.AddWithValue("@joinClubReason", c.JoinClubReason);
        cmd.Parameters.AddWithValue("@approve", c.Approve);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    public static void DeleteEmployeeApply(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Delete EmployeeClub where EMClubCount = @id", cn);

        cmd.Parameters.AddWithValue("@id", id);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }


    public static EmployeeClub GetEmployeeApply(int id ,string clubname)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from EmployeeClub where EmployeeId = @id and JoinClubName = @clubname", cn);
        da.SelectCommand.Parameters.AddWithValue("@id", id);
        da.SelectCommand.Parameters.AddWithValue("@clubname", clubname);
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow r = db.Rows[0];
            EmployeeClub EMF = new EmployeeClub(Convert.ToInt32(r["EMClubCount"]), Convert.ToInt32(r["JoinClubID"]),
                r["JoinClubName"].ToString(), Convert.ToInt32(r["EmployeeId"]), r["EmployeeName"].ToString(), r["EmployeeDepartment"].ToString(),
               r["JoinClubReason"].ToString(), Convert.ToBoolean(r["Approve"]));


            return EMF;
        }


    }


}