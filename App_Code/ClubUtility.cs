using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for ClubUtility
/// </summary>
public class ClubUtility
{
   public static void AddClub(Club c)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Insert into Club(ClubName,ClubFounderId,ClubFounderName,ClubScript,DetailClubScript,PeopleCount,ClubCount,ClubImage)  " +
            "values(@clubname,@clubfounderid,@clubfoundername,@clubscript,@detailclubscript,@peoplecount,@clubCount ,@clubimage)", cn);
        cmd.Parameters.AddWithValue("@clubname", c.ClubName);
        cmd.Parameters.AddWithValue("@clubfounderid", c.ClubFounderId);
        cmd.Parameters.AddWithValue("@clubfoundername", c.ClubFounderName);
        cmd.Parameters.AddWithValue("@clubscript", c.ClubScript);
        cmd.Parameters.AddWithValue("@detailclubscript", c.DetailClubScript);
        cmd.Parameters.AddWithValue("@peoplecount", c.PeopleCount);
        cmd.Parameters.AddWithValue("@clubCount", c.ClubCount);
        cmd.Parameters.AddWithValue("@clubimage", c.ClubImage);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    public static List<Club> GetClubList()
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from Club",cn);
        DataTable db = new DataTable();
        da.Fill(db);
        List<Club> clublist = new List<Club>();
        foreach (DataRow r in db.Rows)
        {
            clublist.Add(new Club(Convert.ToInt32(r["Id"]), r["ClubName"].ToString(), Convert.ToInt32(r["ClubFounderId"]),
                r["ClubFounderName"].ToString(), r["ClubScript"].ToString(), r["DetailClubScript"].ToString(), Convert.ToInt32(r["PeopleCount"]),Convert.ToInt32(r["ClubCount"]),
               r["ClubImage"].ToString()));
        }
        return clublist;
    }


    public static Club GetClub(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from Club where Id = @id", cn);
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
            Club club =
            new Club(Convert.ToInt32(r["Id"]), r["ClubName"].ToString(), Convert.ToInt32(r["ClubFounderId"]),
                 r["ClubFounderName"].ToString(), r["ClubScript"].ToString(), r["DetailClubScript"].ToString(), Convert.ToInt32(r["PeopleCount"]),Convert.ToInt32(r["ClubCount"]),
                r["ClubImage"].ToString());
            return club;
        }

        
    }


    public static Club GetClubByName(string name)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from Club where ClubName = @name", cn);
        da.SelectCommand.Parameters.AddWithValue("@name", name);
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow r = db.Rows[0];
            Club club =
            new Club(Convert.ToInt32(r["Id"]), r["ClubName"].ToString(), Convert.ToInt32(r["ClubFounderId"]),
                 r["ClubFounderName"].ToString(), r["ClubScript"].ToString(), r["DetailClubScript"].ToString(), Convert.ToInt32(r["PeopleCount"]), Convert.ToInt32(r["ClubCount"]),
                r["ClubImage"].ToString());
            return club;
        }


    }


    public static void EditClub(Club c)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("update Club set ClubName = @clubname,ClubFounderId = @clubfounderid,ClubFounderName = @clubfoundername,ClubScript = @clubscript,DetailClubScript = @detailclubscript,PeopleCount = @peoplecount,ClubCount = @clubCount,ClubImage = @clubimage where Id = @id ", cn);
        cmd.Parameters.AddWithValue("@id", c.Id);
        cmd.Parameters.AddWithValue("@clubname", c.ClubName);
        cmd.Parameters.AddWithValue("@clubfounderid", c.ClubFounderId);
        cmd.Parameters.AddWithValue("@clubfoundername", c.ClubFounderName);
        cmd.Parameters.AddWithValue("@clubscript", c.ClubScript);
        cmd.Parameters.AddWithValue("@detailclubscript", c.DetailClubScript);
        cmd.Parameters.AddWithValue("@peoplecount", c.PeopleCount);
        cmd.Parameters.AddWithValue("@clubimage", c.ClubImage);
        cmd.Parameters.AddWithValue("@clubCount", c.ClubCount);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    public static void DeleteClub(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Delete Club where Id = @id", cn);

        cmd.Parameters.AddWithValue("@id", id);
        
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }

    public static Club GetClubTOPONE()
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("select top 1 * from Club order by Id desc ", cn);
        DataTable db = new DataTable();
        da.Fill(db);
        //if (db.Rows.Count == 0)
        //{
        //    return 0;
        //}
        //else
        //{
        //    DataRow r = db.Rows[0];

        //    return Convert.ToInt32(r["Id"]);
        //}
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow r = db.Rows[0];
            Club club =
            new Club(Convert.ToInt32(r["Id"]), r["ClubName"].ToString(), Convert.ToInt32(r["ClubFounderId"]),
                 r["ClubFounderName"].ToString(), r["ClubScript"].ToString(), r["DetailClubScript"].ToString(), Convert.ToInt32(r["PeopleCount"]), Convert.ToInt32(r["ClubCount"]),
                r["ClubImage"].ToString());
            return club;
        }

    }
}