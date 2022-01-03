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
public class CartUtility 
{
    public static void AddCart(Cart c)
    {
        DatabaseEntities db = new DatabaseEntities();
        db.Carts.Add(c);
        db.SaveChanges();
    }
    //更新
    public static void UpdateCart(Cart c)
    {
        DatabaseEntities db = new DatabaseEntities();
        db.Entry(c).State = System.Data.Entity.EntityState.Modified;
        db.SaveChanges();
    }
    //退車
    public static void DeleteCartByIdWaterid(int id,int waterid)
    {
        DatabaseEntities db = new DatabaseEntities();
        Cart c = db.Carts.SingleOrDefault(sb => sb.Id == id && sb.Waterid==waterid);
        Sponsor SP = ProductUtility.GetProduct(waterid);
        ProductUtility.DeleteCountNow(waterid, c.Count);
        db.Carts.Remove(c);
        db.SaveChanges();
    }

    //when 不發車時刪除用
    public static void DeleteCartByWaterid(int waterid)
    {
        DatabaseEntities db = new DatabaseEntities();
        List<Cart> c = db.Carts.Where(sb => sb.Waterid == waterid).ToList();

        foreach (var item in c)
        {
            db.Carts.Remove(item);
            db.SaveChanges();
        }
    }
    //用不到
    //public static int GetNowCount(int waterid)
    //{
    //    DatabaseEntities db = new DatabaseEntities();
    //    List<Cart> c = db.Carts.Where(s => s.Waterid == waterid).ToList();
    //    int count = 0;
    //    foreach (Cart item in c)
    //    {
    //        count += item.Count;
    //    }

    //    return count;
    //}

    public static Cart GetoneCartById(int id)
    {
        DatabaseEntities db = new DatabaseEntities();
        Cart c = db.Carts.SingleOrDefault(s => s.Id==id);
        return c;
    }
    public static void DeleteCartByCId(int Cid)
    {
        DatabaseEntities db = new DatabaseEntities();
        Cart c = db.Carts.SingleOrDefault(s => s.CartId == Cid);
        Sponsor SP = ProductUtility.GetProduct(c.Waterid);
        ProductUtility.DeleteCountNow(c.Waterid, c.Count);
        db.Carts.Remove(c);
        db.SaveChanges();

    }
    public static Cart GetoneCartById(int id ,int waterid)
    {
        DatabaseEntities db = new DatabaseEntities();
        Cart c = db.Carts.SingleOrDefault(s => s.Id == id && s.Waterid== waterid);
        return c;
    }
    public static List<Cart> GetCartsById(int id)
    {
        DatabaseEntities db = new DatabaseEntities();
        List<Cart> c = db.Carts.Where(s => s.Id == id).ToList();
        return c;
    }
    public static int GetTotalPrice(int waterid, int id) 
    {
        DatabaseEntities db = new DatabaseEntities();
        int  price = db.Sponsors.SingleOrDefault(a => a.Waterid == waterid ).Price;
        int BuyCount = db.Carts.SingleOrDefault(a => a.Waterid == waterid && a.Id == id).Count;
        int total = price * BuyCount;
        return total;
    }

    public static DataTable GetMyshopCartF(int id) 
    {
        SqlDataAdapter da = new SqlDataAdapter(
        "select Cart.CartId,Cart.Id AS buyerid,Sponsors.Id AS Spid,Sponsors.ProductName,Sponsors.LimitCount,Cart.Count,Cart.Waterid,Sponsors.Price,Sponsors.ProductInFo,Sponsors.ImgFileName1,Sponsors.PDStatus,Sponsors.PDCountNow,Employee.Name,Employee.CellPhone,Employee.Email from Sponsors INNER JOIN Cart ON Sponsors.Waterid = Cart.Waterid INNER JOIN Employee ON Sponsors.Id = Employee.ID where Cart.Id=@Id and Sponsors.PDStatus = 'False'",
        @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UUUBankErp.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"
        );
        da.SelectCommand.Parameters.AddWithValue("@Id", id);
        DataTable dt = new DataTable("Myshop");
        
        da.Fill(dt);
        return dt;
    }
    public static DataTable GetMyshopCartT(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter(
        "select Cart.Id AS buyerid,Sponsors.Id AS Spid,Sponsors.ProductName,Sponsors.LimitCount,Cart.Count,Cart.Waterid,Sponsors.Price,Sponsors.ProductInFo,Sponsors.ImgFileName1,Sponsors.PDStatus,Sponsors.PDCountNow,Employee.Name,Employee.CellPhone,Employee.Email from Sponsors INNER JOIN Cart ON Sponsors.Waterid = Cart.Waterid INNER JOIN Employee ON Sponsors.Id = Employee.ID where Cart.Id=@Id and Sponsors.PDStatus = 'True'",
        @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UUUBankErp.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"
        );
        da.SelectCommand.Parameters.AddWithValue("@Id", id);
        DataTable dt = new DataTable("Myshop");

        da.Fill(dt);
        return dt;
    }
    public static DataTable Getgocarlist(int waterid)
    {
        SqlDataAdapter da = new SqlDataAdapter(
        "select Cart.Id AS buyerid,Sponsors.Id AS Spid,Sponsors.ProductName,Sponsors.LimitCount,Cart.Count,Cart.Waterid,Sponsors.Price,Sponsors.ProductInFo,Sponsors.ImgFileName1,Sponsors.PDStatus,Sponsors.PDCountNow,Employee.Name,Employee.CellPhone,Employee.Email from Sponsors INNER JOIN Cart ON Sponsors.Waterid = Cart.Waterid INNER JOIN Employee ON Sponsors.Id = Employee.ID where Cart.Id=@Id and Sponsors.PDStatus = 'True'",
        @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UUUBankErp.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"
        );
        da.SelectCommand.Parameters.AddWithValue("@Waterid", waterid);
        DataTable dt = new DataTable("Myshop");

        da.Fill(dt);
        return dt;
    }


    //public static Sponsor GetProduct(int waterid)
    //{
    //    DatabaseEntities db = new DatabaseEntities();
    //    Sponsor p = db.Sponsors.SingleOrDefault(s => s.Waterid == waterid);
    //    return p;
    //}

    //public static List<Sponsor> GetcheckProducts()
    //{
    //    DatabaseEntities db = new DatabaseEntities();
    //    List<Sponsor> p = db.Sponsors.Where(s => s.Check == "").ToList();
    //    return p;
    //}
}