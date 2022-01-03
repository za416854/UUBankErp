using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AuthorityUtility
/// </summary>
public class AuthorityUtility
{
    public static Authority GetAuthority(int id, string name)
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select * from Authority where Id = @id and Name = @name"
            , Commons.DbConnecitonstring);
        da.SelectCommand.Parameters.AddWithValue("@id", id);
        da.SelectCommand.Parameters.AddWithValue("@name", name);
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow s = db.Rows[0];
            Authority AA =
             new Authority(Convert.ToInt32(s["Id"]), s["Name"].ToString(), Convert.ToBoolean(s["Login"]), Convert.ToBoolean(s["Search"]),
             Convert.ToBoolean(s["AddEM"]), Convert.ToBoolean(s["EditDelete"]), Convert.ToBoolean(s["EditAU"]), Convert.ToBoolean(s["AskForLeave"]),
             Convert.ToBoolean(s["Clock"]), Convert.ToBoolean(s["ShopManager"]), Convert.ToBoolean(s["ClubManager"]),Convert.ToBoolean(s["MeetingRoom"]));
            return AA;
        }

    }

    public static void AuthorityAdd(Authority h)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        //SqlCommand cmd = new SqlCommand("Insert into Authority values(@name,@login,@search,@add,@editDelete,@editAU,@editAU,@askForLeave,@clock,@shopManager,@clubManager)"
        //    , cn);
        SqlCommand cmd = new SqlCommand("Insert into Authority(Name,Login,Search,AddEM,EditDelete,EditAU,AskForLeave,Clock,ShopManager,ClubManager,MeetingRoom) values(@name,@login,@search,@add,@editDelete,@editAU,@askForLeave,@clock,@shopManager,@clubManager,@meetingRoom)"
            , cn);
        cmd.Parameters.AddWithValue("@name", h.Name);
        cmd.Parameters.AddWithValue("@login", h.Login);
        cmd.Parameters.AddWithValue("@search", h.Search);
        cmd.Parameters.AddWithValue("@add", h.AddEM);
        cmd.Parameters.AddWithValue("@editDelete", h.EditDelete);
        cmd.Parameters.AddWithValue("@editAU", h.EditAU);
        cmd.Parameters.AddWithValue("@askForLeave", h.AskForLeave);
        cmd.Parameters.AddWithValue("@clock", h.Clock);
        cmd.Parameters.AddWithValue("@shopManager",h.ShopManager);
        cmd.Parameters.AddWithValue("@clubManager", h.ClubManager);
        cmd.Parameters.AddWithValue("@meetingRoom", h.MeetingRoom);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }

    public static void AuthorityEdit(Authority h)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("update Authority set Name = @name,Login = @login,Search = @search, AddEM = @addem,EditDelete = @editDelete, EditAU = @editAU,AskForLeave = @askForLeave,Clock =@clock,ShopManager = @shopManager,ClubManager = @clubManager,MeetingRoom = @meetingRoom  where Id = @id"
            , cn);
        cmd.Parameters.AddWithValue("@id", h.Id);
        cmd.Parameters.AddWithValue("@name", h.Name);
        cmd.Parameters.AddWithValue("@login", h.Login);
        cmd.Parameters.AddWithValue("@search", h.Search);
        cmd.Parameters.AddWithValue("@addem", h.AddEM);
        cmd.Parameters.AddWithValue("@editDelete", h.EditDelete);
        cmd.Parameters.AddWithValue("@editAU", h.EditAU);
        cmd.Parameters.AddWithValue("@askForLeave", h.AskForLeave);
        cmd.Parameters.AddWithValue("@clock", h.Clock);
        cmd.Parameters.AddWithValue("@shopManager", h.ShopManager);
        cmd.Parameters.AddWithValue("@clubManager", h.ClubManager);
        cmd.Parameters.AddWithValue("@meetingRoom",h.MeetingRoom);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }

    public static void AuthorityrDelete(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Delete Authority where Id = @id"
            , cn);

        cmd.Parameters.AddWithValue("@id", id);


        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }

    public static List<Authority> GetAuthoritys()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select * from Authority "
            , Commons.DbConnecitonstring);
        DataTable db = new DataTable();
        da.Fill(db);
        List<Authority> authoritylist = new List<Authority>();
        foreach (DataRow s in db.Rows)
        {

            authoritylist.Add(new Authority(Convert.ToInt32(s["Id"]), s["Name"].ToString(), Convert.ToBoolean(s["Login"]), Convert.ToBoolean(s["Search"]),
             Convert.ToBoolean(s["AddEM"]), Convert.ToBoolean(s["EditDelete"]), Convert.ToBoolean(s["EditAU"]), Convert.ToBoolean(s["AskForLeave"]),
             Convert.ToBoolean(s["Clock"]), Convert.ToBoolean(s["ShopManager"]), Convert.ToBoolean(s["ClubManager"]), Convert.ToBoolean(s["MeetingRoom"])));
        }

        return authoritylist;
    }

}