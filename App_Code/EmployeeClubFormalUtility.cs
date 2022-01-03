using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EmployeeClubFormalUtility
/// </summary>
public class EmployeeClubFormalUtility
{
    public static void AddEmployeeApply(EmployeeClubFormal c)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Insert into EmployeeClubFormal(JoinClubID,JoinClubName,EmployeeId,EmployeeName,EmployeeDepartment,JoinClubReason)  " +
            "values(@joinClubID,@joinClubName,@employeeId,@employeeName,@employeeDepartment,@joinClubReason)", cn);
        cmd.Parameters.AddWithValue("@joinClubID", c.JoinClubID);
        cmd.Parameters.AddWithValue("@joinClubName", c.JoinClubName);
        cmd.Parameters.AddWithValue("@employeeId", c.EmployeeId);
        cmd.Parameters.AddWithValue("@employeeName", c.EmployeeName);
        cmd.Parameters.AddWithValue("@employeeDepartment", c.EmployeeDepartment);
        cmd.Parameters.AddWithValue("@joinClubReason", c.JoinClubReason);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    public static List<EmployeeClubFormal> GetEmployeeApplyList()
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from EmployeeClubFormal", cn);
        DataTable db = new DataTable();
        da.Fill(db);
        List<EmployeeClubFormal> EMclublist = new List<EmployeeClubFormal>();
        foreach (DataRow r in db.Rows)
        {
            EMclublist.Add(new EmployeeClubFormal(Convert.ToInt32(r["EMClubCount"]), Convert.ToInt32(r["JoinClubID"]),
                r["JoinClubName"].ToString(), Convert.ToInt32(r["EmployeeId"]), r["EmployeeName"].ToString(), r["EmployeeDepartment"].ToString(),
               r["JoinClubReason"].ToString()));
        }
        return EMclublist;
    }


    public static EmployeeClubFormal GetEmployeeApply(int emClubCount)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from EmployeeClubFormal where EMClubCount = @id ", cn);
        da.SelectCommand.Parameters.AddWithValue("@id", emClubCount);
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow r = db.Rows[0];
            EmployeeClubFormal EMF = new EmployeeClubFormal(Convert.ToInt32(r["EMClubCount"]), Convert.ToInt32(r["JoinClubID"]),
                r["JoinClubName"].ToString(), Convert.ToInt32(r["EmployeeId"]), r["EmployeeName"].ToString(), r["EmployeeDepartment"].ToString(),
               r["JoinClubReason"].ToString());


            return EMF;
        }

       
    }

    public static EmployeeClubFormal GetEmployeeApplyByTwoId(int id , int clubid)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from EmployeeClubFormal where EmployeeId = @id and JoinClubID = @clubid ", cn);
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
            EmployeeClubFormal EMF = new EmployeeClubFormal(Convert.ToInt32(r["EMClubCount"]), Convert.ToInt32(r["JoinClubID"]),
                r["JoinClubName"].ToString(), Convert.ToInt32(r["EmployeeId"]), r["EmployeeName"].ToString(), r["EmployeeDepartment"].ToString(),
               r["JoinClubReason"].ToString());


            return EMF;
        }


    }

    public static void EditEmployeeApply(EmployeeClubFormal c)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("update EmployeeClubFormal set JoinClubID = @joinClubID,JoinClubName = @joinClubName,EmployeeId = @employeeId,EmployeeName = @employeeName,JoinClubReason = @joinClubReason where EMClubCount = @id", cn);
        cmd.Parameters.AddWithValue("@id", c.EMClubCount);
        cmd.Parameters.AddWithValue("@joinClubID", c.JoinClubID);
        cmd.Parameters.AddWithValue("@joinClubName", c.JoinClubName);
        cmd.Parameters.AddWithValue("@employeeId", c.EmployeeId);
        cmd.Parameters.AddWithValue("@employeeName", c.EmployeeName);
        cmd.Parameters.AddWithValue("@employeeDepartment", c.EmployeeDepartment);
        cmd.Parameters.AddWithValue("@joinClubReason", c.JoinClubReason);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    public static void DeleteEmployeeApplyByTwoId(int id,int clubid)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Delete EmployeeClubFormal where EmployeeId = @id and JoinClubID = @joinClubID ", cn);

        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@joinClubID", clubid);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }

    public static void DeleteEmployeeApply(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Delete EmployeeClubFormal where EMClubCount = @id ", cn);

        cmd.Parameters.AddWithValue("@id", id);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }

    public static List<EmployeeClubFormal> GetEmployeeApplyListByClubId(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from EmployeeClubFormal where JoinClubID = @id", cn);
        da.SelectCommand.Parameters.AddWithValue("@id", id);
        DataTable db = new DataTable();
        da.Fill(db);
        List<EmployeeClubFormal> EMclublist = new List<EmployeeClubFormal>();
        foreach (DataRow r in db.Rows)
        {
            EMclublist.Add(new EmployeeClubFormal(Convert.ToInt32(r["EMClubCount"]), Convert.ToInt32(r["JoinClubID"]),
                r["JoinClubName"].ToString(), Convert.ToInt32(r["EmployeeId"]), r["EmployeeName"].ToString(), r["EmployeeDepartment"].ToString(),
               r["JoinClubReason"].ToString()));
        }
        return EMclublist;
    }


    public static void DeleteJoinClub(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Delete EmployeeClubFormal where JoinClubID = @id", cn);

        cmd.Parameters.AddWithValue("@id", id);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
}