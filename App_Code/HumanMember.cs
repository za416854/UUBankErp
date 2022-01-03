using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HumanMember
/// </summary>
public class HumanMember
{
    public HumanMember(int iD, string email, string password, string password2, string name, string gender, string birthday, string address, string cellPhone, string homePhone, string department, string position, string hireDay, string resignday, int salary, int extension, string imageName)
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
    public HumanMember() { }
    public int ID { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
    public string Password2 { get; set; }
    public string Name { get; set; }
    public string Gender { get; set; }
    public string Birthday { get; set; }
    public string Address { get; set; }
    public string CellPhone { get; set; }
    public string HomePhone { get; set; }
    public string Department { get; set; }
    public string Position { get; set; }
    public string HireDay { get; set; }
    public string Resignday { get; set; }
    public int Salary { get; set; }
    public int Extension { get; set; }
    public string ImageName { get; set; }
}
