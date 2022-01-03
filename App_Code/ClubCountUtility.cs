using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClubCountUtility
/// </summary>
public class ClubCountUtility
{
    public static void AddClub(ClubCount c)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Insert into ClubCount(ClubCount)  " +
            "values(@clubCount)", cn);
        cmd.Parameters.AddWithValue("@clubCount", c.Clubcount);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    public static List<ClubCount> GetClubList()
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from ClubCount", cn);
        DataTable db = new DataTable();
        da.Fill(db);
        List<ClubCount> clublist = new List<ClubCount>();
        foreach (DataRow r in db.Rows)
        {
            clublist.Add(new ClubCount(Convert.ToInt32(r["Id"]), Convert.ToInt32(r["ClubCount"])));
        }
        return clublist;
    }


    public static ClubCount GetClub(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("Select * from ClubCount where Id = @id", cn);
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
            ClubCount club =
           new ClubCount(Convert.ToInt32(r["Id"]), Convert.ToInt32(r["ClubCount"]));
            return club;
        }


    }

    public static void EditClub(ClubCount c)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("update ClubCount set ClubCount = @clubCount where Id = @id ", cn);
        cmd.Parameters.AddWithValue("@id", c.Id);
        cmd.Parameters.AddWithValue("@clubCount", c.Clubcount);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    public static void DeleteClub(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Delete ClubCount where Id = @id", cn);

        cmd.Parameters.AddWithValue("@id", id);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

    }

    public static ClubCount GetClubTOPONE()
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlDataAdapter da = new SqlDataAdapter("select top 1 * from ClubCount order by Id desc ", cn);
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow r = db.Rows[0];
            ClubCount ClubCount =
            new ClubCount(Convert.ToInt32(r["Id"]), Convert.ToInt32(r["ClubCount"]));
            return ClubCount;
        }

    }
}