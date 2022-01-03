using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TemporaryClubUtility
/// </summary>
public class TemporaryClubUtility
{
    public static void AddClub(TemporaryClub c)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Insert into ClubTemporary(ClubName,ClubFounderId,ClubFounderName,ClubScript,DetailClubScript,PeopleCount,ClubImage,Approve)" +
            "values(@clubname,@clubfounderid,@clubfoundername,@clubscript,@detailclubscript,@peoplecount,@clubimage,@approve)", cn);
        cmd.Parameters.AddWithValue("@clubname", c.ClubName2);
        cmd.Parameters.AddWithValue("@clubfounderid", c.ClubFounderId2);
        cmd.Parameters.AddWithValue("@clubfoundername", c.ClubFounderName2);
        cmd.Parameters.AddWithValue("@clubscript", c.ClubScript2);
        cmd.Parameters.AddWithValue("@detailclubscript", c.DetailClubScript2);
        cmd.Parameters.AddWithValue("@peoplecount", c.PeopleCount2);
        cmd.Parameters.AddWithValue("@clubimage", c.ClubImage2);
        cmd.Parameters.AddWithValue("@approve", c.Approve2);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    public static List<TemporaryClub> GetClubList()
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from ClubTemporary", cn);
        DataTable db = new DataTable();
        da.Fill(db);
        List<TemporaryClub> clublist = new List<TemporaryClub>();
        foreach (DataRow r in db.Rows)
        {
            clublist.Add(new TemporaryClub(Convert.ToInt32(r["Id"]), r["ClubName"].ToString(), Convert.ToInt32(r["ClubFounderId"]), r["ClubFounderName"].ToString(), r["ClubScript"].ToString(), r["DetailClubScript"].ToString(), Convert.ToInt32(r["PeopleCount"]), r["ClubImage"].ToString(), Convert.ToBoolean(r["Approve"])));
        }
        return clublist;
    }


    public static TemporaryClub GetClub(string name)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from ClubTemporary where ClubName = @clubname", cn);
        da.SelectCommand.Parameters.AddWithValue("@clubname", name);
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow r = db.Rows[0];
            TemporaryClub club =
            new TemporaryClub(Convert.ToInt32(r["Id"]), r["ClubName"].ToString(), Convert.ToInt32(r["ClubFounderId"]), r["ClubFounderName"].ToString(), r["ClubScript"].ToString(), r["DetailClubScript"].ToString(), Convert.ToInt32(r["PeopleCount"]), r["ClubImage"].ToString(), Convert.ToBoolean(r["Approve"]));
            return club;
        }


    }


    public static TemporaryClub GetClubbyid(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from ClubTemporary where Id = @id", cn);
        da.SelectCommand.Parameters.AddWithValue("@id", id);
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow r = db.Rows[0];
            TemporaryClub club =
            new TemporaryClub(Convert.ToInt32(r["Id"]), r["ClubName"].ToString(), Convert.ToInt32(r["ClubFounderId"]), r["ClubFounderName"].ToString(), r["ClubScript"].ToString(), r["DetailClubScript"].ToString(), Convert.ToInt32(r["PeopleCount"]), r["ClubImage"].ToString(), Convert.ToBoolean(r["Approve"]));
            return club;
        }


    }



    public static void EditClub(TemporaryClub c)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("update ClubTemporary set ClubName = @clubname,ClubFounderId = @clubfounderid,ClubFounderName = @clubfoundername,ClubScript = @clubscript,DetailClubScript = @detailclubscript,PeopleCount = @peoplecount,ClubImage = @clubimage,Approve =@approve where Id = @id", cn);
        cmd.Parameters.AddWithValue("@id", c.Id2);
        cmd.Parameters.AddWithValue("@clubname", c.ClubName2);
        cmd.Parameters.AddWithValue("@clubfounderid", c.ClubFounderId2);
        cmd.Parameters.AddWithValue("@clubfoundername", c.ClubFounderName2);
        cmd.Parameters.AddWithValue("@clubscript", c.ClubScript2);
        cmd.Parameters.AddWithValue("@detailclubscript", c.DetailClubScript2);
        cmd.Parameters.AddWithValue("@peoplecount", c.PeopleCount2);
        cmd.Parameters.AddWithValue("@clubimage", c.ClubImage2);
        cmd.Parameters.AddWithValue("@approve", c.Approve2);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    public static void DeleteClub(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Delete ClubTemporary where Id = @id", cn);

        cmd.Parameters.AddWithValue("@id", id);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }


    public static void DeleteClubByname(string name)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Delete ClubTemporary where ClubName = @name", cn);

        cmd.Parameters.AddWithValue("@name", name);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
}