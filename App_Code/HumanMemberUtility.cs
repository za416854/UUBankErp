using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HumanMemberUtility
/// </summary>
public class HumanMemberUtility
{
    public static List<HumanMember> GetHumanMembers() {
        SqlDataAdapter da = new SqlDataAdapter(
            "select * from Employee ",Commons.DbConnecitonstring);
        DataTable db = new DataTable();
        da.Fill(db);
        List<HumanMember> HummenList = new List<HumanMember>();
        foreach (DataRow s in db.Rows)
        {
            HummenList.Add(new HumanMember(
                Convert.ToInt32(s["ID"]), s["Email"].ToString(), s["Password"].ToString(), s["Password2"].ToString(),
                s["Name"].ToString(), s["Gender"].ToString(), Convert.ToDateTime(s["Birthday"]).ToString("yyyy/MM/dd"), s["Address"].ToString(), s["CellPhone"].ToString(), s["HomePhone"].ToString(),
                s["Department"].ToString(), s["Position"].ToString(), Convert.ToDateTime(s["HireDay"]).ToString("yyyy/MM/dd"), s["Resignday"]==DBNull.Value?null:Convert.ToDateTime( s["Resignday"]).ToString("yyyy/MM/dd"),Convert.ToInt32( s["Salary"])
                , Convert.ToInt32( s["Extension"]), s["ImageName"].ToString()
                ));

        }
        return HummenList;
    }

