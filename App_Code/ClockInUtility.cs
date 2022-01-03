using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClockInUtility
/// </summary>
public class ClockInUtility
{
    public static void AddClockIn(ClockIn c)
    {
        SqlConnection cn = new SqlConnection(Common.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("insert into ClockIn values(@Name,@Date,@ClockInTime,@ClockOutTime,@Approval)", cn);

        cmd.Parameters.AddWithValue("@Name", c.Name);
        cmd.Parameters.AddWithValue("@Date", c.Date);
        cmd.Parameters.AddWithValue("@ClockInTime", c.ClockInTime);
        cmd.Parameters.AddWithValue("@ClockOutTime", c.ClockOutTime);
        cmd.Parameters.AddWithValue("@Approval", c.Approval);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    public static List<ClockIn> GetClockIns()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from ClockIn", Common.DbConnecitonstring);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<ClockIn> clockInList = new List<ClockIn>();
        foreach (DataRow s in dt.Rows)
        {
            clockInList.Add(new ClockIn(Convert.ToInt32(s["ClockInId"]), s["Name"].ToString(), s["Date"].ToString()
                , s["ClockInTime"].ToString(), s["ClockOutTime"].ToString(), s["Approval"].ToString()));
        }
        return clockInList;
    }
    public static ClockIn GetClockInById(int clockInId)
    {
        //MyDbEntities db = new MyDbEntities();
        //return db.Products.SingleOrDefault(p => p.Id == id);
        List<ClockIn> clockIns = GetClockIns();
        var query = from c in clockIns
                    where c.ClockInId == clockInId
                    select c;
        return query.SingleOrDefault();
    }
    public static ClockIn GetClockInByName(string name)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from ClockIn where @name = Name", Common.DbConnecitonstring);
        da.SelectCommand.Parameters.AddWithValue("@name", name);
        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow row = dt.Rows[0];
            ClockIn member = new ClockIn(Convert.ToInt32(row["ClockInId"]), row["Name"].ToString(), row["Date"].ToString()
                , row["ClockInTime"].ToString(), row["ClockOutTime"].ToString(), row["Approval"].ToString());
            return member;
        }
    }
    
    public static void UpdateClockIn(ClockIn c)
    {
        SqlConnection cn = new SqlConnection(Common.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("update ClockIn set Date=@Date,ClockInTime=@ClockInTime,ClockOutTime=@ClockOutTime,Approval=@Approval where Name=@Name", cn);
        //cmd.Parameters.AddWithValue("@ClockInId", c.ClockInId);
        cmd.Parameters.AddWithValue("@Name", c.Name);
        cmd.Parameters.AddWithValue("@Date", c.Date);
        cmd.Parameters.AddWithValue("@ClockInTime", c.ClockInTime);
        cmd.Parameters.AddWithValue("@ClockOutTime", c.ClockOutTime);
        cmd.Parameters.AddWithValue("@Approval", c.Approval);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    public static void UpdateClockInApproval(ClockIn c)
    {
        SqlConnection cn = new SqlConnection(Common.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("update ClockIn set Approval=@Approval where ClockInId=@ClockInId", cn);
        cmd.Parameters.AddWithValue("@ClockInId", c.ClockInId);
        cmd.Parameters.AddWithValue("@Approval", c.Approval);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    //用在打卡覆核的方法
    public static int TransToInt(string s)
    {
        return Convert.ToInt32(s);
    }

}