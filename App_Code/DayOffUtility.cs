using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DayOffUtility
/// </summary>
public class DayOffUtility
{
    //這個我用ajax做所以沒用到
    public static void AddDayOff(DayOff d)
    {
        SqlConnection cn = new SqlConnection(Common.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("insert into DayOff values(@Name,@Type,@StartDate,@StartTime,@EndDate,@EndTime,@DayOffTime,@EvidencePic,@Reason,@Approval,@RejectionReason)", cn);
        cmd.Parameters.AddWithValue("@Name", d.Name);
        cmd.Parameters.AddWithValue("@Type", d.Type);
        cmd.Parameters.AddWithValue("@StartDate", d.StartDate);
        cmd.Parameters.AddWithValue("@StartTime", d.StartTime);
        cmd.Parameters.AddWithValue("@EndDate", d.EndDate);
        cmd.Parameters.AddWithValue("@EndTime", d.EndTime);
        cmd.Parameters.AddWithValue("@DayOffTime", d.DayOffTime);
        cmd.Parameters.AddWithValue("@EvidencePic", d.EvidencePic);
        cmd.Parameters.AddWithValue("@Reason", d.Reason);
        cmd.Parameters.AddWithValue("@Approval", d.Approval);
        cmd.Parameters.AddWithValue("@RejectionReason", d.RejectionReason);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    public static List<DayOff> GetDayOffs()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from DayOff", Common.DbConnecitonstring);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<DayOff> dayOffList = new List<DayOff>();
        foreach (DataRow s in dt.Rows)
        {
            dayOffList.Add(new DayOff(Convert.ToInt32(s["DayOffId"]), s["Name"].ToString(), s["Type"].ToString()
                , s["StartDate"].ToString(), s["StartTime"].ToString(), s["EndDate"].ToString()
                , s["EndTime"].ToString(), s["DayOffTime"].ToString(), s["EvidencePic"].ToString(), s["Reason"].ToString()
                , s["Approval"].ToString(), s["RejectionReason"].ToString()));
        }
        return dayOffList;
    }
    //這個我是用下面的方法所以沒用到
    public static DayOff GetDayOffById(int dayOffId)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from DayOff where @dayOffId = DayOffId ", Common.DbConnecitonstring);
        da.SelectCommand.Parameters.AddWithValue("@dayOffId", dayOffId);
        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow row = dt.Rows[0];
            DayOff member = new DayOff(Convert.ToInt32(row["DayOffId"]), row["Name"].ToString(), row["Type"].ToString()
                , row["StartDate"].ToString(), row["StartTime"].ToString(), row["EndDate"].ToString()
                , row["EndTime"].ToString(), row["DayOffTime"].ToString(), row["EvidencePic"].ToString(), row["Reason"].ToString()
                , row["Approval"].ToString(), row["RejectionReason"].ToString());
            return member;
        }

    }
    public static DayOff GetDayOff(int dayOffId)
    {
        //MyDbEntities db = new MyDbEntities();
        //return db.Products.SingleOrDefault(p => p.Id == id);
        List<DayOff> dayOffs = GetDayOffs(); ;
        var query = from d in dayOffs
                    where d.DayOffId == dayOffId
                    select d;
        return query.SingleOrDefault();
    }
    public static DayOff GetDayOffByName(string dayOffName)
    {
        //MyDbEntities db = new MyDbEntities();
        //return db.Products.SingleOrDefault(p => p.Id == id);
        List<DayOff> dayOffs = GetDayOffs(); ;
        var query = from d in dayOffs
                    where d.Name == dayOffName
                    select d;
        return query.SingleOrDefault();
    }

    public static void UpdateDayOffApproval(DayOff d)
    {
        SqlConnection cn = new SqlConnection(Common.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("update DayOff set Approval=@Approval,RejectionReason=@RejectionReason where DayOffId=@DayOffId", cn);
        cmd.Parameters.AddWithValue("@DayOffId", d.DayOffId);
        cmd.Parameters.AddWithValue("@Approval", d.Approval);
        cmd.Parameters.AddWithValue("@RejectionReason", d.RejectionReason);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    public static string GetDayOffTime(string startDate, string startTime, string endDate, string endTime)
    {
        string a = startDate;
        string[] b = a.Split('/');
        int c = int.Parse(b[2]);

        string d = endDate;
        string[] _e = d.Split('/');
        int f = int.Parse(_e[2]);
        int g = f - c;

        string h = startTime;
        string[] i = h.Split(':');
        int j = int.Parse(i[0]);


        string k = endTime;
        string[] l = k.Split(':');
        int m = int.Parse(l[0]);

        int n = m - j;
        if (n == 9)
        {
            g++;
            n = 0;
        }
        if (g < 0)
        {
            return $"結束天數不能大於起始天數";
        }
        else if (n < 0)
        {
            return "起始不能小於結束時間";
        }
        else if (n > 4)
        {
            return $"{g}天{n - 1}小時";
        }
        else
        {
            return $"{g}天{n}小時";
        }

    }
    public static void DeleteDayOff(int dayOffId)
    {
        SqlConnection cn = new SqlConnection(Common.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("delete DayOff where DayOffId = @DayOffId", cn);
        cmd.Parameters.AddWithValue("@DayOffId", dayOffId);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
}

//public static void add(Member m)
//{
//    SqlConnection cn = new SqlConnection(common.DbConnecitonstring);
//    SqlCommand cmd = new SqlCommand("insert into Members values(@userName,@pw,@email)", cn);
//    cmd.Parameters.AddWithValue("@userName", m.UserName);
//    cmd.Parameters.AddWithValue("@pw", m.Password);
//    cmd.Parameters.AddWithValue("@email", m.Email);
//    cn.Open();
//    cmd.ExecuteNonQuery();
//    cn.Close();
//}
//public static void Update(Member m)
//{
//    SqlConnection cn = new SqlConnection(common.DbConnecitonstring);
//    SqlCommand cmd = new SqlCommand("update Members set UserName=@userName,Password=@pw,Email=@email where Id = @id", cn);
//    cmd.Parameters.AddWithValue("@id", m.Id);
//    cmd.Parameters.AddWithValue("@userName", m.UserName);
//    cmd.Parameters.AddWithValue("@pw", m.Password);
//    cmd.Parameters.AddWithValue("@email", m.Email);
//    cn.Open();
//    cmd.ExecuteNonQuery();
//    cn.Close();
//}

//public static void Delete(int id)
//{
//    SqlConnection cn = new SqlConnection(common.DbConnecitonstring);
//    SqlCommand cmd = new SqlCommand("delete Members where Id = @id", cn);
//    cmd.Parameters.AddWithValue("@id", id);
//    cn.Open();
//    cmd.ExecuteNonQuery();
//    cn.Close();
//}


//public static List<Member> GetMembers()
//{
//    SqlDataAdapter da = new SqlDataAdapter("select * from Members", common.DbConnecitonstring);
//    DataTable dt = new DataTable();
//    da.Fill(dt);
//    List<Member> memberlist = new List<Member>();
//    foreach (DataRow s in dt.Rows)
//    {
//        memberlist.Add(new Member(Convert.ToInt32(s["Id"]), s["UserName"].ToString(), s["Password"].ToString()
//            , s["Email"].ToString()));
//    }
//    return memberlist;
//}
//public static Member GetMember(string userName, string Pw)
//{
//    SqlDataAdapter da = new SqlDataAdapter("select * from Members where @Name =UserName and @pw = Password", common.DbConnecitonstring);
//    da.SelectCommand.Parameters.AddWithValue("@Name", userName);
//    da.SelectCommand.Parameters.AddWithValue("@pw", Pw);
//    DataTable dt = new DataTable();
//    da.Fill(dt);

//    if (dt.Rows.Count == 0)
//    {
//        return null;
//    }
//    else
//    {
//        DataRow row = dt.Rows[0];
//        Member member = new Member(Convert.ToInt32(row["Id"]), row["UserName"].ToString()
//            , row["Password"].ToString(), row["Email"].ToString());
//        return member;
//    }

//}
//public static Member CheckMember(string userName)
//{
//    SqlDataAdapter da = new SqlDataAdapter("select * from Members where @Name =UserName ", common.DbConnecitonstring);
//    da.SelectCommand.Parameters.AddWithValue("@Name", userName);

//    DataTable dt = new DataTable();
//    da.Fill(dt);

//    if (dt.Rows.Count == 0)
//    {
//        return null;
//    }
//    else
//    {
//        DataRow row = dt.Rows[0];
//        Member member = new Member(Convert.ToInt32(row["Id"]), row["UserName"].ToString()
//            , row["Password"].ToString(), row["Email"].ToString());
//        return member;
//    }
//}