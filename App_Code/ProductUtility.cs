using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductUtility
/// </summary>
public class ProductUtility 
{
    public static void AddProduct(Sponsor p)
    {
        DatabaseEntities db = new DatabaseEntities();
        db.Sponsors.Add(p);
        db.SaveChanges();
    }

    public static void UpdateProduct(Sponsor p)
    {
        DatabaseEntities db = new DatabaseEntities();
        db.Entry(p).State = System.Data.Entity.EntityState.Modified;
        db.SaveChanges();
    }

    public static void DeleteProduct(int waterid)
    {
        DatabaseEntities db = new DatabaseEntities();
        Sponsor p = db.Sponsors.SingleOrDefault(sb => sb.Waterid == waterid);
        db.Sponsors.Remove(p);
        db.SaveChanges();
    }

    public static List<Sponsor> GetProducts()
    {
        DatabaseEntities db = new DatabaseEntities();
        return db.Sponsors.ToList();
    }

    public static Sponsor GetProduct(string productName)
    {
        DatabaseEntities db = new DatabaseEntities();
        Sponsor p = db.Sponsors.SingleOrDefault(s => s.ProductName==productName);
        return p;
    }
    public static Sponsor GetProduct(int waterid)
    {
        DatabaseEntities db = new DatabaseEntities();
        Sponsor p = db.Sponsors.SingleOrDefault(s => s.Waterid == waterid);
        return p;
    }

    public static List<Sponsor> GetcheckProducts()
    {
        DatabaseEntities db = new DatabaseEntities();
        List<Sponsor> p = db.Sponsors.Where(s => s.Check == "").ToList();
        return p;
    }
    public static void AddCountNow(int waterid, int upc)
    {
        Sponsor os = ProductUtility.GetProduct(waterid);
        os.PDCountNow = os.PDCountNow + upc;
        ProductUtility.UpdateProduct(os);
      
    }
    public static void DeleteCountNow(int waterid, int upc)
    {
        Sponsor os = ProductUtility.GetProduct(waterid);
        os.PDCountNow = os.PDCountNow - upc;
        ProductUtility.UpdateProduct(os);

    }

    public static string UseYesOrNo(int waterid)
    {
        Sponsor SP = ProductUtility.GetProduct(waterid);

        if (SP.PDStatus)
        {
            return "Yes";
        }
        else
        {
            return "No";
        }
    }

    public static DataTable GetALLproducts()
    {
        SqlDataAdapter da = new SqlDataAdapter(
        "select  * from Sponsors where Sponsors.[Check] = 'Agree'",
        @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UUUBankErp.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"
        );
        //da.SelectCommand.Parameters.AddWithValue("@Id", id);
        DataTable dt = new DataTable("Myshop");

        da.Fill(dt);
        return dt;
    }


}