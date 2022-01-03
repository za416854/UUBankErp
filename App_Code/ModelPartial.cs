using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Partial，之後整合再用
/// </summary>
//public partial class Member
//{
//    public Member(int id, string userName, string password, string email)
//    {
//        this.Id = id;
//        this.UserName = userName;
//        this.Password = password;
//        this.Email = email;
//    }

//    public Member() { }
//}

//public partial class Product
//{
//    public Product(int id, string name, int price, string imageFileName)
//    {
//        this.Id = id;
//        this.Name = name;
//        this.Price = price;
//        this.ImageFileName = imageFileName;
//    }
//    public Product()
//    {
//    }
//}

public partial class Sponsor
{
    
    public Sponsor(int waterid,int id, string productName, int price, int? limitCount, string productInFo, string sayST, string imgFileName1, string imgFileName2, string imgFileName3, string check, bool pdstatus, int pdcountnow,string rjresult)
    {
        this.Waterid = waterid;
        this.Id = id;
        this.ProductName = productName;
        this.Price = price;
        this.LimitCount = limitCount;
        this.ProductInFo = productInFo;
        this.SayST = sayST;
        this.ImgFileName1 = imgFileName1;
        this.ImgFileName2 = imgFileName2;
        this.ImgFileName3 = imgFileName3;
        this.Check = check;
        this.PDStatus = pdstatus;
        this.PDCountNow = pdcountnow;
        this.RJresult = rjresult;
    }


    public Sponsor() { }
}

public partial class Employee 
{
    public Employee(int iD, string email, string password, string password2, string name, string gender, DateTime birthday, string address, string cellPhone, string homePhone, string department, string position, DateTime hireDay, DateTime? resignday, int salary, int extension, string imageName)
    {
        ID = iD;
        Email = email;
        Password = password;
        Password2 = password2;
        Name = name;
        Gender = gender;
        Birthday = birthday;
        Address = address;
        CellPhone = cellPhone;
        HomePhone = homePhone;
        Department = department;
        Position = position;
        HireDay = hireDay;
        Resignday = resignday;
        Salary = salary;
        Extension = extension;
        ImageName = imageName;
    }
    public Employee() { }
}

public partial class Cart{
    public Cart(int cartId, int id, int waterid, int count)
    {
        CartId = cartId;
        Id = id;
        Waterid = waterid;
        Count = count;
    }
    public Cart() { }
}