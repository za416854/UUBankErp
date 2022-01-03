using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClubCalendersUtility
/// </summary>
public class ClubCalendersUtility
{
    public static int Add(ClubCalenders calender)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);

        SqlCommand cmd = new SqlCommand(
            "insert into ClubCalenders values(@username , @eventName , @startDate , @startTime , @endDate, @endTime, @isAllDay,@clubid)",
            cn);

        cmd.Parameters.AddWithValue("@username", calender.UserName);
        cmd.Parameters.AddWithValue("@eventName", calender.EventName);
        cmd.Parameters.AddWithValue("@startDate", calender.StartDate);
        cmd.Parameters.AddWithValue("@startTime", calender.StartTime);
        cmd.Parameters.AddWithValue("@endDate", calender.EndDate);
        cmd.Parameters.AddWithValue("@endTime", calender.EndTime);
        cmd.Parameters.AddWithValue("@isAllDay", calender.IsAllDay);
        cmd.Parameters.AddWithValue("@clubid", calender.ClubID);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        ClubCalenders tempCalender = GetCalender(calender);
        return tempCalender.Id;
    }

    public static List<ClubCalenders> GetCalenders(int clubid)
    {

        SqlDataAdapter da = new SqlDataAdapter(
                        "select * from ClubCalenders where ClubID = @clubid ",
                        Commons.DbConnecitonstring);
        da.SelectCommand.Parameters.AddWithValue("@clubid", clubid);
        DataTable dt = new DataTable();

        da.Fill(dt);

        List<ClubCalenders> calenderList = new List<ClubCalenders>();

        foreach (DataRow row in dt.Rows)
        {
            calenderList.Add(new ClubCalenders(
                Convert.ToInt32(row["Id"]),
                row["UserName"].ToString(),
                row["EventName"].ToString(),
                row["StartDate"].ToString(),
                row["StartTime"].ToString(),
                row["EndDate"].ToString(),
                row["EndTime"].ToString(),
                row["IsAllDay"].ToString(),
                Convert.ToInt32(row["ClubID"])
                ));
        }

        return calenderList;
    }

    public static ClubCalenders GetCalender(ClubCalenders calender)
    {

        SqlDataAdapter da = new SqlDataAdapter(
                        "Select * From ClubCalenders Where UserName = @userName and " +
                        "EventName = @eventName and StartDate = @startDate and " +
                        "StartTime = @startTime and EndDate = @endDate and " +
                        "EndTime = @endTime and ClubID = @clubID;",
                        Commons.DbConnecitonstring);

        da.SelectCommand.Parameters.AddWithValue("@username", calender.UserName);
        da.SelectCommand.Parameters.AddWithValue("@eventName", calender.EventName);
        da.SelectCommand.Parameters.AddWithValue("@startDate", calender.StartDate);
        da.SelectCommand.Parameters.AddWithValue("@startTime", calender.StartTime);
        da.SelectCommand.Parameters.AddWithValue("@endDate", calender.EndDate);
        da.SelectCommand.Parameters.AddWithValue("@endTime", calender.EndTime);
        da.SelectCommand.Parameters.AddWithValue("@clubID", calender.ClubID);

        DataTable dt = new DataTable();

        da.Fill(dt);

        if (dt.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow row = dt.Rows[0];

            return new ClubCalenders(
                              Convert.ToInt32(row["Id"]),
                              row["UserName"].ToString(),
                              row["EventName"].ToString(),
                              row["StartDate"].ToString(),
                              row["StartTime"].ToString(),
                              row["EndDate"].ToString(),
                              row["EndTime"].ToString(),
                              row["IsAllDay"].ToString(),
                               Convert.ToInt32(row["ClubID"])
                              );
        }
    }

    public static void Update(ClubCalenders calender)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);

        SqlCommand cmd = new SqlCommand(
            "Update ClubCalenders set " +
            "EventName = @eventName, StartDate = @startDate, " +
            "StartTime = @startTime, EndDate = @endDate, " +
            "EndTime = @endTime, IsAllDay = @isAllDay,ClubID = @clubID where Id = @id;",
            cn);

        cmd.Parameters.AddWithValue("@id", calender.Id);
        cmd.Parameters.AddWithValue("@eventName", calender.EventName);
        cmd.Parameters.AddWithValue("@startDate", calender.StartDate);
        cmd.Parameters.AddWithValue("@startTime", calender.StartTime);
        cmd.Parameters.AddWithValue("@endDate", calender.EndDate);
        cmd.Parameters.AddWithValue("@endTime", calender.EndTime);
        cmd.Parameters.AddWithValue("@isAllDay", calender.IsAllDay);
        cmd.Parameters.AddWithValue("@clubID", calender.ClubID);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }

    public static void Delete(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);

        SqlCommand cmd = new SqlCommand(
            "delete ClubCalenders where Id = @id;",
            cn);

        cmd.Parameters.AddWithValue("@id", id);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
}