using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MessageUtility
/// </summary>
public class MessageUtility
{
    public static void AddMessage(Message m)
    {
        SqlConnection cn = new SqlConnection(Common.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("insert into Message values(@FromName,@ToName,@Topic,@MessageContent,@Time,@State)", cn);
        cmd.Parameters.AddWithValue("@FromName", m.FromName);
        cmd.Parameters.AddWithValue("@ToName", m.ToName);
        cmd.Parameters.AddWithValue("@Topic", m.Topic);
        cmd.Parameters.AddWithValue("@MessageContent", m.MessageContent);
        cmd.Parameters.AddWithValue("@Time", m.Time);
        cmd.Parameters.AddWithValue("@State", m.State);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    public static List<Message> GetMessages()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Message", Common.DbConnecitonstring);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<Message> messageList = new List<Message>();
        foreach (DataRow s in dt.Rows)
        {
            messageList.Add(new Message(Convert.ToInt32(s["Id"]),(s["FromName"]).ToString(),(s["ToName"]).ToString(), (s["Topic"]).ToString(), (s["MessageContent"]).ToString(),(s["Time"]).ToString(),(s["State"]).ToString()));
        }
        return messageList;
    }
    public static Message GetMessageById(int messageId)
    {
        //MyDbEntities db = new MyDbEntities();
        //return db.Products.SingleOrDefault(p => p.Id == id);
        List<Message> messages = GetMessages();
        var query = from m in messages
                    where m.Id == messageId
                    select m;
        return query.SingleOrDefault();
    }
    public static void UpdateMessageState(Message m)
    {
        SqlConnection cn = new SqlConnection(Common.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("update Message set State=@State where Id=@Id", cn);
        cmd.Parameters.AddWithValue("@Id", m.Id);
        cmd.Parameters.AddWithValue("@State", m.State);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }

    public static void DeleteMessage(int id)
    {
        SqlConnection cn = new SqlConnection(Common.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("delete Message where Id = @Id", cn);
        cmd.Parameters.AddWithValue("@Id", id);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }

    //public static DayOff GetDayOffById(int dayOffId)
    //{
    //    SqlDataAdapter da = new SqlDataAdapter("select * from DayOff where @dayOffId = DayOffId ", Common.DbConnecitonstring);
    //    da.SelectCommand.Parameters.AddWithValue("@dayOffId", dayOffId);
    //    DataTable dt = new DataTable();
    //    da.Fill(dt);

    //    if (dt.Rows.Count == 0)
    //    {
    //        return null;
    //    }
    //    else
    //    {
    //        DataRow row = dt.Rows[0];
    //        DayOff member = new DayOff(Convert.ToInt32(row["DayOffId"]), row["Name"].ToString(), row["Type"].ToString()
    //            , row["StartDate"].ToString(), row["StartTime"].ToString(), row["EndDate"].ToString()
    //            , row["EndTime"].ToString(), row["DayOffTime"].ToString(), row["EvidencePic"].ToString(), row["Reason"].ToString()
    //            , row["Approval"].ToString(), row["RejectionReason"].ToString());
    //        return member;
    //    }

    //}
    //public static DayOff GetDayOff(int dayOffId)
    //{
    //    //MyDbEntities db = new MyDbEntities();
    //    //return db.Products.SingleOrDefault(p => p.Id == id);
    //    List<DayOff> dayOffs = GetDayOffs(); ;
    //    var query = from d in dayOffs
    //                where d.DayOffId == dayOffId
    //                select d;
    //    return query.SingleOrDefault();
    //}


    //public static void UpdateDayOffApproval(DayOff d)
    //{
    //    SqlConnection cn = new SqlConnection(Common.DbConnecitonstring);
    //    SqlCommand cmd = new SqlCommand("update DayOff set Approval=@Approval,RejectionReason=@RejectionReason where DayOffId=@DayOffId", cn);
    //    cmd.Parameters.AddWithValue("@DayOffId", d.DayOffId);
    //    cmd.Parameters.AddWithValue("@Approval", d.Approval);
    //    cmd.Parameters.AddWithValue("@RejectionReason", d.RejectionReason);
    //    cn.Open();
    //    cmd.ExecuteNonQuery();
    //    cn.Close();
    //}
    //public static string GetDayOffTime(string startDate, string startTime, string endDate, string endTime)
    //{
    //    string a = startDate;
    //    string[] b = a.Split('/');
    //    int c = int.Parse(b[2]);

    //    string d = endDate;
    //    string[] _e = d.Split('/');
    //    int f = int.Parse(_e[2]);
    //    int g = f - c;

    //    string h = startTime;
    //    string[] i = h.Split(':');
    //    int j = int.Parse(i[0]);


    //    string k = endTime;
    //    string[] l = k.Split(':');
    //    int m = int.Parse(l[0]);

    //    int n = m - j;
    //    if (n == 9)
    //    {
    //        g++;
    //        n = 0;
    //    }
    //    if (g < 0)
    //    {
    //        return $"結束天數不能大於起始天數";
    //    }
    //    else if (n < 0)
    //    {
    //        return "起始不能小於結束時間";
    //    }
    //    else if (n > 4)
    //    {
    //        return $"{g}天{n - 1}小時";
    //    }
    //    else
    //    {
    //        return $"{g}天{n}小時";
    //    }

    //}
    //public static void DeleteDayOff(int dayOffId)
    //{
    //    SqlConnection cn = new SqlConnection(Common.DbConnecitonstring);
    //    SqlCommand cmd = new SqlCommand("delete DayOff where DayOffId = @DayOffId", cn);
    //    cmd.Parameters.AddWithValue("@DayOffId", dayOffId);
    //    cn.Open();
    //    cmd.ExecuteNonQuery();
    //    cn.Close();
    //}
}