    public static HumanMember GetHumanMember(string e,string p)
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select * from Employee where Email = @email and Password2 = @pw2"
            , Commons.DbConnecitonstring);
        da.SelectCommand.Parameters.AddWithValue("@email",e);
        da.SelectCommand.Parameters.AddWithValue("@pw2",p);
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count ==0)
        {
            return null;
        }
        else
        {
            DataRow s = db.Rows[0];
            HumanMember HH =  
            new HumanMember(
               Convert.ToInt32(s["ID"]), s["Email"].ToString(), s["Password"].ToString(), s["Password2"].ToString(),
               s["Name"].ToString(), s["Gender"].ToString(), Convert.ToDateTime(s["Birthday"]).ToString("yyyy/MM/dd"), s["Address"].ToString(), s["CellPhone"].ToString(), s["HomePhone"].ToString(),
               s["Department"].ToString(), s["Position"].ToString(), Convert.ToDateTime(s["HireDay"]).ToString("yyyy/MM/dd"), s["Resignday"] == DBNull.Value ? null : Convert.ToDateTime(s["Resignday"]).ToString("yyyy/MM/dd"), Convert.ToInt32( s["Salary"])
               , Convert.ToInt32( s["Extension"]), s["ImageName"].ToString()
               );
            return HH;
        }





    }

    public static void HumanMemberAdd(HumanMember m)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Insert into Employee values(@email,@password,@password2,@name,@gender,@birthday,@address,@cellphone,@homePhone,@department,@position,@hireDay,@resignday,@salary,@extension,@imageName)"
            , cn);

        cmd.Parameters.AddWithValue("@email",m.Email);
        cmd.Parameters.AddWithValue("@password", m.Password);
        cmd.Parameters.AddWithValue("@password2", m.Password2);
        cmd.Parameters.AddWithValue("@name", m.Name);
        cmd.Parameters.AddWithValue("@gender", m.Gender);
        cmd.Parameters.AddWithValue("@birthday", m.Birthday);
        cmd.Parameters.AddWithValue("@address", m.Address);
        cmd.Parameters.AddWithValue("@cellphone", m.CellPhone);
        cmd.Parameters.AddWithValue("@homePhone", m.HomePhone);
        cmd.Parameters.AddWithValue("@department", m.Department);
        cmd.Parameters.AddWithValue("@position", m.Position);
        cmd.Parameters.AddWithValue("@hireDay", m.HireDay);
        cmd.Parameters.AddWithValue("@resignday", DBNull.Value);
        cmd.Parameters.AddWithValue("@salary", m.Salary);
        cmd.Parameters.AddWithValue("@extension", m.Extension);
        cmd.Parameters.AddWithValue("@imageName", m.ImageName);
        

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }

    public static void HumanMemberEdit(HumanMember m)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("update Employee set Email = @email,Password = @password,Password2 = @password2,Name = @name,Gender = @gender,Birthday = @birthday,Address = @address,CellPhone = @cellphone,HomePhone = @homePhone,Department = @department,Position = @position,HireDay = @hireDay,Resignday = @resignday,Salary = @salary,Extension = @extension,ImageName = @imageName where ID = @id"
            , cn);
        cmd.Parameters.AddWithValue("@id", m.ID);
        cmd.Parameters.AddWithValue("@email", m.Email);
        cmd.Parameters.AddWithValue("@password", m.Password);
        cmd.Parameters.AddWithValue("@password2", m.Password2);
        cmd.Parameters.AddWithValue("@name", m.Name);
        cmd.Parameters.AddWithValue("@gender", m.Gender);
        cmd.Parameters.AddWithValue("@birthday", m.Birthday);
        cmd.Parameters.AddWithValue("@address", m.Address);
        cmd.Parameters.AddWithValue("@cellphone", m.CellPhone);
        cmd.Parameters.AddWithValue("@homePhone", m.HomePhone);
        cmd.Parameters.AddWithValue("@department", m.Department);
        cmd.Parameters.AddWithValue("@position", m.Position);
        cmd.Parameters.AddWithValue("@hireDay", m.HireDay);
        
        if (m.Resignday == "")
        {
            cmd.Parameters.AddWithValue("@resignday", DBNull.Value);
        }
        else if (m.Resignday == null)
        {
            cmd.Parameters.AddWithValue("@resignday", DBNull.Value);
        }else
        {
            cmd.Parameters.AddWithValue("@resignday", m.Resignday);
        }
        cmd.Parameters.AddWithValue("@salary", m.Salary);
        cmd.Parameters.AddWithValue("@extension", m.Extension);
        cmd.Parameters.AddWithValue("@imageName", m.ImageName);


        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    public static void HumanMemberDelete(int id)
    {
        SqlConnection cn = new SqlConnection(Commons.DbConnecitonstring);
        SqlCommand cmd = new SqlCommand("Delete Employee  where ID = @id"
            , cn);

        cmd.Parameters.AddWithValue("@id", id);


        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }

    public static HumanMember SelectPassword2(int id, string email)
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select * from Employee where ID = @id and Email = @email "
            , Commons.DbConnecitonstring);
        da.SelectCommand.Parameters.AddWithValue("@id",id);
        da.SelectCommand.Parameters.AddWithValue("@email", email);
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow s = db.Rows[0];
            HumanMember HH =
            new HumanMember(
               Convert.ToInt32(s["ID"]), s["Email"].ToString(), s["Password"].ToString(), s["Password2"].ToString(),
               s["Name"].ToString(), s["Gender"].ToString(), Convert.ToDateTime(s["Birthday"]).ToString("yyyy/MM/dd"), s["Address"].ToString(), s["CellPhone"].ToString(), s["HomePhone"].ToString(),
               s["Department"].ToString(), s["Position"].ToString(), Convert.ToDateTime(s["HireDay"]).ToString("yyyy/MM/dd"), s["Resignday"] == DBNull.Value ? null : Convert.ToDateTime(s["Resignday"]).ToString("yyyy/MM/dd"), Convert.ToInt32( s["Salary"])
               , Convert.ToInt32( s["Extension"]), s["ImageName"].ToString()
               );
            return HH;
        }





    }

    public static HumanMember CheckEmail(string e)
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select * from Employee where Email = @email "
            , Commons.DbConnecitonstring);
        da.SelectCommand.Parameters.AddWithValue("@email", e);
       
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow s = db.Rows[0];
            HumanMember HH =
            new HumanMember(
               Convert.ToInt32(s["ID"]), s["Email"].ToString(), s["Password"].ToString(), s["Password2"].ToString(),
               s["Name"].ToString(), s["Gender"].ToString(), Convert.ToDateTime(s["Birthday"]).ToString("yyyy/MM/dd"), s["Address"].ToString(), s["CellPhone"].ToString(), s["HomePhone"].ToString(),
               s["Department"].ToString(), s["Position"].ToString(), Convert.ToDateTime(s["HireDay"]).ToString("yyyy/MM/dd"), s["Resignday"] == DBNull.Value ? null : Convert.ToDateTime(s["Resignday"]).ToString("yyyy/MM/dd"), Convert.ToInt32( s["Salary"])
               , Convert.ToInt32( s["Extension"]), s["ImageName"].ToString()
               );
            return HH;
        }





    }

    public static HumanMember EidtHumanMemberPassword(int id, string p)
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select * from Employee where ID = @id and Password2 = @pw2"
            , Commons.DbConnecitonstring);
        da.SelectCommand.Parameters.AddWithValue("@id", id);
        da.SelectCommand.Parameters.AddWithValue("@pw2", p);
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow s = db.Rows[0];
            HumanMember HH =
            new HumanMember(
               Convert.ToInt32(s["ID"]), s["Email"].ToString(), s["Password"].ToString(), s["Password2"].ToString(),
               s["Name"].ToString(), s["Gender"].ToString(), Convert.ToDateTime(s["Birthday"]).ToString("yyyy/MM/dd"), s["Address"].ToString(), s["CellPhone"].ToString(), s["HomePhone"].ToString(),
               s["Department"].ToString(), s["Position"].ToString(), Convert.ToDateTime(s["HireDay"]).ToString("yyyy/MM/dd"), s["Resignday"] == DBNull.Value ? null : Convert.ToDateTime(s["Resignday"]).ToString("yyyy/MM/dd"), Convert.ToInt32(s["Salary"])
               , Convert.ToInt32(s["Extension"]), s["ImageName"].ToString()
               );
            return HH;
        }

    }

    public static HumanMember EidtErpPassword(int id, string p)
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select * from Employee where ID = @id and Password = @pw"
            , Commons.DbConnecitonstring);
        da.SelectCommand.Parameters.AddWithValue("@id", id);
        da.SelectCommand.Parameters.AddWithValue("@pw", p);
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow s = db.Rows[0];
            HumanMember HH =
            new HumanMember(
               Convert.ToInt32(s["ID"]), s["Email"].ToString(), s["Password"].ToString(), s["Password2"].ToString(),
               s["Name"].ToString(), s["Gender"].ToString(), Convert.ToDateTime(s["Birthday"]).ToString("yyyy/MM/dd"), s["Address"].ToString(), s["CellPhone"].ToString(), s["HomePhone"].ToString(),
               s["Department"].ToString(), s["Position"].ToString(), Convert.ToDateTime(s["HireDay"]).ToString("yyyy/MM/dd"), s["Resignday"] == DBNull.Value ? null : Convert.ToDateTime(s["Resignday"]).ToString("yyyy/MM/dd"), Convert.ToInt32(s["Salary"])
               , Convert.ToInt32(s["Extension"]), s["ImageName"].ToString()
               );
            return HH;
        }

    }

    public static HumanMember GetHumanMemberById(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select * from Employee where ID = @id "
            , Commons.DbConnecitonstring);
        da.SelectCommand.Parameters.AddWithValue("@id", id);
        
        DataTable db = new DataTable();
        da.Fill(db);
        if (db.Rows.Count == 0)
        {
            return null;
        }
        else
        {
            DataRow s = db.Rows[0];
            HumanMember HH =
            new HumanMember(
               Convert.ToInt32(s["ID"]), s["Email"].ToString(), s["Password"].ToString(), s["Password2"].ToString(),
               s["Name"].ToString(), s["Gender"].ToString(), Convert.ToDateTime(s["Birthday"]).ToString("yyyy/MM/dd"), s["Address"].ToString(), s["CellPhone"].ToString(), s["HomePhone"].ToString(),
               s["Department"].ToString(), s["Position"].ToString(), Convert.ToDateTime(s["HireDay"]).ToString("yyyy/MM/dd"), s["Resignday"] == DBNull.Value ? null : Convert.ToDateTime(s["Resignday"]).ToString("yyyy/MM/dd"), Convert.ToInt32(s["Salary"])
               , Convert.ToInt32(s["Extension"]), s["ImageName"].ToString()
               );
            return HH;
        }





    }

    public static HumanMember GetHumanMemberByIdAndName(int id,string name)
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select * from Employee where ID = @id and Name = @name "
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
            HumanMember HH =
            new HumanMember(
               Convert.ToInt32(s["ID"]), s["Email"].ToString(), s["Password"].ToString(), s["Password2"].ToString(),
               s["Name"].ToString(), s["Gender"].ToString(), Convert.ToDateTime(s["Birthday"]).ToString("yyyy/MM/dd"), s["Address"].ToString(), s["CellPhone"].ToString(), s["HomePhone"].ToString(),
               s["Department"].ToString(), s["Position"].ToString(), Convert.ToDateTime(s["HireDay"]).ToString("yyyy/MM/dd"), s["Resignday"] == DBNull.Value ? null : Convert.ToDateTime(s["Resignday"]).ToString("yyyy/MM/dd"), Convert.ToInt32(s["Salary"])
               , Convert.ToInt32(s["Extension"]), s["ImageName"].ToString()
               );
            return HH;
        }





    }
}